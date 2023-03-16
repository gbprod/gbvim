return {
  {
    "hkupty/iron.nvim",
    keys = {
      { "<leader>rr", "<cmd>IronRepl<cr>", desc = "Repl" },
    },
    cmd = "IronRepl",
    config = function()
      require("iron.core").setup({
        config = {
          repl_open_cmd = require("iron.view").split.horizontal.botright(0.4),
        },
      })
    end,
  },
}
