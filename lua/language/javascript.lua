local javascript = {}

function javascript.plugins(use)
  use({ "tree-sitter/tree-sitter-javascript", run = ":TSInstall javascript" })
end

function javascript.setup()
  local null_ls = require("null-ls")
  null_ls.register(null_ls.builtins.formatting.prettier.with({
    args = {
      "--config",
      vim.fn.expand("~/.config/prettier/.prettierrc"),
      "--stdin-filepath",
      "$FILENAME",
    },
    runtime_condition = function(_)
      return vim.b.should_format == nil or vim.b.should_format == true
    end,
  }))

  require("lspconfig").tsserver.setup({
    on_attach = function(client)
      client.resolved_capabilities.document_formatting = false
      require("lsp").on_attach()
    end,
  })
  require("lspconfig").eslint.setup({})
end

return javascript
