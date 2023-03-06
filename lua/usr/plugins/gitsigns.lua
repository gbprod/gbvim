return {
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        keymaps = {
          ["o ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
          ["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
        },
        preview_config = {
          border = "single",
        },
      })

      vim.keymap.set(
        "n",
        ")g",
        "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'",
        { desc = "Next hunk", expr = true }
      )
      vim.keymap.set(
        "n",
        ")G",
        "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'",
        { desc = "Prev hunk", expr = true }
      )

      vim.keymap.set("n", "<leader>ghs", require("gitsigns").stage_hunk, { desc = "Stage hunk" })
      vim.keymap.set("n", "<leader>ghu", require("gitsigns").undo_stage_hunk, { desc = "Undo stage hunk" })
      vim.keymap.set("n", "<leader>ghr", require("gitsigns").reset_hunk, { desc = "Reset hunk" })
      vim.keymap.set("n", "<leader>gR", require("gitsigns").reset_buffer, { desc = "Reset buffer" })
      vim.keymap.set("n", "<leader>ghp", require("gitsigns").preview_hunk, { desc = "Preview hunk" })
      vim.keymap.set("n", "<leader>gb", function()
        require("gitsigns").blame_line({ full = false })
      end, { desc = "Blame" })
      vim.keymap.set("n", "<leader>gB", require("gitsigns").blame_line, { desc = "Blame full" })

      vim.keymap.set(
        "v",
        "<leader>ghs",
        '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        { desc = "Stage Hunk" }
      )
      vim.keymap.set(
        "v",
        "<leader>ghr",
        '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
        { desc = "Reset Hunk" }
      )
    end,
  },
}
