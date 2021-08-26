local layer = {}

layer.plugins = function(use)
  use 'haya14busa/vim-asterisk'
end

layer.bindings = function(map)
  map('n', '*', '<Plug>(asterisk-z*)', {})
  map('n', '#', '<Plug>(asterisk-z#)', {})
  map('n', 'g*', '<Plug>(asterisk-gz*)', {})
  map('n', 'g#', '<Plug>(asterisk-gz#)', {})
end

return layer

