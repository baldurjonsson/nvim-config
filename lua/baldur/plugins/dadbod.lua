return {
  'tpope/vim-dadbod',
  dependencies = {
    "kristijanhusak/vim-dadbod-completion",
    "kristijanhusak/vim-dadbod-ui",
  },
  cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
  ft = { "sql", "mysql", "plsql" },
  keys = {
    { "<leader>db", "<cmd>DBUIToggle<CR>", desc = "Toggle DBUI" },
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
  end,
}

