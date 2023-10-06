require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {"lua_ls", "omnisharp"}
})

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    local opts = {buffer = bufnr, remap = false}
    lsp.default_keymaps({buffer = bufnr})
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

local cmp = require("cmp")

cmp.setup({
  mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
	if not entry then
	  cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
	else
	  cmp.confirm()
	end
      else
        fallback()
      end
    end, {"i","s","c",}),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }
})

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require('lspconfig').omnisharp.setup {
    enable_import_completion    = true,
}

lsp.setup()
