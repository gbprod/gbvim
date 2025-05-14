return {
  {
    "Wansmer/treesj",
    opts = {
      use_default_keymaps = false,
      check_syntax_error = true,
      max_join_length = 120,
      cursor_behavior = "hold",
      notify = true,
    },
    keys = {
      { "<leader>j", mode = { "n" }, desc = "join/split" },
      { "<leader>jj", mode = { "n" }, "<cmd>TSJToggle<cr>", desc = "Toggle" },
      { "<leader>js", mode = { "n" }, "<cmd>TSJSplit<cr>", desc = "Split" },
      { "<leader>jJ", mode = { "n" }, "<cmd>TSJJoin<cr>", desc = "Join" },
    },
  },
}
