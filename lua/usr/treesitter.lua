local treesitter = {}

function treesitter.plugins(use)
  use({
    "nvim-treesitter/nvim-treesitter",
    run = "TSUpdate!",
  })
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use("nvim-treesitter/playground")
  use("JoosepAlviste/nvim-ts-context-commentstring")
  use("windwp/nvim-ts-autotag")
  use("kiyoon/treesitter-indent-object.nvim")
  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  parser_config.gitcommit = {
    install_info = {
      url = "~/workspace/tree-sitter-gitcommit",
      files = { "src/parser.c", "src/scanner.c" },
      branch = "main",
    },
    filetype = "gitcommit",
  }
end

function treesitter.setup()
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
      "scheme",
      "scss",
      "phpdoc",
      "git_rebase",
      "markdown",
      "markdown_inline",
      "diff",
      "bash",
      "yaml",
      "gitcommit",
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
          ["iC"] = "@conditional.inner",
          ["aC"] = "@conditional.outer",
          -- @frame.inner
          -- @frame.outer
          ["iL"] = "@loop.inner",
          ["aL"] = "@loop.outer",
          -- @scopename.inner
          ["aS"] = "@statement.outer",
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
    context_commentstring = {
      enable = true,
      enable_autocmd = false,
    },
    autotag = {
      enable = true,
      filetypes = {
        "html",
        "javascript",
        "typescript",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "vue",
        "tsx",
        "jsx",
        "rescript",
        "xml",
        "php",
        "markdown",
        "twig",
      },
    },
  })
  vim.opt.foldmethod = "expr"
  vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  vim.opt.foldlevel = 99
end

function treesitter.bindings(map)
  map({ "x", "o" }, "ai", require("treesitter_indent_object.textobj").select_indent_outer)
  map({ "x", "o" }, "aI", function()
    require("treesitter_indent_object.textobj").select_indent_outer(true)
  end)
  map({ "x", "o" }, "ii", require("treesitter_indent_object.textobj").select_indent_inner)
  map({ "x", "o" }, "iI", function()
    require("treesitter_indent_object.textobj").select_indent_inner(true)
  end)
end

return treesitter
