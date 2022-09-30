local motions = {}

function motions.plugins(use)
  use("kana/vim-textobj-user")
  use("kana/vim-textobj-indent")
  use("kana/vim-textobj-entire")
  use("kana/vim-textobj-line")
  use("glts/vim-textobj-comment")
  use({ "Julian/vim-textobj-variable-segment", branch = "main" })
  use("terryma/vim-expand-region")
  use("andymass/vim-matchup")
  use("ggandor/leap.nvim")
  use("ggandor/flit.nvim")
end

function motions.setup()
  vim.g.expand_region_text_objects = {
    ["iw"] = 0,
    ["iW"] = 0,
    ['i"'] = 0,
    ["i'"] = 0,
    ["i]"] = 1,
    ["ib"] = 1,
    ["iB"] = 1,
    ["il"] = 1,
    ["ii"] = 1,
    ["ip"] = 0,
    ["if"] = 1,
    ["ic"] = 1,
    ["ie"] = 0,
  }

  require("nvim-treesitter.configs").setup({
    matchup = {
      enable = true,
      disable = {},
    },
  })
  vim.g.matchup_matchparen_offscreen = {}

  vim.g.textobj_comment_no_default_key_mappings = 1

  require("leap").setup({
    safe_labels = { "m", "n", "u", "t", ",", "F", "L", "N", "H", "G", "M", "U", "T", "Z" },
    -- stylua: ignore
    -- luacheck:ignore 631
    labels = {"m", "n", "j", "k", "l", "o", "d", "w", "e", "h", "m", "v", "g", "u", "t", "c", ".", "z", ",", "F", "L", "N", "H", "G", "M", "U", "T", "Z"},
  })

  require("flit").setup({
    multiline = true,
    eager_ops = true,
    keymaps = { f = "f", F = "F", t = "t", T = "T" },
  })
end

function motions.bindings(map)
  map("x", "v", "<Plug>(expand_region_expand)", {})
  map("x", "V", "<Plug>(expand_region_shrink)", {})

  map("x", "ax", "<Plug>(textobj-comment-a)", {})
  map("o", "ax", "<Plug>(textobj-comment-a)", {})
  map("x", "ix", "<Plug>(textobj-comment-i)", {})
  map("o", "ix", "<Plug>(textobj-comment-i)", {})

  map("n", "(l", "<cmd>lprevious<cr>", {})
  map("n", ")l", "<cmd>lnext<cr>", {})
  map("n", "(L", "<cmd>lfirst<cr>", {})
  map("n", ")L", "<cmd>llast<cr>", {})
  map("n", "(q", "<cmd>cprevious<cr>", {})
  map("n", ")q", "<cmd>cnext<cr>", {})
  map("n", "(Q", "<cmd>cfirst<cr>", {})
  map("n", ")Q", "<cmd>clast<cr>", {})

  map("n", "m", "<Plug>(leap-forward)", {})
  map("n", "M", "<Plug>(leap-backward)", {})
  map("x", "m", "<Plug>(leap-forward)", {})
  map("x", "M", "<Plug>(leap-backward)", {})
  map("o", "m", "<Plug>(leap-forward)", {})
  map("o", "M", "<Plug>(leap-backward)", {})
  map("o", "z", "<Plug>(leap-forward-x)", {})
  map("o", "Z", "<Plug>(leap-backward-x)", {})
  map("n", "gm", "<Plug>(leap-cross-window)", {})
  map("x", "gm", "<Plug>(leap-cross-window)", {})
  map("o", "gm", "<Plug>(leap-cross-window)", {})
end

return motions
