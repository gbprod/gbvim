return {
  {
    "windwp/nvim-spectre",
    config = function()
      require("which-key").register({ ["<leader>sr"] = { name = "+Replace" }, { mode = "n" } })
      vim.keymap.set("n", "<leader>srr", require("spectre").open, { desc = "Search and replace" })
      vim.keymap.set("n", "<leader>srw", function()
        require("spectre").open_visual({ select_word = true })
      end, { desc = "Word" })
      vim.keymap.set("n", "<leader>srf", require("spectre").open_file_search, { desc = "In file" })
      require("which-key").register({ ["<leader>sr"] = { name = "+Replace" }, { mode = "v" } })
      vim.keymap.set("v", "<leader>srr", require("spectre").open_visual, { desc = "Search and replace" })
    end,
  },
}
