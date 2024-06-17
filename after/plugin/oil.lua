require("oil").setup({
  default_file_explorer = "telescope",
  columns = {
    "icon", "mtime",
  },
  win_options = {
    signcolumn = "yes:2",
    winbar = "%{v:lua.require('oil').get_current_dir()}",
  },
})

require("oil-git-status").setup({})

vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")
