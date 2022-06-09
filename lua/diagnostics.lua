local diagnostics = {}

function diagnostics.plugins(use)
  use("folke/lsp-colors.nvim")
  use("folke/lsp-trouble.nvim")
  use("folke/todo-comments.nvim")
end

function diagnostics.setup()
  vim.diagnostic.config({
    float = {
      show_header = true,
      source = "always",
      border = "rounded",
      focusable = false,
    },
  })

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
end

function diagnostics.bindings(_)
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
end

return diagnostics
