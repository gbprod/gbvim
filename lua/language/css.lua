local css = {}

function css.setup()
  local capabilities = require("lsp").make_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  require("lspconfig").cssls.setup({
    capabilities = capabilities,
  })
end

return css
