local edit = {}

function edit.plugins(use)
  -- use("FooSoft/vim-argwrap")
  use("lambdalisue/suda.vim")
  use("christoomey/vim-sort-motion")
  use("tpope/vim-repeat")
end

function edit.bindings(_)
  local wk = require("which-key")

  wk.register({
    ["<leader>xo"] = { "<Plug>SortMotion", "Sort <motion>" },
    ["<leader>fW"] = { ":SudaWrite<CR>", "Sudo save" },
  }, {
    mode = "n",
  })

  wk.register({
    ["<leader>xo"] = { "<Plug>SortMotionVisual", "Sort" },
  }, {
    mode = "v",
  })
end

return edit
