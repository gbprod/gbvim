local json = {}

function json.plugins(use)
  use({ "tree-sitter/tree-sitter-json", run = ":TSInstall! json" })
end

function json.setup()
  local capabilities = require("usr.lsp").make_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  require("lspconfig").jsonls.setup({
    capabilities = capabilities,
  })
end
return json