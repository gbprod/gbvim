return {
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure({
        providers = {
          "lsp",
          "treesitter",
          "regex",
        },
        delay = 300,
        filetypes_denylist = {
          "neo-tree",
          "lazy",
          "qf",
          "TelescopePrompt",
          "TelescopeResults",
          "TelescopePreview",
          "spectre_panel",
          "toggleterm",
          "DressingInput",
          "DressingSelect",
          "noice",
          "notify",
          "alpha",
          "fugitive",
        },
        modes_denylist = { "i" },
        min_count_to_highlight = 2,
      })
    end,
  },
}
