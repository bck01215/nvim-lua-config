-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Notice file changes made outside Neovim (Claude Code, OpenCode, git checkout, etc.)
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold" }, {
  group = vim.api.nvim_create_augroup("checktime_external_edits", { clear = true }),
  command = "if mode() != 'c' | checktime | endif",
})

-- Save modified buffers when leaving insert mode with Escape.
vim.api.nvim_create_autocmd("InsertLeave", {
  group = vim.api.nvim_create_augroup("save_on_insert_leave", { clear = true }),
  callback = function()
    if vim.bo.modified and vim.bo.modifiable then
      vim.cmd("silent update")
    end
  end,
})

-- Astral's `ty` as the Python type checker instead of Pyright/basedpyright.
-- Plain vim.lsp.start, independent of lspconfig/mason, since `ty` has no official
-- lspconfig entry yet (see lua/plugins/python.lua for the pyright-disabling half of this).
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("ty_lsp", { clear = true }),
  pattern = "python",
  callback = function(args)
    if vim.fn.executable("ty") == 0 then
      return
    end
    vim.lsp.start({
      name = "ty",
      cmd = { "ty", "server" },
      root_dir = vim.fs.root(args.buf, { "pyproject.toml", "ty.toml", ".git" }) or vim.fn.getcwd(),
    })
  end,
})
