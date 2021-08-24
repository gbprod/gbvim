local layer = {}

layer.plugins = function(use)
  use 'nvim-lua/plenary.nvim'
  use 'airblade/vim-rooter'
  use 'tpope/vim-eunuch'
end

layer.setup = function()
  vim.g.rooter_patterns = { '.git/', '.env', '.env.dist', '.project.vim', '.envrc' }
  vim.g.rooter_silent_chdir = 1
end

layer.bindings = function(map)
end

return layer

