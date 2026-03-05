return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    keys = {
      -- Disable default <leader>a* keymaps
      { "<leader>aa", false, mode = { "n", "x" } },
      { "<leader>ax", false, mode = { "n", "x" } },
      { "<leader>aq", false, mode = { "n", "x" } },
      { "<leader>ap", false, mode = { "n", "x" } },
      -- Remap under <leader>ac
      { "<leader>ac", "", desc = "+copilot-chat", mode = { "n", "x" } },
      {
        "<leader>aca",
        function()
          return require("CopilotChat").toggle()
        end,
        desc = "Toggle (CopilotChat)",
        mode = { "n", "x" },
      },
      {
        "<leader>acx",
        function()
          return require("CopilotChat").reset()
        end,
        desc = "Clear (CopilotChat)",
        mode = { "n", "x" },
      },
      {
        "<leader>acq",
        function()
          vim.ui.input({
            prompt = "Quick Chat: ",
          }, function(input)
            if input ~= "" or input ~= nil then
              require("CopilotChat").ask(input)
            end
          end)
        end,
        desc = "Quick Chat (CopilotChat)",
        mode = { "n", "x" },
      },
      {
        "<leader>acp",
        function()
          require("CopilotChat").select_prompt()
        end,
        desc = "Prompt Actions (CopilotChat)",
        mode = { "n", "x" },
      },
    },
  },
}
