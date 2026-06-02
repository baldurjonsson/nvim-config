return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  -- The `main` branch is a full rewrite and does NOT support lazy-loading.
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local nts = require("nvim-treesitter")

    local ensure_installed = {
      "lua",
      "vim",
      "vimdoc",
      "query",
      "javascript",
      "typescript",
      "tsx",
      "json",
      "php",
      "phpdoc",
      "sql",
      "html",
      "css",
      "markdown",
      "markdown_inline",
      "bash",
      "gitcommit",
      "diff",
    }

    -- Installs (or no-ops) the parsers above. Runs asynchronously.
    nts.install(ensure_installed)

    -- The `main` branch ships no "modules": highlighting/indentation are enabled
    -- per buffer. Neovim provides highlighting (`vim.treesitter.start`); this
    -- plugin provides the experimental indent expression.
    vim.api.nvim_create_autocmd("FileType", {
      desc = "Enable treesitter highlighting and indentation",
      callback = function(ev)
        local buf = ev.buf
        local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
        if not lang then
          return
        end
        -- Guard with pcall: the parser may not be installed yet (install is async)
        -- or may simply be unavailable for this language.
        if not pcall(vim.treesitter.start, buf, lang) then
          return
        end
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
