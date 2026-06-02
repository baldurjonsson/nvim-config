return {
  'hrsh7th/nvim-cmp',
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'onsails/lspkind-nvim',
    {
      'L3MON4D3/LuaSnip',
      keys = {
        { "<C-K>", function() require("luasnip").expand() end, mode = "i", silent = true },
        { "<C-L>", function() require("luasnip").jump(1) end, mode = { "i", "s" }, silent = true },
        { "<C-J>", function() require("luasnip").jump(-1) end, mode = { "i", "s" }, silent = true },
        {
          "<C-E>",
          function()
            local ls = require("luasnip")
            if ls.choice_active() then
              ls.change_choice(1)
            end
          end,
          mode = { "i", "s" },
          silent = true,
        },
      },
    },
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require('lspkind')

    cmp.setup({
      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
        }),
      },
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'buffer' },
      }),
      mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
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
        end, { "i", "s", "c", }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
      }),
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      }
    })
    cmp.setup.filetype({ "sql", "mysql" }, {
      sources = {
        { name = "vim-dadbod-completion" },
        { name = "buffer" },
      },
    })
    cmp.setup.filetype({ "gitcommit" }, {
      sources = {}
    })
  end,
}
