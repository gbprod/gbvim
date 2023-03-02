return {
    {
        "petertriho/nvim-scrollbar",
        config = function()
            require("scrollbar").setup()
            require("scrollbar.handlers.gitsigns").setup()
            require("scrollbar.handlers.search").setup({})
        end,
    },
}
