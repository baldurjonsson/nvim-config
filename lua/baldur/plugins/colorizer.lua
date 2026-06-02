return {
  'NvChad/nvim-colorizer.lua',
  event = "BufReadPre",
  config = function()
    require("colorizer").setup({
      filetypes = { "*" },
      user_default_options = {
        css = true,
        tailwind = true,
        mode = "virtualtext",
      },
    })
  end,
}
