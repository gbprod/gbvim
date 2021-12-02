return {
  plugins = function(use)
    use("tpope/vim-sleuth")
    use("blackCauldron7/surround.nvim")
    use("tpope/vim-abolish")
    use("FooSoft/vim-argwrap")
    use("lambdalisue/suda.vim")
    use("ntpeters/vim-better-whitespace")
    use("christoomey/vim-sort-motion")
    use("tpope/vim-repeat")
    use("numToStr/Comment.nvim")
  end,

  setup = function()
    vim.cmd([[ autocmd ColorScheme * highlight ExtraWhitespace guibg=#3B4252]])

    vim.g.better_whitespace_enabled = 1
    vim.g.strip_whitespace_on_save = 1
    vim.g.strip_whitespace_confirm = 0
    vim.g.better_whitespace_operator = ""

    vim.g.argwrap_tail_comma = 1

    require("Comment").setup()

    require("surround").setup({
      mappings_style = "surround",
    })
  end,

  bindings = function(map)
    local wk = require("which-key")

    -- Save
    map("n", "<c-s>", ":<c-u>w<CR>", { noremap = true })
    map("v", "<c-s>", ":<c-u>w<CR>gv", { noremap = true })
    map("i", "<C-s>", "<C-o>:w<CR>", { noremap = true })

    map("n", "<C-l>", ":<C-u>noh<CR><C-l>", { noremap = true, silent = true })

    -- Ctrl+Shift+Up/Down to move up and down
    map("n", "<C-S-Down>", ":m .+1<CR>==", { noremap = true, silent = true })
    map("n", "<C-S-Up>", ":m .-2<CR>==", { noremap = true, silent = true })
    map(
      "i",
      "<C-S-Down>",
      "<Esc>:m .+1<CR>==gi",
      { noremap = true, silent = true }
    )
    map(
      "i",
      "<C-S-Up>",
      "<Esc>:m .-2<CR>==gi",
      { noremap = true, silent = true }
    )
    map(
      "v",
      "<C-S-Down>",
      ":m '>+1<CR>gv=gv",
      { noremap = true, silent = true }
    )
    map("v", "<C-S-Up>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

    -- Use tab for indenting in visual mode
    map("i", "<S-Tab>", "<C-D>", { noremap = true })
    map("v", "<Tab>", ">gv", { noremap = true })
    map("v", "<S-Tab>", "<gv", { noremap = true })
    map("v", ">", ">gv", { noremap = true })
    map("v", "<", "<gv", { noremap = true })
    map("i", "<C-d>", "<c-o>cw", { noremap = true })

    map(
      "v",
      "S",
      "gv<cmd>lua require'surround'.surround_add()<cr>",
      { noremap = true }
    )

    wk.register({
      ["<leader>"] = {
        O = { "<cmd>pu! _<cr>:']+1<cr>", "which_key_ignore" },
        o = { "<cmd>pu _<cr>:'[-1<cr>", "which_key_ignore" },
        [";"] = { "A;<C-c>", "which_key_ignore" },
        [","] = { "A,<C-c>", "which_key_ignore" },
      },
      ["<leader>j"] = {
        name = "+Join/Split",
        j = { "<cmd>ArgWrap<cr>", "Wrap Args" },
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
  end,
}
