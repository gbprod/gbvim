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
        lualine_b = { --[[ "require('lsp-progress').progress()"  ]]
        },
        lualine_c = { "diagnostic-message" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "branch", "diff", "diagnostics" },
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
      "Isrothy/lualine-diagnostic-message",
      "linrongbin16/lsp-progress.nvim",
    },
  },
  {
    "linrongbin16/lsp-progress.nvim",
    config = function()
      require("lsp-progress").setup()
    end,
  },
}
