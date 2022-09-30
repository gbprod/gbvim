local html = {}

function html.plugins(use)
  use({ "tree-sitter/tree-sitter-html", run = ":TSInstall! html" })
end

function html.setup()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  require("lspconfig").html.setup({
    capabilities = capabilities,
    on_attach = require("usr.lsp").on_attach,
    filetypes = { "html", "html.twig" },
    init_options = {
      provideFormatter = false,
    },
  })
end

return html
