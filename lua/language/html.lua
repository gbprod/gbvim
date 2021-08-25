local layer = {}

layer.plugins = function(use)
  use { 'tree-sitter/tree-sitter-html', run = ':TSInstall html'}
end

layer.setup = function()
  require'lspconfig'.phpactor.setup{
    cmd = { require'packer'.config.package_root .. '/packer/opt/phpactor/bin/phpactor', 'language-server' },
    on_attach = require'lsp'.on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

return layer



