return {
  {
    dir = "~/workspace/phpactor.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      "folke/noice.nvim",
    },
    event = "VeryLazy",
    opts = {
      install = {
        check_on_startup = "daily",
        auto_update = true,
      },
      lspconfig = {
        enable = true,
      },
    },
  },
}
