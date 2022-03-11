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
  use("phaazon/hop.nvim")
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

  require("hop").setup({
    teasing = false,
  })
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

  vim.api.nvim_set_keymap(
    "n",
    "f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
    {}
  )
  vim.api.nvim_set_keymap(
    "n",
    "F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
    {}
  )
  vim.api.nvim_set_keymap(
    "o",
    "f",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
    {}
  )
  vim.api.nvim_set_keymap(
    "o",
    "F",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, inclusive_jump = true })<cr>",
    {}
  )
  vim.api.nvim_set_keymap(
    "",
    "t",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>",
    {}
  )
  vim.api.nvim_set_keymap(
    "",
    "T",
    "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>",
    {}
  )
  map("n", "m", "<cmd>HopChar2AC<cr>", {})
  map("n", "M", "<cmd>HopChar2BC<cr>", {})
  map("n", "gj", "<cmd>HopLine<cr>", {})
end

return motions
