local function git_window(focus)
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if pcall(function() vim.api.nvim_win_get_var(win, "fugitive_status") end) then
      if focus ~= nil and focus == true then
        vim.api.nvim_set_current_win(win)
      else
        vim.api.nvim_win_close(win, true)
      end
      return
    end
  end
  vim.cmd.Git()
end

return {
  "tpope/vim-fugitive",
  cmd = { "Git", "G" },
  keys = {
    { "<leader>gs", function() git_window() end,            desc = "Git status (toggle)" },
    { "<leader>gf", function() git_window(true) end,        desc = "Git status (focus)" },
    { "<leader>gp", function() vim.cmd.Git("push") end,     desc = "Git push" },
  },
}
