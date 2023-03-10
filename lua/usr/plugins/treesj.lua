return {
  {
    "Wansmer/treesj",
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
        check_syntax_error = true,
        max_join_length = 120,
        cursor_behavior = "hold",
        notify = true,
      })

      require("which-key").register({ ["<leader>j"] = { name = "+Join/Split" } })

      vim.keymap.set("n", "<leader>jj", "<cmd>TSJToggle<cr>", { desc = "Toggle" })
      vim.keymap.set("n", "<leader>js", "<cmd>TSJSplit<cr>", { desc = "Split" })
      vim.keymap.set("n", "<leader>jJ", "<cmd>TSJJoin<cr>", { desc = "Join" })
    end,
  },
}
