local python = {}

function python.plugins(use)
  use({ "tree-sitter/tree-sitter-python", run = ":TSInstall! python" })
end

function python.setup()
  require("lspconfig").pyright.setup({
    on_attach = require("usr.lsp").on_attach,
    capabilities = require("usr.lsp").make_capabilities(),
  })

  local null_ls = require("null-ls")
  null_ls.register(null_ls.builtins.formatting.black.with({
    runtime_condition = function(_)
      return require("usr.lsp").should_format()
    end,
  }))

  vim.cmd([[
  autocmd Filetype python setlocal textwidth=80
  autocmd Filetype python setlocal colorcolumn=+1,+41
  autocmd Filetype python :iabbrev ret return
  ]])
end

return python
