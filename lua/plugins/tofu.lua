-- Use OpenTofu's language server instead of terraform-ls. terraform-ls looks for
-- providers under registry.terraform.io, but `tofu init` installs them under
-- registry.opentofu.org, so terraform-ls reports "Missing required provider".
-- Install with: brew install tofu-ls
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        terraformls = { enabled = false },
        tofu_ls = {
          mason = false, -- installed via brew, not mason
        },
      },
    },
  },
  {
    -- LazyVim's terraform extra lints with `terraform validate`; use `tofu validate`.
    "mfussenegger/nvim-lint",
    optional = true,
    opts = function(_, opts)
      opts.linters_by_ft = opts.linters_by_ft or {}
      opts.linters_by_ft.terraform = { "tofu" }
      opts.linters_by_ft.tf = { "tofu" }
    end,
  },
}
