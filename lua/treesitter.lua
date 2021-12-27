return {
  plugins = function(use)
    use("sheerun/vim-polyglot")
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/nvim-treesitter-textobjects")
    use("nvim-treesitter/playground")
  end,

  setup = function()
    local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

    parser_configs.norg = {
      install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main",
      },
    }

    parser_configs.norg_meta = {
      install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main",
      },
    }

    parser_configs.norg_table = {
      install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main",
      },
    }

    require("nvim-treesitter.configs").setup({
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["ia"] = "@parameter.inner",
            ["aa"] = "@parameter.outer",
            -- ["i"] = "@block.inner",
            -- ["a"] = "@block.outer",
            -- ["im"] = "@call.inner",
            -- ["am"] = "@call.outer",
            -- @comment.outer
            -- ["iC"] = '@conditional.inner',
            -- ["aC"] = '@conditional.outer',
            -- @frame.inner
            -- @frame.outer
            -- @loop.inner
            -- @loop.outer
            -- @scopename.inner
            -- @statement.outer
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [")m"] = "@function.outer",
            [")c"] = "@class.outer",
          },
          goto_next_end = {
            [")M"] = "@function.outer",
            [")C"] = "@class.outer",
          },
          goto_previous_start = {
            ["(m"] = "@function.outer",
            ["(c"] = "@class.outer",
          },
          goto_previous_end = {
            ["(M"] = "@function.outer",
            ["(C"] = "@class.outer",
          },
        },
      },
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = true,
        disable = { "yaml" }, -- TODO: test later
      },
      indent = {
        enable = true,
        disable = {}, -- TODO: test later
      },
      autopairs = {
        enable = true,
      },
    })

    vim.highlight.create(
      "TSError",
      { cterm = "undercurl", ctermfg = "1", gui = "undercurl", guifg = "NONE", guisp = "#BF616A" },
      false
    )

    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    vim.opt.foldlevel = 99
  end,
}
