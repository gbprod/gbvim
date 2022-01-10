local css = {}

function css.setup()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  require("lspconfig").cssls.setup({
    capabilities = capabilities,
  })
end

return css
