local edit = {}

function edit.plugins(use)
  use("kylechui/nvim-surround")
  use("tpope/vim-abolish")
  use("Wansmer/treesj")
  -- use("FooSoft/vim-argwrap")
  use("lambdalisue/suda.vim")
  use("christoomey/vim-sort-motion")
  use("tpope/vim-repeat")
  use("numToStr/Comment.nvim")
  use("monaqa/dial.nvim")
  use("tpope/vim-rsi")
  use("nmac427/guess-indent.nvim")

  use("~/workspace/stay-in-place.nvim")
end

function edit.setup()
  require("stay-in-place").setup({
    -- on_apply_operator = require("stay-in-place.integration").tpope_repeat,
  })
  require("guess-indent").setup({})
  require("nvim-surround").setup({})

  -- vim.g.argwrap_tail_comma_braces = 1
  require("treesj").setup({
    use_default_keymaps = false,
    check_syntax_error = true,
    max_join_length = 120,
    cursor_behavior = "hold",
    notify = true,
  })

  local augend = require("dial.augend")
  require("dial.config").augends:register_group({
    default = {
      augend.integer.alias.decimal,
      augend.integer.alias.hex,
      augend.date.alias["%Y-%m-%d"],
      augend.date.alias["%H:%M:%S"],
      augend.date.alias["%H:%M"],
      augend.constant.alias.bool,
      augend.semver.alias.semver,
      augend.constant.new({
        elements = { "and", "or" },
        word = true,
        cyclic = true,
      }),
      augend.constant.new({
        elements = { "&&", "||" },
        word = false,
        cyclic = true,
      }),
      augend.constant.new({
        elements = { "public", "protected", "private" },
        word = true,
        cyclic = true,
      }),
      augend.constant.new({
        elements = { "!==", "===" },
        word = false,
        cyclic = true,
      }),
    },
    gitcommit = {
      augend.constant.new({
        elements = { "feat", "fix", "chore", "refactor", "test", "docs", "style", "perf" },
        word = true,
        cyclic = true,
      }),
    },
  })

  require("Comment").setup({
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  })
end

function edit.bindings(map)
  local wk = require("which-key")

  -- Save
  map("n", "<c-s>", ":<c-u>w<CR>", { noremap = true })
  map("v", "<c-s>", ":<c-u>w<CR>gv", { noremap = true })
  map("i", "<C-s>", "<C-o>:w<CR>", { noremap = true })

  -- Ctrl+Shift+Up/Down to move up and down
  map("n", "<C-S-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
  map("n", "<C-S-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
  map("i", "<C-S-Down>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
  map("i", "<C-S-Up>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
  map("v", "<C-S-Down>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
  map("v", "<C-S-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

  map("n", "<C-a>", require("dial.map").inc_normal(), { noremap = true })
  map("n", "<C-x>", require("dial.map").dec_normal(), { noremap = true })
  map("v", "<C-a>", require("dial.map").inc_visual(), { noremap = true })
  map("v", "<C-x>", require("dial.map").dec_visual(), { noremap = true })
  map("v", "g<C-a>", require("dial.map").inc_gvisual(), { noremap = true })
  map("v", "g<C-x>", require("dial.map").dec_gvisual(), { noremap = true })

  map("n", "(o", "<cmd>pu! _<cr>:']+1<cr>", { noremap = true })
  map("n", ")O", "<cmd>pu! _<cr>:']+1<cr>", { noremap = true })
  map("n", ")o", "<cmd>pu _<cr>:'[-1<cr>", { noremap = true })
  map("n", "(O", "<cmd>pu _<cr>:'[-1<cr>", { noremap = true })

  wk.register({
    ["<leader>"] = {
      [";"] = { "A;<C-c>", "which_key_ignore" },
      [","] = { "A,<C-c>", "which_key_ignore" },
    },
    ["<leader>j"] = {
      name = "+Join/Split",
      j = { "<cmd>TSJToggle<cr>", "Toggle" },
      s = { "<cmd>TSJSplit<cr>", "Split" },
      J = { "<cmd>TSJJoin<cr>", "Join" },
    },
    ["<leader>x"] = {
      name = "+String",
    },
    ["<leader>xc"] = {
      name = "+Convert case",
      s = { "<Plug>(abolish-coerce-word)s", "snake_case", mode = "n" },
      m = { "<Plug>(abolish-coerce-word)m", "MixedCase", mode = "n" },
      c = { "<Plug>(abolish-coerce-word)c", "camelCase", mode = "n" },
      u = { "<Plug>(abolish-coerce-word)u", "UPPER_CASE", mode = "n" },
      t = { "<Plug>(abolish-coerce-word)t", "Title Case", mode = "n" },
      ["-"] = { "<Plug>(abolish-coerce-word)-", "dash-case", mode = "n" },
      ["."] = { "<Plug>(abolish-coerce-word).", "dot.case", mode = "n" },
      ["<space>"] = {
        "<Plug>(abolish-coerce-word)<space>",
        "space case",
        mode = "n",
      },
    },
    ["<leader>xo"] = { "<Plug>SortMotion", "Sort <motion>" },
    ["<leader>fW"] = { ":SudaWrite<CR>", "Sudo save" },
  }, {
    mode = "n",
  })

  wk.register({
    ["<leader>xc"] = {
      name = "+Convert case",
      s = { "<Plug>(abolish-coerce)s", "snake_case", mode = "v" },
      m = { "<Plug>(abolish-coerce)m", "MixedCase", mode = "v" },
      c = { "<Plug>(abolish-coerce)c", "camelCase", mode = "v" },
      u = { "<Plug>(abolish-coerce)u", "UPPER_CASE", mode = "v" },
      t = { "<Plug>(abolish-coerce)t", "Title Case", mode = "v" },
      ["-"] = { "<Plug>(abolish-coerce)-", "dash-case", mode = "v" },
      ["."] = { "<Plug>(abolish-coerce).", "dot.case", mode = "v" },
      ["<space>"] = {
        "<Plug>(abolish-coerce)<space>",
        "space case",
        mode = "v",
      },
    },
    ["<leader>xo"] = { "<Plug>SortMotionVisual", "Sort" },
  }, {
    mode = "v",
  })
end

return edit
