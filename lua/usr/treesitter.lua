local treesitter = {}

function treesitter.plugins(use)
  use({
    "nvim-treesitter/nvim-treesitter",
    run = "TSInstall! javascript python query sql json html make php regex twig css scheme scss",
  })
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use("nvim-treesitter/playground")
end

function treesitter.setup()
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
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
      -- disable = { "php" }, -- TODO: test later
    },
    autopairs = {
      enable = true,
    },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { "BufWrite", "CursorHold" },
    },
  })

  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  vim.opt.foldlevel = 99
end

return treesitter