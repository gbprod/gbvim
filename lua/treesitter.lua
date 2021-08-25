local layer = {}

layer.plugins = function(use)
  use 'sheerun/vim-polyglot'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
end

layer.setup = function()
  require'nvim-treesitter.configs'.setup {
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
    },
    highlight = {
      enable = true,
      use_languagetree = false,
    },
    indent = {
      enable = true,
    },
  }

  vim.cmd [[
    autocmd ColorScheme * highlight TSError cterm=undercurl ctermfg=1 gui=undercurl guifg=NONE guisp=#BF616A
    set foldmethod=expr
    set foldexpr=nvim_treesitter#foldexpr()
    set foldlevel=99
  ]]
end

return layer

