local motions = {}

function motions.plugins(use)
  use("kana/vim-textobj-user")
  use("kana/vim-textobj-indent")
  use("kana/vim-textobj-entire")
  use("kana/vim-textobj-line")
  use("glts/vim-textobj-comment")
  use("Julian/vim-textobj-variable-segment")
  use("terryma/vim-expand-region")
  use("andymass/vim-matchup")
  use("ggandor/leap.nvim")
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
end

function motions.bindings(map)
  map("x", "v", "<Plug>(expand_region_expand)", {})
  map("x", "V", "<Plug>(expand_region_shrink)", {})

  map("x", "ax", "<Plug>(textobj-comment-a)", {})
  map("o", "ax", "<Plug>(textobj-comment-a)", {})
  map("x", "ix", "<Plug>(textobj-comment-i)", {})
  map("o", "ix", "<Plug>(textobj-comment-i)", {})

  map("n", "))", "]]", {})
  map("n", "((", "[[", {})

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

  -- map({ "n", "o" }, "f", function()
  --   local c = vim.fn.getcharstr()
  --   local seq = vim.api.nvim_replace_termcodes("<plug>(leap-forward)" .. c .. "<enter>", true, true, true)
  --   vim.api.nvim_feedkeys(seq, "", false)
  -- end, {})
  -- map({ "n", "o" }, "F", function()
  --   local c = vim.fn.getcharstr()
  --   local seq = vim.api.nvim_replace_termcodes("<plug>(leap-backward)" .. c .. "<enter>", true, true, true)
  --   vim.api.nvim_feedkeys(seq, "", false)
  -- end, {})
end

return motions
