-- You use Astral's tooling (uv/ruff/ty), not Pyright — drop the lang.python extra's
-- default type checker. `ty` itself is wired up as a plain autocmd in
-- lua/config/autocmds.lua (no lspconfig/mason involvement, since `ty` doesn't have an
-- official lspconfig entry yet). `ruff` (lint + format) from the extra is kept as-is.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        basedpyright = false,
        pyright = false,
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = vim.tbl_filter(function(pkg)
        return pkg ~= "basedpyright" and pkg ~= "pyright"
      end, opts.ensure_installed or {})
    end,
  },
}
