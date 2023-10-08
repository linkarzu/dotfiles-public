-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- This add the bar that shows the file path on the top right
-- vim.opt.winbar = "%=%m %f"
-- Modified version of the bar that shows the hostname
vim.opt.winbar = "%=" .. vim.fn.systemlist("hostname")[1] .. "            %m %f"
