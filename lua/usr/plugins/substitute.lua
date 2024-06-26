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

      vim.keymap.set("n", "s", function()
        require("substitute").operator({
          modifiers = function(state)
            if state.vmode == "char" then
              return { "trim" }
            end

            -- if state.vmode == "line" then
            --   return { "reindent" }
            -- end
          end,
        })
      end, { noremap = true })

      vim.keymap.set("n", "ss", function()
        require("substitute").line({
          modifiers = { "reindent" },
        })
      end, { noremap = true })
      vim.keymap.set("n", "S", require("substitute").eol, { noremap = true })
      vim.keymap.set("x", "s", require("substitute").visual, { noremap = true })

      vim.keymap.set({ "n", "x" }, ")s", function()
        require("substitute").operator({
          modifiers = { "linewise" },
        })
      end, { noremap = true })

      vim.keymap.set("n", "=s", function()
        require("substitute").operator({
          modifiers = { "linewise", "reindent" },
        })
      end, { noremap = true })

      vim.keymap.set("n", "]s", function()
        require("substitute").operator({
          modifiers = require("substitute.modifiers").build({ "join", "trim" }),
        })
      end, { noremap = true })

      vim.keymap.set("n", "sx", require("substitute.exchange").operator, { noremap = true })
      vim.keymap.set("n", "sxx", require("substitute.exchange").line, { noremap = true })
      vim.keymap.set("x", "X", require("substitute.exchange").visual, { noremap = true })
      vim.keymap.set("n", "sxc", require("substitute.exchange").cancel, { noremap = true })

      require("which-key").register({ ["<leader>xs"] = { name = "+Substitute" }, { mode = "n" } })
      vim.keymap.set("n", "<leader>xss", function()
        require("substitute.range").operator({ cursor_position = "start", register = "0" })
      end, { desc = "Substitute <motion><motion>" })
      vim.keymap.set("n", "<leader>xsS", function()
        require("substitute.range").operator({ confirm = true })
      end, { desc = "Substitute <motion><motion> with confirm" })
      vim.keymap.set("n", "<leader>xsss", require("substitute.range").word, { desc = "Substitute <motion><motion>" })

      require("which-key").register({ ["<leader>xs"] = { name = "+Substitute" }, { mode = "x" } })
      vim.keymap.set("x", "<leader>xss", require("substitute.range").visual, { desc = "Substitute <motion>" })
      vim.keymap.set("x", "<leader>xsS", function()
        require("substitute.range").visual({ confirm = true })
      end, { desc = "Substitute <motion> with confirm" })
    end,
  },
}
