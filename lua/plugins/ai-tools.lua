-- Claude Code and OpenCode as toggleable floating terminals.
-- Mirrors the VSCode setup: Shift+Cmd+I opened the Claude Code panel there;
-- here it's <leader>ac (no LazyVim default claims this), with <leader>ao for OpenCode.
return {
  {
    "akinsho/toggleterm.nvim",
    opts = {},
    keys = function()
      local Terminal = require("toggleterm.terminal").Terminal

      local claude = Terminal:new({ cmd = "claude", direction = "float", hidden = true })
      local opencode = Terminal:new({ cmd = "opencode", direction = "float", hidden = true })

      return {
        { "<leader>ac", function() claude:toggle() end, desc = "Claude Code" },
        { "<leader>ao", function() opencode:toggle() end, desc = "OpenCode" },
      }
    end,
  },
}
