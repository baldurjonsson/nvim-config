return {
  'nvim-telescope/telescope.nvim', tag = '0.1.6',
  dependencies = {
    'nvim-lua/plenary.nvim',
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        prompt_prefix = "❯ ",
        selection_caret = "❯ ",
        file_ignore_patterns = {
          "Vendor/",
          "node_modules/",
          "cakephp/",
          "go.sum",
          "go.mod",
          "package-lock.json",
        },
      },
    })
    telescope.load_extension("live_grep_args")
  end
}
