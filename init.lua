local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("usr.options")()
require("usr.defaults")()
require("usr.keymaps")()
require("usr.abbrev")()

require("lazy").setup({
  "nvim-lua/plenary.nvim",
  "tpope/vim-eunuch",
  "tpope/vim-rsi",
  { "nvim-tree/nvim-web-devicons",          opts = {} },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
  },
  {
    dir = "~/workspace/cutlass.nvim",
    lazy = false,
    config = true,
    opts = {
      cut_key = "x",
      override_del = true,
      exclude = { "ns", "nS" },
    },
  },
  { "kylechui/nvim-surround",               opts = {} },
  { "nmac427/guess-indent.nvim",            opts = {} },
  { "kana/vim-textobj-user",                priority = 1000 },
  { "glts/vim-textobj-comment" },
  { "Bekaboo/dropbar.nvim",                 opts = { menu = { win_configs = { border = "shadow" } } } },
  { "lukas-reineke/virt-column.nvim",       opts = {} },
  { "windwp/nvim-autopairs",                opts = { check_ts = true } },
  { "folke/todo-comments.nvim",             opts = {} },
  { dir = "~/workspace/stay-in-place.nvim", opts = {} },
  { "tzachar/highlight-undo.nvim",          opts = {} },
  { import = "usr.plugins" },
}, {
  install = {
    colorscheme = { "nord" },
  },
  ui = {
    border = "single",
  },
})
