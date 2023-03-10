return {
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      local hlslens = require("hlslens")
      hlslens.setup({
        calm_down = false,
        nearest_only = true,
        nearest_float_when = "never",
      })

      vim.keymap.set("n", "*", function()
        vim.fn.execute("normal! *N")
        hlslens.start()
      end, { noremap = true, silent = true })

      vim.keymap.set("n", "#", function()
        vim.fn.execute("normal! #N")
        hlslens.start()
      end, { noremap = true, silent = true })

      vim.keymap.set("n", "g*", function()
        vim.fn.execute("normal! g*N")
        hlslens.start()
      end, { noremap = true, silent = true })

      vim.keymap.set("n", "g#", function()
        vim.fn.execute("normal! g#N")
        hlslens.start()
      end, { noremap = true, silent = true })

      vim.keymap.set("n", "n", function()
        vim.fn.execute("normal! " .. vim.v.count1 .. "n")
        hlslens.start()
      end, { noremap = true, silent = true })

      vim.keymap.set("n", "N", function()
        vim.fn.execute("normal! " .. vim.v.count1 .. "N")
        hlslens.start()
      end, { noremap = true, silent = true })
    end,
  },
}
