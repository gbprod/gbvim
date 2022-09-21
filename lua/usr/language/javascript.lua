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
      return require("usr.lsp").should_format()
    end,
  }))

  require("lspconfig").tsserver.setup({
    on_attach = require("usr.lsp").on_attach,
    capabilities = require("usr.lsp").make_capabilities(),
  })
  require("lspconfig").eslint.setup({})
end

function javascript.on_ft()
  vim.cmd([[
  setlocal textwidth=80
  setlocal colorcolumn=+1,+41
  ]])
end

return javascript
