return {
  plugins = function(use)
    use { 'nvim-treesitter/tree-sitter-lua', run = ':TSInstall lua'}
  end
}

