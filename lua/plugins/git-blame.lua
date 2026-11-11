return {
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = false,
        delay = 300,
      },
      current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> — <summary>",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      -- Keep LazyVim's progress/location and clock to the right of blame.
      table.insert(opts.sections.lualine_x, {
        function()
          local blame = vim.b.gitsigns_blame_line or ""
          if vim.fn.strchars(blame) > 70 then
            blame = vim.fn.strcharpart(blame, 0, 69) .. "…"
          end
          return blame
        end,
      })
    end,
  },
}
