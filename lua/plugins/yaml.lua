-- Port of your VSCode redhat.vscode-yaml settings: custom CloudFormation-style
-- tags plus the renovate/gitlab-ci/taskfile/golangci-lint schema associations.
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        yamlls = {
          settings = {
            yaml = {
              schemaStore = { enable = false, url = "" },
              customTags = {
                "!reference scalar",
                "!reference mapping",
                "!reference sequence",
                "!vault",
                "!And",
                "!And sequence",
                "!If",
                "!If sequence",
                "!Not",
                "!Not sequence",
                "!Equals",
                "!Equals sequence",
                "!Or",
                "!Or sequence",
                "!FindInMap",
                "!FindInMap sequence",
                "!Base64",
                "!Join",
                "!Join sequence",
                "!Cidr",
                "!Ref",
                "!Sub",
                "!Sub sequence",
                "!GetAtt",
                "!GetAZs",
                "!ImportValue",
                "!ImportValue sequence",
                "!Select",
                "!Select sequence",
                "!Split",
                "!Split sequence",
              },
              schemas = {
                ["https://docs.renovatebot.com/renovate-schema.json"] = {
                  "renovate.json",
                  "renovate.json5",
                  ".github/renovate.json",
                  ".github/renovate.json5",
                },
                ["https://gitlab.com/gitlab-org/gitlab-foss/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = {
                  ".gitlab/gitlab-ci/**/*",
                  ".gitlab-ci.yml",
                },
                ["https://taskfile.dev/schema.json"] = { "Taskfile.yml", "taskfile/*" },
                ["https://raw.githubusercontent.com/golangci/golangci-lint/refs/heads/main/jsonschema/golangci.jsonschema.json"] = {
                  ".golangci.yml",
                },
              },
            },
          },
        },
      },
    },
  },
}
