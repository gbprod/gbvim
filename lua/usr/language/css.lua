local css = {}

function css.plugins(use)
  use({ "tree-sitter/tree-sitter-css", run = ":TSInstall! css" })
end

function css.setup()
  local capabilities = require("usr.lsp").make_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  require("lspconfig").cssls.setup({
    capabilities = capabilities,
  })
end

return css
