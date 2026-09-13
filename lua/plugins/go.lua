-- Match the VSCode Go setup: golangci-lint for both formatting and linting,
-- instead of the lang.go extra's default (gofumpt + gopls diagnostics).
return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        go = { "golangcilint" },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        go = { "golangci-lint" },
      },
      formatters = {
        ["golangci-lint"] = {
          command = "golangci-lint",
          args = { "fmt", "--stdin" },
          stdin = true,
        },
      },
    },
  },
}
