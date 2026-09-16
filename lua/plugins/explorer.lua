local function focus_or_toggle_explorer()
  local explorer = Snacks.picker.get({ source = "explorer" })[1]
  if explorer and not explorer:is_focused() then
    explorer:focus()
  else
    Snacks.explorer({ cwd = LazyVim.root() })
  end
end

return {
  "folke/snacks.nvim",
  opts = {
      picker = {
        sources = {
          files = {
            hidden = true,
          },
          explorer = {
            hidden = true,
            ignored = true,
        },
      },
      previewers = {
        -- "fancy" treesitter-highlights every diff line; on a large file
        -- (e.g. a multi-MB generated report) that freezes the UI for
        -- 20-30s. "terminal" renders via `git diff`'s own output instead.
        diff = { style = "terminal" },
      },
    },
  },
  keys = {
    { "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete Buffer (Preserve Layout)" },
    { "<leader>e", focus_or_toggle_explorer, desc = "Explorer Snacks (root dir)" },
    {
      "<leader>fF",
      function() Snacks.picker.files({ root = false, hidden = true, ignored = true }) end,
      desc = "Find Files (cwd, incl. untracked/gitignored)",
    },
  },
}
