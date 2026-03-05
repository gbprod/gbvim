return {
  {
    "folke/sidekick.nvim",
    keys = {
      { "<tab>", false, mode = { "n" }, expr = true },
      { "<a-b>", LazyVim.cmp.map({ "ai_nes" }, "<a-b>"), mode = { "n" }, expr = true },
    },
  },
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        ["<a-b>"] = {
          function() -- sidekick next edit suggestion
            return require("sidekick").nes_jump_or_apply()
          end,
          "fallback",
        },
      },
    },
  },
}
