return {
    "ptdewey/pendulum-nvim",
    config = function()
        require("pendulum").setup({
          log_file = vim.env.HOME .. "/.tracker/pendulum-log.csv",
    })
    end,
}
