return {
  "mfussenegger/nvim-lint",
  opts = {
    linters_by_ft = {
      javascript = { "biome" },
      javascriptreact = { "biome" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
    },
    linters = {
      biome = {
        cmd = "biome",
        args = { "check", "--no-errors-on-unmatched", "--stdin-file-path", "$FILENAME" },
        stdin = true,
      },
    },
  },
}
