require("which-key").register({ ["<leader>l"] = { name = "+Sql" } })

vim.keymap.set("n", "<leader>le", "<cmd>SqlsExecuteQuery<CR>", { desc = "Execute query", buffer = 0 })
vim.keymap.set(
  "n",
  "<leader>lE",
  "<cmd>SqlsExecuteQueryVertical<CR>",
  { desc = "Execute query vertical mode", buffer = 0 }
)
vim.keymap.set("n", "<leader>ls", "<cmd>SqlsSwitchConnection<CR>", { desc = "Switch connection", buffer = 0 })
