-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
-- Note: "save without formatting" from VSCode (Alt+Cmd+S) has a LazyVim default
-- already: <leader>uf toggles format-on-save, so no custom mapping needed there.

-- VSCode Cmd+K S: save all open buffers
vim.keymap.set("n", "<leader>fA", "<cmd>wa<cr>", { desc = "Save All" })

-- VSCode "mk12.better-git-line-blame": toggle inline current-line blame
vim.keymap.set("n", "<leader>gB", "<cmd>Gitsigns toggle_current_line_blame<cr>", { desc = "Toggle Git Blame Line" })

-- VSCode terminal Shift+Enter: send newline without submitting (useful inside
-- the Claude Code / OpenCode floating terminals for multi-line input)
vim.keymap.set("t", "<S-CR>", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc><CR>", true, true, true), "n", false)
end, { desc = "Terminal: newline without submit" })
