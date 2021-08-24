local layer = {}

layer.plugins = function(use)
  use { 'nvim-treesitter/tree-sitter-lua', run = ':TSInstall lua'}
end

layer.setup = function()
end

layer.bindings = function(map)
end

return layer

