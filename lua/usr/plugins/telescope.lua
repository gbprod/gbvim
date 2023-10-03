return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "debugloop/telescope-undo.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    config = function()
      require("telescope").setup({
        defaults = {
          dynamic_preview_title = true,
          sorting_strategy = "ascending",
          layout_config = {
            width = 0.9,
            height = 0.9,
          },
          mappings = {
            i = {
              ["<C-Down>"] = require("telescope.actions").cycle_history_next,
              ["<C-Up>"] = require("telescope.actions").cycle_history_prev,
              ["<C-h>"] = "which_key",
              ["<c-t>"] = require("trouble.providers.telescope").open_with_trouble,
            },
            n = {
              ["<Down>"] = require("telescope.actions").cycle_history_next,
              ["<Up>"] = require("telescope.actions").cycle_history_prev,
              H = "which_key",
              t = require("trouble.providers.telescope").open_with_trouble,
            },
          },
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
          undo = {},
        },
      })
      require("telescope").load_extension("undo")
      require("telescope").load_extension("file_browser")

      vim.cmd([[ cnoreabbrev T Telescope ]])

      vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "Find files" })
      vim.keymap.set(
        "n",
        "<leader>fw",
        "':Telescope find_files default_text=' . expand('<cword>') .'<cr>'",
        { desc = "Find file <cword>", expr = true }
      )
      vim.keymap.set("n", "<leader>fm", function()
        require("telescope.builtin").oldfiles({ cwd_only = true })
      end, { desc = "MRU files" })
      vim.keymap.set("n", "<leader>fu", require("telescope").extensions.undo.undo, { desc = "Undo history" })
      vim.keymap.set("n", "<leader>ss", require("telescope.builtin").live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>sw", require("telescope.builtin").grep_string, { desc = "Grep word" })

      require("which-key").register({ ["<leader>b"] = { name = "+Buffers" } })
      vim.keymap.set("n", "<leader>bb", require("telescope.builtin").buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<c-p>", require("telescope.builtin").find_files, {})
      vim.keymap.set("n", "<leader>fb", "<cmd>Telescope file_browser grouped=true<cr>", { desc = "File browser" })
      vim.keymap.set("n", "<leader>gs", require("telescope.builtin").git_status, { desc = "Git Status" })
      vim.keymap.set("n", "<leader>gg", require("telescope.builtin").git_branches, { desc = "Git Branches" })
    end,
  },
}
