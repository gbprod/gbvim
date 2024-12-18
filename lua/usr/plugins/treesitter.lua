return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      -- require("nvim-treesitter.install").update({ with_sync = true })
    end,
    config = function()
      require("nvim-ts-autotag").setup()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "javascript",
          "python",
          "query",
          "sql",
          "json",
          "html",
          "make",
          "php",
          "regex",
          "twig",
          "css",
          "c",
          "cpp",
          "scheme",
          "scss",
          "phpdoc",
          "git_rebase",
          "printf",
          "markdown",
          "markdown_inline",
          "diff",
          "bash",
          "yaml",
          "gitcommit",
          "fish",
          "vimdoc",
          "xml",
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["aA"] = "@attribute.outer",
              ["iA"] = "@attribute.inner",
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["ia"] = "@parameter.inner",
              ["aa"] = "@parameter.outer",
              -- ["i"] = "@block.inner",
              -- ["a"] = "@block.outer",
              ["im"] = "@call.inner",
              ["am"] = "@call.outer",
              -- ["ax"] = "@comment.outer",
              ["i?"] = "@conditional.inner",
              ["a?"] = "@conditional.outer",
              -- @frame.inner
              -- @frame.outer
              ["i*"] = "@loop.inner",
              ["a*"] = "@loop.outer",
              -- @scopename.inner
              ["as"] = "@statement.outer",
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
          additional_vim_regex_highlighting = false,
        },
        indent = {
          enable = true,
        },
        autopairs = {
          enable = true,
        },
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = { "BufWrite", "CursorHold" },
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        matchup = {
          enable = true,
          disable = {},
        },
      })
      vim.opt.foldmethod = "expr"
      vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
      vim.opt.foldlevel = 99
      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.gitcommit = {
        install_info = {
          url = "~/workspace/tree-sitter-gitcommit/",
          files = { "src/parser.c", "src/scanner.c" },
          branch = "feat-automatic-lang",
        },
      }
    end,
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/playground",
      "windwp/nvim-ts-autotag",
      "andymass/vim-matchup",
    },
  },
  { dir = "~/workspace/php-enhanced-treesitter.nvim" },
  -- { dir = "~/workspace/ts-gitcommit-overflow-rule", ft = "gitcommit", opts = {} },
}
