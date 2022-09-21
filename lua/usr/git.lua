local git = {}

function git.plugins(use)
  use("tpope/vim-git")
  use("tpope/vim-fugitive")
  use("lewis6991/gitsigns.nvim")
  use("sindrets/diffview.nvim")
  use("rhysd/committia.vim")
end

function git.setup()
  require("gitsigns").setup({
    keymaps = {
      ["o ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
      ["x ih"] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    },
    preview_config = {
      border = "rounded",
    },
  })

  vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#003300", fg = "NONE" })
  vim.api.nvim_set_hl(0, "DiffChange", { bg = "#003300", fg = "NONE" })
  vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#330011", fg = "NONE" })
  vim.api.nvim_set_hl(0, "DiffText", { bg = "#007800", fg = "NONE" })

  local null_ls = require("null-ls")
  -- null_ls.register(null_ls.builtins.code_actions.gitsigns)
  null_ls.register(null_ls.builtins.code_actions.gitrebase)

  require("diffview").setup({
    enhanced_diff_hl = true,
  })
end

function git.bindings(_)
  local wk = require("which-key")

  wk.register({
    ["<leader>g"] = { name = "+Git" },
    ["<leader>gh"] = { name = "+Hunk" },
    ["<leader>gn"] = {
      "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'",
      "Next hunk",
      expr = true,
    },
    ["<leader>gN"] = {
      "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'",
      "Prev hunk",
      expr = true,
    },
    ["<leader>ghs"] = {
      '<cmd>lua require"gitsigns".stage_hunk()<CR>',
      "Stage hunk",
    },
    ["<leader>ghu"] = {
      '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
      "Undo stage hunk",
    },
    ["<leader>ghr"] = {
      '<cmd>lua require"gitsigns".reset_hunk()<CR>',
      "Reset hunk",
    },
    ["<leader>gR"] = {
      '<cmd>lua require"gitsigns".reset_buffer()<CR>',
      "Reset buffer",
    },
    ["<leader>ghp"] = {
      '<cmd>lua require"gitsigns".preview_hunk()<CR>',
      "Preview hunk",
    },
    ["<leader>gb"] = {
      '<cmd>lua require"gitsigns".blame_line({full=false})<CR>',
      "Blame",
    },
    ["<leader>gB"] = {
      '<cmd>lua require"gitsigns".blame_line({full=true})<CR>',
      "Blame",
    },
    ["<leader>gs"] = { "<cmd>Telescope git_status<CR>", "Status" },
    ["<leader>gg"] = { "<cmd>Telescope git_branches<CR>", "Branches" },
    ["<leader>gd"] = { name = "+Diff" },
    ["<leader>gdf"] = {
      "<cmd>DiffviewFileHistory<CR>",
      "File history",
    },
    ["<leader>gdo"] = {
      "<cmd>DiffviewOpen<CR>",
      "Open",
    },
    ["<leader>gdc"] = {
      "<cmd>DiffviewClose<CR>",
      "Close",
    },
  })

  wk.register({
    ["<leader>ghs"] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ["<leader>ghr"] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
  }, {
    mode = "v",
  })
end

function git.on_ft()
  vim.cmd("setlocal nocindent colorcolumn=+1 textwidth=80 ", true)
end

return git
