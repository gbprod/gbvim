local search = {}

function search.plugins(use)
  use("windwp/nvim-spectre")
end

function search.bindings(map)
  local opts = { noremap = true, silent = true }

  map("n", "*", function()
    vim.fn.execute("normal! *N")
  end, opts)

  map("n", "#", function()
    vim.fn.execute("normal! #N")
  end, opts)

  map("n", "g*", function()
    vim.fn.execute("normal! g*N")
  end, opts)

  map("n", "g#", function()
    vim.fn.execute("normal! g#N")
  end, opts)

  map("n", "n", function()
    vim.fn.execute("normal! " .. vim.v.count1 .. "n")
  end, opts)

  map("n", "N", function()
    vim.fn.execute("normal! " .. vim.v.count1 .. "N")
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
