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
vim.opt.rtp:prepend("~/workspace/gbvim/") -- TDOD: REMOVE

require("usr.options")()
require("usr.defaults")()

require("lazy").setup({
  "nvim-lua/plenary.nvim",
  "tpope/vim-eunuch",
  { "nvim-tree/nvim-web-devicons", opts = {} },
  { "folke/which-key.nvim", opts = {} },
  { "kylechui/nvim-surround", opts = {} },
  { "nmac427/guess-indent.nvim", opts = {} },
  {
    "numToStr/Comment.nvim",
    opts = {
      pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    },
  },
  { import = "usr.plugins.indent_blankline" },
  { "lukas-reineke/virt-column.nvim", opts = {} },
  { import = "usr.plugins.nord" },
  { import = "usr.plugins.lualine" },
  { import = "usr.plugins.project_nvim" },
  { "vigoux/notifier.nvim", opts = {} },
  { "SmiteshP/nvim-navic", opts = { highlight = true } },
  { import = "usr.plugins.bufferline" },
  { "utilyre/barbecue.nvim", opts = { exclude_filetypes = { "gitcommit", "toggleterm", "gitrebase" } } },
  { import = "usr.plugins.treesitter" },
  { import = "usr.plugins.colorizer" },
  { import = "usr.plugins.scrollbar" },
  { import = "usr.plugins.nvim-tree" },
  { import = "usr.plugins.telescope" },
  { import = "usr.plugins.dressing" },
  { import = "usr.plugins.dressing" },
  { import = "usr.plugins.open-related" },
}, {
  ui = {
    border = "single",
  },
})
