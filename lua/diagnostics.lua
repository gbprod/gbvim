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

    local actions = require("telescope.actions")
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

    vim.cmd([[
    autocmd ColorScheme * highlight LspDiagnosticsUnderlineError cterm=undercurl ctermfg=1 gui=undercurl guifg=NONE guisp=#BF616A
    autocmd ColorScheme * highlight LspDiagnosticsUnderlineWarning cterm=undercurl ctermfg=1 gui=undercurl guifg=NONE guisp=#EBCB8B
    autocmd ColorScheme * highlight LspDiagnosticsUnderlineInformation cterm=undercurl ctermfg=1 gui=undercurl guifg=NONE guisp=#88C0D0
    autocmd ColorScheme * highlight LspDiagnosticsUnderlineHint cterm=undercurl ctermfg=1 gui=undercurl guifg=NONE guisp=#5E81AC
    ]])
  end,

  bindings = function(map)
    local wk = require("which-key")
    wk.register({
      ["<leader>d"] = {
        name = "+Diagnostics",
        d = { "<cmd>LspTroubleToggle lsp_document_diagnostics<cr>", "Document diagnostics", mode = "n" },
        D = { "<cmd>LspTroubleToggle lsp_workspace_diagnostics<cr>", "Workspace diagnostics", mode = "n" },
        l = { "<cmd>LspTroubleToggle loclist<cr>", "Loclist", mode = "n" },
        q = { "<cmd>LspTroubleToggle quickfix<cr>", "Quickfix", mode = "n" },
        t = { "<cmd>TodoTelescope<cr>", "Todo list", mode = "n" },
      },
    }, {
      mode = "n",
    })

    map("n", "gR", "<cmd>LspTrouble lsp_references<cr>", { silent = true, noremap = true })
  end,
}
