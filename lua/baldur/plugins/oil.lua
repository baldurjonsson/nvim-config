return {
  'stevearc/oil.nvim',
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "refractalize/oil-git-status.nvim",
  },
  config = function()
    require("oil").setup({
      default_file_explorer = "telescope",
      columns = {
        "icon", "mtime",
      },
      win_options = {
        signcolumn = "yes:2",
        winbar = "%{v:lua.string.sub(v:lua.require('oil').get_current_dir(),v:lua.string.len(v:lua.vim.fn.getcwd())+1)}",
      },
      view_options = {
        show_hidden = false,
      },
      float = {
        preview_split = "right"
      }
    })

    require("oil-git-status").setup({})

    vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR><C-p>")
  end,
}
