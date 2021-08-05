local layer = {}

layer.plugins = function(use)
    use 'tpope/vim-sleuth'
end

layer.setup = function()
  vim.opt.tabstop=4
  vim.opt.softtabstop=4
  vim.opt.shiftwidth=4
  vim.opt.expandtab=true
end

layer.bindings = function()
end

return layer

