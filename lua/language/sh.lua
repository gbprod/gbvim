local sh = {}

function sh.setup()
  require("lspconfig").bashls.setup({
    on_attach = require("lsp").on_attach,
  })

  local null_ls = require("null-ls")
  null_ls.register(null_ls.builtins.code_actions.shellcheck)
  null_ls.register(null_ls.builtins.diagnostics.shellcheck)
  null_ls.register(null_ls.builtins.formatting.shfmt)
end

return sh
