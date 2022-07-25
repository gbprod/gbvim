local sh = {}

function sh.setup()
  require("lspconfig").bashls.setup({
    on_attach = require("usr.lsp").on_attach,
    capabilities = require("usr.lsp").make_capabilities(),
  })

  local null_ls = require("null-ls")
  null_ls.register(null_ls.builtins.code_actions.shellcheck)
  null_ls.register(null_ls.builtins.diagnostics.shellcheck)
  null_ls.register(null_ls.builtins.formatting.shfmt)
end

return sh
