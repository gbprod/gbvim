return {
  {
    dir = "~/workspace/substitute.nvim",
    config = function()
      require("substitute").setup({
        yank_substituted_text = false,
        on_substitute = require("yanky.integration").substitute(),
        preserve_cursor_position = true,
        range = {
          prompt_current_text = true,
          group_substituted_text = true,
        },
        exchange = {
          preserve_cursor_position = true,
        },
      })
    end,
    keys = {
      {
        "s",
        mode = { "n" },
        function()
          require("substitute").operator({
            modifiers = function(state)
              if state.vmode == "char" then
                return { "trim" }
              end
            end,
          })
        end,
        desc = "Substitute",
      },
      {
        "ss",
        mode = { "n" },
        function()
          require("substitute").line({
            modifiers = { "reindent" },
          })
        end,
        desc = "Substitute line",
      },
      {
        "S",
        mode = { "n" },
        function()
          require("substitute").eol()
        end,
        desc = "Substitute EOL",
      },
      {
        "s",
        mode = { "x" },
        function()
          require("substitute").visual()
        end,
        desc = "Substitute",
      },
      {
        ")s",
        mode = { "n", "x" },
        function()
          require("substitute").operator({
            modifiers = { "linewise" },
          })
        end,
        desc = "Substitute linewise",
      },
      {
        "=s",
        mode = { "n" },
        function()
          require("substitute").operator({
            modifiers = { "linewise", "reindent" },
          })
        end,
        desc = "Substitute linewise and reindent",
      },
      {
        "]s",
        mode = { "n" },
        function()
          require("substitute").operator({
            modifiers = require("substitute.modifiers").build({ "join", "trim" }),
          })
        end,
        desc = "Substitute linewise and join",
      },

      {
        "sx",
        mode = { "n" },
        function()
          require("substitute.exchange").operator()
        end,
        desc = "Exchange",
      },
      {
        "sxx",
        mode = { "n" },
        function()
          require("substitute.exchange").line()
        end,
        desc = "Exchange line",
      },
      {
        "X",
        mode = { "x" },
        function()
          require("substitute.exchange").visual()
        end,
        desc = "Exchange",
      },
      {
        "sxc",
        mode = { "n" },
        function()
          require("substitute.exchange").cancel()
        end,
        desc = "Exchange cancel",
      },
    },
  },
}
