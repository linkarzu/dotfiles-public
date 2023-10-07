-- Similar to the tmux maximizer, if you have a split you can maximize the current window
return {
  "szw/vim-maximizer",
  keys = {
    { "<leader>sm", "<cmd>MaximizerToggle<CR>", { desc = "Maximize/minimize a split" } },
  },
}
