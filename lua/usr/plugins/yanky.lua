return {
  {
    dir = "~/workspace/yanky.nvim",
    dependencies = {
      "kkharji/sqlite.lua",
    },
    config = function()
      local mapping = require("yanky.telescope.mapping")
      require("telescope").load_extension("yank_history")
      require("yanky").setup({
        ring = {
          storage = "sqlite",
          history_length = 1000,
        },
        textobj = {
          enabled = true,
        },
        picker = {
          telescope = {
            mappings = {
              i = {
                ["<c-a>"] = mapping.special_put("YankyPutAfterCharwiseJoined"),
              },
            },
          },
        },
      })

      vim.keymap.set("n", "p", "<Plug>(YankyPutAfter)", {})
      vim.keymap.set("n", "P", "<Plug>(YankyPutBefore)", {})

      vim.keymap.set("n", "]p", "<Plug>(YankyPutAfterCharwiseJoined)", {})
      vim.keymap.set("n", "]P", "<Plug>(YankyPutBeforeCharwiseJoined)", {})

      vim.keymap.set("x", "p", "<Plug>(YankyPutAfter)", {})
      vim.keymap.set("x", "P", "<Plug>(YankyPutBefore)", {})

      vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)", {})
      vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)", {})

      vim.keymap.set({ "n", "x" }, ")p", "<Plug>(YankyPutIndentAfterLinewise)", {})
      vim.keymap.set({ "n", "x" }, ")P", "<Plug>(YankyPutIndentAfterLinewise)", {})

      vim.keymap.set({ "n", "x" }, ")gp", "<Plug>(YankyGPutAfterLinewise)", {})
      vim.keymap.set({ "n", "x" }, ")gP", "<Plug>(YankyGPutAfterLinewise)", {})

      vim.keymap.set({ "n", "x" }, ">p", "<Plug>(YankyPutIndentAfterShiftRight)", {})
      vim.keymap.set({ "n", "x" }, ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", {})

      vim.keymap.set({ "n", "x" }, "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", {})
      vim.keymap.set({ "n", "x" }, "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", {})

      vim.keymap.set({ "n", "x" }, "=p", "<Plug>(YankyPutAfterFilter)", {})
      vim.keymap.set({ "n", "x" }, "=P", "<Plug>(YankyPutBeforeFilter)", {})

      vim.keymap.set({ "n", "x" }, "=gp", "<Plug>(YankyGPutAfterFilter)", {})
      vim.keymap.set({ "n", "x" }, "=gP", "<Plug>(YankyGPutBeforeFilter)", {})

      vim.keymap.set({ "n", "x" }, ">gp", "<Plug>(YankyGPutAfterShiftRight)", {})
      vim.keymap.set({ "n", "x" }, ">gP", "<Plug>(YankyGPutBeforeShiftRight)", {})

      vim.keymap.set({ "n", "x" }, "<gp", "<Plug>(YankyGPutAfterShiftLeft)", {})
      vim.keymap.set({ "n", "x" }, "<gP", "<Plug>(YankyGPutBeforeShiftLeft)", {})

      vim.keymap.set("n", "]gp", "<Plug>(YankyGPutAfterCharwiseJoined)", {})
      vim.keymap.set("n", "]gP", "<Plug>(YankyGPutBeforeCharwiseJoined)", {})

      vim.keymap.set("n", "<M-p>", "<Plug>(YankyPreviousEntry)", {})
      vim.keymap.set("n", "<M-P>", "<Plug>(YankyNextEntry)", {})

      vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)", { noremap = true })

      vim.keymap.set({ "n", "x" }, "<leader>yy", "<cmd>Telescope yank_history<cr>", {})
    end,
  },
}
