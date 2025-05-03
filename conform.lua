return {
  "stevearc/conform.nvim",
  opts = {
    format_on_save = {
      timeout_ms = 1000,
      lsp_fallback = true,
    },
    formatters_by_ft = {
      javascript = { "biome" },
      javascriptreact = { "biome" },
      typescript = { "biome" },
      typescriptreact = { "biome" },
    },
    formatters = {
      biome = {
        command = "biome",
        args = { "check", "--write", "--stdin-file-path", "$FILENAME" },
        stdin = true,
      },
    },
  },
}
