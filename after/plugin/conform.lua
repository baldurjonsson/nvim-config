require('conform').setup({
  formatters_by_ft = {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    php = { "pretty-php" },
  },
  format_on_save = {
    lsp_format = "fallback",
  }
})
