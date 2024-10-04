local builtin = require('telescope.builtin')
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local make_entry = require('telescope.make_entry')
local utils = require "telescope.utils"

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, {})

local filetypes = {
  php = { "method" },
  javascript = { "function" },
  typescript = { "function" },
}

vim.keymap.set("n", "<leader>fm", function()
  local symbols = { "function", "method" }
  if filetypes[vim.bo.filetype] then
    symbols = filetypes[vim.bo.filetype]
  end
  builtin.lsp_document_symbols({ symbols = symbols })
end, {})
