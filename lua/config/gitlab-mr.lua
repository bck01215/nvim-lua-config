local M = {}

function M.open()
  local function notify(message)
    vim.notify(message, vim.log.levels.WARN, { title = "GitLab MR" })
  end

  if vim.fn.executable("glab") ~= 1 then
    notify("Install glab and authenticate with glab auth login first.")
    return
  end

  -- Normal files use their repository, while Git scratch buffers use the window cwd.
  local name = vim.api.nvim_buf_get_name(0)
  local cwd = vim.fn.getcwd()
  if vim.bo.buftype == "" and name ~= "" and not name:match("^%w+://") then
    cwd = vim.fs.dirname(name)
  end

  local function lookup(sha)
    if not sha or sha == "" then
      return
    end
    sha = vim.trim(sha)
    if not sha:match("^%x+$") or #sha < 7 or #sha > 40 or sha:match("^0+$") then
      notify("Enter a Git commit SHA (7–40 hexadecimal characters).")
      return
    end

    vim.system({ "glab", "api", "projects/:id/repository/commits/" .. sha .. "/merge_requests" }, {
      cwd = cwd,
      text = true,
      timeout = 30000,
    }, vim.schedule_wrap(function(result)
      if result.code ~= 0 then
        notify(vim.trim(result.stderr or "") ~= "" and vim.trim(result.stderr) or "GitLab lookup failed.")
        return
      end
      local ok, mrs = pcall(vim.json.decode, result.stdout)
      if not ok or type(mrs) ~= "table" or not vim.islist(mrs) then
        notify("GitLab returned an unexpected response.")
        return
      end
      if #mrs == 0 then
        notify("No merge request found for commit " .. sha .. ".")
        return
      end
      local function open(mr)
        if mr and type(mr.web_url) == "string" then
          vim.ui.open(mr.web_url)
        end
      end
      if #mrs == 1 then
        open(mrs[1])
      else
        vim.ui.select(mrs, {
          prompt = "GitLab merge request:",
          format_item = function(mr)
            return string.format("!%s %s (%s)", mr.iid, mr.title, mr.state)
          end,
        }, open)
      end
    end))
  end

  local word = vim.fn.expand("<cword>")
  if word:match("^%x+$") and #word >= 7 and #word <= 40 then
    lookup(word)
  elseif vim.bo.buftype == "" and name ~= "" and not name:match("^%w+://") then
    local line = vim.api.nvim_win_get_cursor(0)[1]
    vim.system({ "git", "blame", "--porcelain", "-L", line .. "," .. line, "--", vim.fs.basename(name) }, {
      cwd = cwd,
      text = true,
      timeout = 10000,
    }, vim.schedule_wrap(function(result)
      if result.code ~= 0 then
        notify(vim.trim(result.stderr or "") ~= "" and vim.trim(result.stderr) or "Git blame failed.")
        return
      end
      local sha = (result.stdout or ""):match("^(%x+)%s")
      if not sha or sha:match("^0+$") then
        notify("This line is uncommitted; no merge request to open.")
        return
      end
      lookup(sha)
    end))
  else
    vim.ui.input({ prompt = "GitLab MR commit SHA: " }, lookup)
  end
end

return M
