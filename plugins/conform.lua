return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "biome" },
      javascriptreact = { "biome" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
      rust = { "rustfmt" },
      dart = { "dart_format" },
    },
    formatters = {
      biome = {
        command = "biome",
        args = { "check", "--write", "--stdin-file-path", "$FILENAME" },
        stdin = true,
      },
      rustfmt = {
        command = "rustfmt",
        args = { "--emit=stdout" },
        stdin = true,
      },
      dart_format = {
        command = "dart",
        args = { "format", "--output", "show", "--stdin" },
        stdin = true,
      },
    },
  },
}
