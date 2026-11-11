-- Port of your VSCode files.associations: "*.rules" -> yaml, "*.alloy" -> grafana-alloy.
vim.filetype.add({
  extension = {
    rules = "yaml",
    alloy = "grafana-alloy",
  },
})
