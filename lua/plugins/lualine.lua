local icons = require("config.icons")
return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        --component_separators = "",
        --section_separators = "",
      },
      sections = {
        lualine_y = {
          {
            "mode",
            fmt = function(str)
              return ""
            end,
          },
        },
        lualine_z = {},
      },
    },
  },
}
