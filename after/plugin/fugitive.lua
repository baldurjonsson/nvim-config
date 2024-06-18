function GitWindow(focus)
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if pcall(function() vim.api.nvim_win_get_var(win, "fugitive_status") end) then
      if focus ~= nil and focus == true then
        vim.api.nvim_set_current_win(win)
      else
        vim.api.nvim_win_close(win, true)
      end
      return
    end
    vim.cmd.Git()
  end
end

vim.keymap.set("n", "<leader>gs", function() GitWindow() end, {})
vim.keymap.set("n", "<leader>gf", function() GitWindow(true) end, {})
