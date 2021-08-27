local layer = {}

layer.plugins = function(use)
  use "akinsho/toggleterm.nvim"
end

layer.bindings = function()
  require("toggleterm").setup{
    open_mapping = [[<F4>]],
    persist_size = true,
    direction = 'float',
    float_opts = {
      border = 'single',
    }
  }
end
return layer
