local layer = {}

layer.plugins = function(use)
  use { 'tree-sitter/tree-sitter-html', run = ':TSInstall html'}
end

layer.setup = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  require'lspconfig'.html.setup {
    capabilities = capabilities,
    on_attach = require'lsp'.on_attach,
  }
end

return layer



