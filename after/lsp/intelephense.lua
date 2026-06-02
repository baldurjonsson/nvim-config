return {
  cmd = { 'intelephense', '--stdio' },
  filetypes = { 'php', 'ctp' },
  root_markers = { '.git', 'composer.json' },
  ---@type lspconfig.settings.intelephense
  settings = {
    intelephense = {
      format = {
        enable = false,
      },
      telemetry = {
        enabled = false,
      },
    },
  },
}
