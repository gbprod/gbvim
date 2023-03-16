return {
  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup({
        excluded_filetypes = { "neo-tree" },
      })
      require("scrollbar.handlers.gitsigns").setup()
      require("scrollbar.handlers.search").setup({})
    end,
  },
}
