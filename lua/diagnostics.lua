return {
  plugins = function(use)
    use("folke/lsp-colors.nvim")
    use("folke/lsp-trouble.nvim")
    use("folke/todo-comments.nvim")
  end,

  setup = function()
    require("trouble").setup({
      signs = {
        error = "",
        warning = "",
        hint = "",
        information = "",
        other = "﫠",
      },
    })

    local trouble = require("trouble.providers.telescope")
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        mappings = {
          i = { ["<c-t>"] = trouble.open_with_trouble },
          n = { ["<c-t>"] = trouble.open_with_trouble },
        },
      },
    })

    require("todo-comments").setup({})

    vim.highlight.create(
      "DiagnosticUnderlineWarn",
      { cterm = "undercurl", ctermfg = "1", gui = "undercurl", guifg = "NONE", guisp = "#EBCB8B" },
      false
    )
    vim.highlight.create(
      "DiagnosticUnderlineError",
      { cterm = "undercurl", ctermfg = "1", gui = "undercurl", guifg = "NONE", guisp = "#BF616A" },
      false
    )
    vim.highlight.create(
      "DiagnosticUnderlineInfo",
      { cterm = "undercurl", ctermfg = "1", gui = "undercurl", guifg = "NONE", guisp = "#88C0D0" },
      false
    )
    vim.highlight.create(
      "DiagnosticUnderlineHint",
      { cterm = "undercurl", ctermfg = "1", gui = "undercurl", guifg = "NONE", guisp = "#5E81AC" },
      false
    )
    vim.highlight.create("DiagnosticWarn", { ctermfg = "3", guifg = "#EBCB8B" }, false)
    vim.highlight.create("DiagnosticError", { ctermfg = "1", guifg = "#BF616A" }, false)
    vim.highlight.create("DiagnosticInfo", { ctermfg = "4", guifg = "#88C0D0" }, false)
    vim.highlight.create("DiagnosticHint", { ctermfg = "7", guifg = "#5E81AC" }, false)
  end,

  bindings = function(map)
    local wk = require("which-key")
    wk.register({
      ["<leader>d"] = {
        name = "+Diagnostics",
        d = {
          "<cmd>TroubleToggle document_diagnostics<cr>",
          "Document diagnostics",
          mode = "n",
        },
        D = {
          "<cmd>TroubleToggle workspace_diagnostics<cr>",
          "Workspace diagnostics",
          mode = "n",
        },
        l = { "<cmd>TroubleToggle loclist<cr>", "Loclist", mode = "n" },
        q = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix", mode = "n" },
        t = { "<cmd>TodoTelescope<cr>", "Todo list", mode = "n" },
      },
    }, {
      mode = "n",
    })
  end,
}
