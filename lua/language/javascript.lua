return {
  plugins = function(use)
    use({ "tree-sitter/tree-sitter-javascript", run = ":TSInstall javascript" })
  end,
  setup = function()
    local null_ls = require("null-ls")
    null_ls.register(null_ls.builtins.formatting.prettier)

    require("lspconfig").tsserver.setup({
      on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        require("lsp").on_attach()
      end,
    })
    require("lspconfig").eslint.setup({})
  end,
}
