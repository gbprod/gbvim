return {
  {
    dir = "~/workspace/phpactor.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
      "folke/noice.nvim",
    },
    opts = {
      install = {
        check_on_startup = "always",
        auto_update = true,
      },
      lspconfig = {
        enable = true,
      },
    },
  },
}
