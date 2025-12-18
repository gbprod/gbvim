return {
  {
    "folke/sidekick.nvim",
    keys = {
      { "<tab>", false, mode = { "n" }, expr = true },
      { "<a-b>", LazyVim.cmp.map({ "ai_nes" }, "<a-b>"), mode = { "n" }, expr = true },
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle({ name = "copilot", focus = true })
        end,
        desc = "Sidekick Copilot Toggle",
      },
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
