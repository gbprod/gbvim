local motions = {}

function motions.plugins(use)
  use("kana/vim-textobj-user")
  use("kana/vim-textobj-indent")
  use("kana/vim-textobj-entire")
  use("kana/vim-textobj-line")
  use({ "Julian/vim-textobj-variable-segment", branch = "main" })
  use("andymass/vim-matchup")
  use("ggandor/leap.nvim")
  use("ggandor/flit.nvim")
  use("ggandor/leap-spooky.nvim")
end

function motions.setup()
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
    keys = { f = "f", F = "F", t = "t", T = "T" },
    labeled_modes = "nvo",
    multiline = true,
  })
  require("leap-spooky").setup({
    affixes = {
      remote = { window = "r", cross_window = "R" },
      magnetic = { window = "m", cross_window = "M" },
    },
    paste_on_remote_yank = false,
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
