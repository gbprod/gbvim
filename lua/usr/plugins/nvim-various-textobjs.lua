return {
  {
    "chrisgrieser/nvim-various-textobjs",
    config = function()
      require("various-textobjs").setup({
        lookForwardSmall = 5,
        lookForwardBig = 15,
        useDefaultKeymaps = true,
        disabledKeymaps = { "iS", "aS" },
      })

      vim.keymap.set({ "o", "x" }, "iv", "<cmd>lua require('various-textobjs').subword('inner')<CR>")
      vim.keymap.set({ "o", "x" }, "av", "<cmd>lua require('various-textobjs').subword('outer')<CR>")
    end,
  },
}
