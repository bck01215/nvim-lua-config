-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Parity with VSCode "editor.wordWrap": "on"
vim.opt.wrap = true

-- Let Claude Code / OpenCode / git edit files on disk without Neovim showing stale buffers
vim.opt.autoread = true
