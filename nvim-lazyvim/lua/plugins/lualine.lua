return {
  "nvim-lualine/lualine.nvim",
  opts = function(_, opts)
    -- Adding hostname to lualine_x
    table.insert(opts.sections.lualine_x, 1, {
      "hostname",
      color = { fg = "#FFFFFF", bg = "#FF69B4" }, -- White text on pink background
      -- section_separators = { left = "", right = "" },
      -- component_separators = { left = "", right = "" },
    })
  end,
}
