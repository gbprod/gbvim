return {
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup({
        excluded_filetypes = { "neo-tree", "dropbar_menu" },
      })
      require("scrollbar.handlers.gitsigns").setup()
      require("scrollbar.handlers.search").setup({})
    end,
  },
}
