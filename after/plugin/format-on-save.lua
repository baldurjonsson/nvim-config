local format_on_save = require("format-on-save")
local formatters = require("format-on-save.formatters")

format_on_save.setup({
  exclude_path_patterns = {
    "/node_modules/",
    "/app/Config/"
  },
  formatter_by_ft = {
    lua = formatters.lsp,
    php = formatters.lsp,
  },
})
