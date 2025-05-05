local typescript = require("plugins.lsp.typescript")
local dart = require("plugins.lsp.dart")
local tailwind = require("plugins.lsp.tailwind")
local rust = require("plugins.lsp.rust")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = typescript.server,
        dartls = dart.server,
        tailwindcss = tailwind.server,
        rust_analyzer = rust.server,
      },
      setup = {
        tsserver = typescript.setup,
        dartls = dart.setup,
        tailwindcss = tailwind.setup,
        rust_analyzer = rust.setup,
      },
    },
  },
}
