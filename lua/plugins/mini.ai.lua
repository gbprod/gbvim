return {
  {
    "echasnovski/mini.ai",
    opts = function(_, opts)
      local ai = require("mini.ai")
      opts.custom_textobjects["s"] = ai.gen_spec.treesitter({ a = "@statement.outer", i = "@statement.outer" })
      opts.custom_textobjects["l"] = ai.gen_spec.treesitter({ a = "@loop.outer", i = "@loop.inner" })
      opts.custom_textobjects["?"] = ai.gen_spec.treesitter({ a = "@conditional.outer", i = "@conditional.inner" })
      opts.custom_textobjects["_"] = false

      return opts
    end,
  },
}
