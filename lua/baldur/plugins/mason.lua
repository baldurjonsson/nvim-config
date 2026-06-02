return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
  },
  config = function()
    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = { 'lua_ls', 'ts_ls', 'jsonls' },
      automatic_enable = false,
    })
  end,
}
