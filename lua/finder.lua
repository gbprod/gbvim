return {
  plugins = function(use)
    use("nvim-telescope/telescope.nvim")
  end,

  setup = function()
    require("telescope").setup({
      defaults = {
        sorting_strategy = "ascending",
      },
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

    map(
      "n",
      "<c-p>",
      "<cmd>lua require('telescope.builtin').find_files()<cr>",
      {}
    )

    -- lua print(vim.inspect(require'nvim-tree.lib'.get_node_at_cursor()))
  end,
}
