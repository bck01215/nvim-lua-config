
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.NvimTreeFocus)
vim.keymap.set("n", "<leader>pf", vim.cmd.NvimTreeFindFile)
vim.keymap.set("n", "<leader>pt", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<C-t>", vim.cmd.tabnew)
vim.keymap.set("n", "<C-w>", vim.cmd.tabc)
vim.keymap.set("n", "<C-Right>", vim.cmd.tabn)
vim.keymap.set("n", "<C-Left>", vim.cmd.tabp)

