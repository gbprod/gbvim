return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = false,
          auto_trigger = false,
          -- keymap = {
          --   accept = "<M-g>",
          --   accept_word = "<M-w>",
          --   accept_line = "<M-l>",
          --   next = "<M-)>",
          --   prev = "<M-(>",
          --   dismiss = "<M-e>",
          -- },
        },
        panel = {
          enabled = false,
        },
        filetypes = {
          markdown = true,
          help = true,
        },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    dependencies = "copilot.lua",
    config = function()
      require("copilot_cmp").setup({})
    end,
  },
}
