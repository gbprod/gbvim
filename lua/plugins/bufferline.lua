return {
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      opts.highlights = require("nord.plugins.bufferline").akinsho()
      opts.options.always_show_bufferline = true

      -- opts.options.groups.items[1] = require("bufferline.groups").builtin.pinned:with({ icon = "󰐃 " })

      return opts
    end,
    keys = {
      { "<A-Left>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer", mode = "n" },
      { "<A-Right>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer", mode = "n" },
      { "<A-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer", mode = "n" },
      { "<A-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer", mode = "n" },
      { "<A-k>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer", mode = "n" },
      { "<A-j>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer", mode = "n" },
      { ")b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer", mode = "n" },
      { "(b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer", mode = "n" },
      { "(B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
      { ")B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    },
  },
}
