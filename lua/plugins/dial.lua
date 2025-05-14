return {
  {
    "monaqa/dial.nvim",
    opts = function(_, opts)
      local augend = require("dial.augend")
      vim.list_extend(opts.groups.default, {
        augend.constant.new({
          elements = { "and", "or" },
          word = true,
          cyclic = true,
        }),
        augend.constant.new({
          elements = { "public", "protected", "private" },
          word = true,
          cyclic = true,
        }),
        augend.constant.new({
          elements = { "!==", "===" },
          word = false,
          cyclic = true,
        }),
        augend.constant.new({
          elements = { "!=", "==" },
          word = false,
          cyclic = true,
        }),
      })
      opts.groups.gitcommit = {
        augend.constant.new({
          elements = { "feat", "fix", "chore", "refactor", "test", "docs", "style", "perf" },
          word = true,
          cyclic = true,
        }),
      }

      return opts
    end,
  },
}
