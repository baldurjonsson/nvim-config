return {
  "supermaven-inc/supermaven-nvim",
  config = function()
    require("supermaven-nvim").setup({
      color = {
        suggestion_color = "#ffffff",
        cterm = 244,
      },
      disable_inline_completion = true, -- disables inline completion for use with cmp
      disable_keymaps = true        -- disables built in keymaps for more manual control
    })
  end,
}
