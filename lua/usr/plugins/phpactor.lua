return {
  {
    dir = "~/workspace/phpactor.nvim",
    build = function()
      require("phpactor.handler.update")()
    end,
    opts = {
      install = {
        check_on_startup = "always",
        auto_update = true,
      },
      lspconfig = {
        enable = true,
        options = {
          on_attach = require("usr.lsp-utils").on_attach,
          capabilities = require("usr.lsp-utils").make_capabilities(),
        },
      },
    },
  },
}
