return {
  server = {
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
    cmd = { "typescript-language-server", "--stdio" },
    root_dir = require("lspconfig.util").root_pattern("package.json", "tsconfig.json", ".git"),
    settings = {
      typescript = {
        preferences = {
          includeCompletionsForModuleExports = true,
          includeCompletionsWithInsertText = true,
        },
      },
    },
  },
  setup = function(_, opts)
    opts.on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false
      local map = function(mode, lhs, rhs)
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, { noremap = true, silent = true })
      end
      map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
      map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
      map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
      map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
    end
  end,
}
