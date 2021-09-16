return {
  plugins = function(use)
    use("nvim-lua/plenary.nvim")
    use("airblade/vim-rooter")
    use("tpope/vim-eunuch")
  end,

  setup = function()
    vim.g.rooter_patterns = { ".git/", ".env", ".env.dist", ".project.vim", ".project.lua", ".envrc" }
    vim.g.rooter_silent_chdir = 1
  end,
}
