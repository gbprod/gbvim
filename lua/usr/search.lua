local search = {}

function search.plugins(use)
  use("windwp/nvim-spectre")
  use("kevinhwang91/nvim-hlslens")
end

function search.bindings(map)
  local opts = { noremap = true, silent = true }
  local hlslens = require("hlslens")
  hlslens.setup({
    calm_down = false,
    nearest_only = true,
    nearest_float_when = "never",
  })

  map("n", "*", function()
    vim.fn.execute("normal! *N")
    hlslens.start()
  end, opts)

  map("n", "#", function()
    vim.fn.execute("normal! #N")
    hlslens.start()
  end, opts)

  map("n", "g*", function()
    vim.fn.execute("normal! g*N")
    hlslens.start()
  end, opts)

  map("n", "g#", function()
    vim.fn.execute("normal! g#N")
    hlslens.start()
  end, opts)

  map("n", "n", function()
    vim.fn.execute("normal! " .. vim.v.count1 .. "n")
    hlslens.start()
  end, opts)

  map("n", "N", function()
    vim.fn.execute("normal! " .. vim.v.count1 .. "N")
    hlslens.start()
  end, opts)

  local wk = require("which-key")

  wk.register({
    ["<leader>sr"] = {
      name = "+Replace",
      r = { "<cmd>lua require('spectre').open()<cr>", "Search and replace" },
      w = {
        "<cmd>lua require('spectre').open_visual({select_word=true})<cr>",
        "Word",
      },
      f = { "<cmd>lua require('spectre').open_file_search()<cr>", "In file" },
    },
  }, {
    mode = "n",
  })
  wk.register({
    ["<leader>sr"] = {
      name = "+Replace",
      r = {
        "<cmd>lua require('spectre').open_visual()<cr>",
        "Search and replace",
      },
    },
  }, {
    mode = "v",
  })
end

return search
