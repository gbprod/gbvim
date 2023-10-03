return {
  {
    "stevearc/dressing.nvim",
    opts = {
      input = {
        enabled = true,
        override = function(conf)
          conf.anchor = "SW"
        end,
        border = "single",
        relative = "win",
        win_options = {
          winblend = 0,
        },
      },
      select = {
        enabled = true,
        backend = { "telescope", "builtin" },
        telescope = require("telescope.themes").get_dropdown(),
      },
    },
  },
}
