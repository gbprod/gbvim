return {
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      opts.highlights = require("nord.plugins.bufferline").akinsho()
      opts.options.always_show_bufferline = true

      return opts
    end,
  },
}
