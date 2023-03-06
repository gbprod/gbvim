  require("diffview").setup({
    enhanced_diff_hl = true,
  })

    ["<leader>gd"] = { name = "+Diff" },
    ["<leader>gdf"] = {
      "<cmd>DiffviewFileHistory<CR>",
      "File history",
    },
    ["<leader>gdo"] = {
      "<cmd>DiffviewOpen<CR>",
      "Open",
    },
    ["<leader>gdc"] = {
      "<cmd>DiffviewClose<CR>",
      "Close",
    },
