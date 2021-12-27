return {
  plugins = function(use)
    use("nvim-telescope/telescope.nvim")
    use("gbprod/open-related.nvim")
  end,

  setup = function()
    require("telescope").setup({
      defaults = {
        sorting_strategy = "ascending",
        layout_config = {
          width = 0.9,
          height = 0.9,
        },
      },
    })
    require("open-related").setup({
      open_with = "telescope",
      create_with = "telescope",
    })
  end,

  bindings = function(map)
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
  end,
}
