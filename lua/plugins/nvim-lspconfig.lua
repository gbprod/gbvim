return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      inlay_hints = {
        enabled = true,
      },
      servers = {
        ["*"] = {
          keys = {
            { "gI", false },
            {
              "gi",
              function()
                Snacks.picker.lsp_implementations()
              end,
              desc = "Goto Implementation",
            },
            { "gy", false },
            {
              "gt",
              function()
                Snacks.picker.lsp_type_definitions()
              end,
              desc = "Goto Type Definition",
            },
            {
              "gr",
              function()
                Snacks.picker.lsp_references()
              end,
              desc = "References",
              nowait = true,
            },
            {
              "<a-cr>",
              vim.lsp.buf.code_action,
              desc = "Code Action",
              mode = { "n", "v" },
              has = "codeAction",
            },
            {
              "))",
              function()
                Snacks.words.jump(vim.v.count1)
              end,
              has = "documentHighlight",
              desc = "Next Reference",
              cond = function()
                return Snacks.words.is_enabled()
              end,
            },
            {
              "((",
              function()
                Snacks.words.jump(-vim.v.count1)
              end,
              has = "documentHighlight",
              desc = "Prev Reference",
              cond = function()
                return Snacks.words.is_enabled()
              end,
            },
            { "<a-p>", false },
            {
              "<a-N>",
              function()
                Snacks.words.jump(-vim.v.count1, true)
              end,
              has = "documentHighlight",
              desc = "Prev Reference",
              cond = function()
                return Snacks.words.is_enabled()
              end,
            },
          },
        },
      },
    },
  },
}
