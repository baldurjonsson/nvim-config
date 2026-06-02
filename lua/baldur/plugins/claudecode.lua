return {
  "coder/claudecode.nvim",
  config = function()
    require("claudecode").setup({
      -- Open claude in a native nvim terminal split. The plugin runs the MCP
      -- WebSocket server and claude auto-connects, so edits come back as
      -- reviewable diffs (<leader>aa / <leader>ad).
      --
      -- Prefer launching claude yourself in a tmux pane? Either:
      --   * just run `claude` then `/ide` in any pane — it discovers the
      --     server via ~/.claude/ide/<port>.lock, or
      --   * have <leader>ac spawn a tmux pane:
      -- provider = "external",
      -- provider_opts = { external_terminal_cmd = "tmux split-window -h %s" },
      terminal = {
        provider = "native",
        split_side = "right",
        split_width_percentage = 0.50,
      },
      -- Real-time selection/context updates to Claude.
      track_selection = true,
      diff_opts = {
        layout = "vertical",
      },
    })
  end,
  keys = {
    { "<leader>ac", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude" },
    { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude" },
    { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Claude" },
    { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
    { "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send selection to Claude" },
    -- Add the file/files under the cursor in oil to Claude's context.
    { "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>",    ft = "oil",                 desc = "Add file to Claude context" },
    -- Diff review for Claude's proposed edits.
    { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept Claude diff" },
    { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",   desc = "Reject Claude diff" },
  },
}
