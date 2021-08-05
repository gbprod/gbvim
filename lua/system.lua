local layer = {}

layer.plugins = function(use)
    use 'airblade/vim-rooter'
    use 'tpope/vim-eunuch'
    -- use "ahmedkhalf/lsp-rooter.nvim"
end

layer.setup = function()
  vim.g.rooter_patterns = { '.git/', '.env', '.env.dist', '.project.vim', '.envrc' }
  vim.g.rooter_silent_chdir = 1
end

layer.bindings = function()
end

return layer

