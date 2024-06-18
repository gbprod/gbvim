return {
  {
    "kevinhwang91/nvim-hlslens",
    opts = {
      calm_down = false,
      nearest_only = true,
      nearest_float_when = "never",
    },
  },
  {
    "backdround/improved-search.nvim",
    requires = "kevinhwang91/nvim-hlslens",
    config = function()
      local hlslens = require("hlslens")
      local search = require("improved-search")

      vim.keymap.set({ "n", "x", "o" }, "n", function()
        search.stable_next()
        hlslens.start()
      end, { noremap = true, silent = true })

      vim.keymap.set({ "n", "x", "o" }, "N", function()
        search.stable_previous()
        hlslens.start()
      end, { noremap = true, silent = true })

      vim.keymap.set({ "n", "x" }, "*", function()
        search.current_word_strict()
        hlslens.start()
      end, { noremap = true, silent = true })

      vim.keymap.set({ "n", "x" }, "#", function()
        search.current_word_strict()
        hlslens.start()
      end, { noremap = true, silent = true })

      vim.keymap.set({ "n", "x" }, "g*", function()
        search.current_word()
        hlslens.start()
      end, { noremap = true, silent = true })

      vim.keymap.set({ "n", "x" }, "g#", function()
        search.current_word()
        hlslens.start()
      end, { noremap = true, silent = true })

      vim.keymap.set({ "n", "x" }, "g#", function()
        search.current_word()
        hlslens.start()
      end, { noremap = true, silent = true })

      vim.keymap.set({ "n" }, "!", function()
        search.in_place()
        hlslens.start()
      end, { noremap = true, silent = true })
    end,
  },
}
