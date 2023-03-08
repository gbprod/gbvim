return {
  {
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup({
        enhanced_diff_hl = true,
      })

      require("which-key").register({ ["<leader>gd"] = { name = "+Diff" } })
      vim.keymap.set("n", "<leader>gdf", "<cmd>DiffviewFileHistory<CR>", { desc = "File history" })
      vim.keymap.set("n", "<leader>gdo", "<cmd>DiffviewOpen<CR>", { desc = "Open" })
      vim.keymap.set("n", "<leader>gdc", "<cmd>DiffviewClose<CR>", { desc = "Close" })
    end,
  },
}
