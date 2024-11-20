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
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    config = function()
      require("CopilotChat.integrations.cmp").setup()
      require("CopilotChat").setup()
    end,
    keys = {
      {
        "<leader>gcc",
        function()
          local actions = require("CopilotChat.actions")
          local prompt_actions = actions.prompt_actions() or {}
          local help_actions = actions.help_actions() or {}
          require("CopilotChat.integrations.telescope").pick(vim.tbl_deep_extend("force", prompt_actions, help_actions))
        end,
        desc = "CopilotChat - Actions",
      },
      {
        "<leader>gcq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
          end
        end,
        desc = "CopilotChat - Quick chat",
      },
    },
  },
}
