return {
  server = {
    filetypes = { "html", "javascriptreact", "typescriptreact", "vue", "svelte" },
    root_dir = require("lspconfig.util").root_pattern(
      "tailwind.config.js",
      "tailwind.config.ts",
      "postcss.config.js",
      "package.json",
      ".git"
    ),
  },
  setup = function(_, opts) end,
}
