-- return {
--   "nvim-lualine/lualine.nvim",
--   opts = function(_, opts)
--     -- Adding hostname to lualine_x
--     table.insert(opts.sections.lualine_x, 1, {
--       "hostname",
--       color = { fg = "#FFFFFF", bg = "#FF69B4" }, -- White text on pink background
--       -- section_separators = { left = "", right = "" },
--       -- component_separators = { left = "", right = "" },
--     })
--   end,
-- }

return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Function to decide color based on hostname
    local function decide_color()
      local hostname = vim.fn.systemlist("hostname")[1]
      local last_char = string.sub(hostname, -1)
      if last_char == "1" then
        return "#0DFFAE"
      elseif last_char == "2" then
        return "#FF6200"
      elseif last_char == "3" then
        return "#DBF227"
      else
        return "#FF69B4" -- default
      end
    end

    -- Adding hostname to lualine_x
    table.insert(opts.sections.lualine_x, 1, {
      "hostname",
      color = { fg = "#FFFFFF", bg = decide_color() },
      -- section_separators = { left = "", right = "" },
      -- component_separators = { left = "", right = "" },
    })
  end,
}
