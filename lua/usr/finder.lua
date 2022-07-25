local finder = {}

function finder.plugins(use)
  use("nvim-telescope/telescope.nvim")
  use("stevearc/dressing.nvim")
  use("~/workspace/open-related.nvim")
end

function finder.setup()
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
    },
  })

  require("dressing").setup({
    input = {
      enabled = true,
      anchor = "SW",
      border = "rounded",
      relative = "win",
      winblend = 0,
      override = function(opt)
        if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
          opt.anchor = "SW"
          opt.col = 1
          opt.row = vim.o.lines - vim.o.cmdheight - 1
          opt.relative = "editor"
        end
      end,
    },
    select = {
      enabled = true,
      backend = { "telescope", "builtin" },
      telescope = require("telescope.themes").get_dropdown(),
    },
  })

  require("open-related").setup({
    open_with = "telescope",
    create_with = "telescope",
  })

  vim.cmd([[
    cnoreabbrev T Telescope
  ]])
end

function finder.bindings(map)
  local wk = require("which-key")

  wk.register({
    ["<leader>ff"] = {
      "<cmd>lua require('telescope.builtin').find_files()<cr>",
      "Find files",
    },
    ["<leader>fw"] = {
      "':Telescope find_files<cr>' . expand('<cword>')",
      "Find file <cword>",
      expr = true,
    },
    ["<leader>fm"] = {
      "<cmd>Telescope oldfiles cwd_only=true<cr>",
      "MRU files",
    },
    ["<leader>fr"] = {
      "<cmd>OpenRelated<cr>",
      "Related files",
    },
    ["<leader>fc"] = {
      "<cmd>CreateRelated<cr>",
      "Create related files",
    },
    ["<leader>s"] = {
      name = "+Search",
      s = {
        "<cmd>lua require('telescope.builtin').live_grep()<cr>",
        "Live grep",
      },
      w = {
        "<cmd>lua require('telescope.builtin').grep_string()<cr>",
        "Grep word",
      },
    },
    ["<leader>bb"] = {
      "<cmd>lua require('telescope.builtin').buffers()<cr>",
      "Buffers",
    },
  }, {
    mode = "n",
  })

  map("n", "<c-p>", "<cmd>lua require('telescope.builtin').find_files()<cr>", {})
end

return finder
