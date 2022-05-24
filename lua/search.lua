local search = {}

function search.plugins(use)
  use("haya14busa/vim-asterisk")
  use("windwp/nvim-spectre")
end

function search.bindings(map)
  map("n", "*", "<Plug>(asterisk-z*)", {})
  map("n", "#", "<Plug>(asterisk-z#)", {})
  map("n", "g*", "<Plug>(asterisk-gz*)", {})
  map("n", "g#", "<Plug>(asterisk-gz#)", {})

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
