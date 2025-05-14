return {
  {
    "backdround/improved-search.nvim",
    config = function()
      local search = require("improved-search")

      vim.keymap.set({ "n", "x", "o" }, "n", search.stable_next, { noremap = true, silent = true })
      vim.keymap.set({ "n", "x", "o" }, "N", search.stable_previous, { noremap = true, silent = true })
      vim.keymap.set({ "n", "x" }, "*", search.current_word_strict, { noremap = true, silent = true })
      vim.keymap.set({ "n", "x" }, "#", search.current_word_strict, { noremap = true, silent = true })
      vim.keymap.set({ "n", "x" }, "g*", search.current_word, { noremap = true, silent = true })
      vim.keymap.set({ "n", "x" }, "g#", search.current_word, { noremap = true, silent = true })
      vim.keymap.set({ "n", "x" }, "g#", search.current_word, { noremap = true, silent = true })
      vim.keymap.set({ "n" }, "§", search.in_place, { noremap = true, silent = true })
    end,
  },
}
