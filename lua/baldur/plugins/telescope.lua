local function document_symbols()
  local builtin = require('telescope.builtin')
  local filetypes = {
    php = { "method" },
    javascript = { "function" },
    typescript = { "function" },
    typescriptreact = { "function" },
  }

  local symbols = filetypes[vim.bo.filetype] or { "function", "method" }
  builtin.lsp_document_symbols({ symbols = symbols })
end

return {
  'nvim-telescope/telescope.nvim',
  branch = 'master',
  cmd = "Telescope",
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  keys = {
    { '<leader>ff', function() require('telescope.builtin').find_files() end,           desc = "Find files" },
    { '<leader>fg', function() require('telescope.builtin').live_grep() end,            desc = "Live grep" },
    { '<leader>fb', function() require('telescope.builtin').buffers() end,              desc = "Buffers" },
    { '<leader>fh', function() require('telescope.builtin').help_tags() end,            desc = "Help tags" },
    { '<leader>fs', function() require('telescope.builtin').lsp_document_symbols() end, desc = "Document symbols" },
    { '<leader>fm', document_symbols,                                                   desc = "Functions/methods" },
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        file_ignore_patterns = {
          "library/",
          "Vendor/",
          "vendor/",
          "node_modules/",
          "cakephp/",
          "go.sum",
          "go.mod",
          "package-lock.json",
          "yarn-lock.json",
          "android/app/build/",
          "ios/Pods/",
          "ios/build"
        },
      },
    })

    telescope.load_extension('fzf')
  end
}
