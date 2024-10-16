return {
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "nord",
        section_separators = { "", "" },
        component_separators = { "|", "|" },
        globalstatus = true,
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {},
        lualine_c = { "diagnostic-message" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "branch", "diff" },
        lualine_z = { "progress", "location" },
      },
      extensions = {
        "nvim-tree",
        "quickfix",
        "toggleterm",
      },
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
}
