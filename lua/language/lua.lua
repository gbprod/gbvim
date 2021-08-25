local layer = {}

layer.plugins = function(use)
  use { 'nvim-treesitter/tree-sitter-lua', run = ':TSInstall lua'}
end

return layer

