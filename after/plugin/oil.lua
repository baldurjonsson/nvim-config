require("oil").setup({
  default_file_explorer = "telescope",
  columns = {
    "icon", "mtime",
  },
  win_options = {
    signcolumn = "yes:2",
    -- winbar = "%{v:vim.fn.getcwd()} %{v:lua.require('oil').get_current_dir()}",
    winbar = "%{v:lua.string.sub(v:lua.require('oil').get_current_dir(),v:lua.string.len(v:lua.vim.fn.getcwd())+1)}",
  },
})

require("oil-git-status").setup({})

vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")
