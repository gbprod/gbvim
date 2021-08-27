local layer = {}

layer.plugins = function(use)
  use { 'tree-sitter/tree-sitter-json', run = ':TSInstall json'}
end

return layer



