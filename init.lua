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
  { "nvim-tree/nvim-web-devicons", opts = {} },
  {
    dir = "~/workspace/cutlass.nvim",
    opts = {
      cut_key = "x",
      override_del = true,
      exclude = { "ns", "nS" },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local which_key = require("which-key")
      which_key.setup({})
    end,
  },
  { "kylechui/nvim-surround", opts = {} },
  { "nmac427/guess-indent.nvim", opts = {} },
  { "kana/vim-textobj-user", priority = 1000 },
  "glts/vim-textobj-comment",
  { import = "usr.plugins.nvim-various-textobjs" },
  { "folke/neodev.nvim", opts = {} },
  { import = "usr.plugins.comment" },
  { import = "usr.plugins.indent_blankline" },
  { "lukas-reineke/virt-column.nvim", opts = {} },
  { import = "usr.plugins.nord" },
  { import = "usr.plugins.lualine" },
  { import = "usr.plugins.project_nvim" },
  -- { "vigoux/notifier.nvim", opts = {} },
  { import = "usr.plugins.nvim-notify" },
  { import = "usr.plugins.bufferline" },
  { "Bekaboo/dropbar.nvim", opts = { menu = { win_configs = { border = "shadow" } } } },
  { import = "usr.plugins.treesitter" },
  { import = "usr.plugins.colorizer" },
  { import = "usr.plugins.scrollbar" },
  { import = "usr.plugins.neo-tree" },
  { import = "usr.plugins.telescope" },
  { import = "usr.plugins.dressing" },
  { import = "usr.plugins.open-related" },
  { "windwp/nvim-autopairs", opts = { check_ts = true } },
  { import = "usr.plugins.cmp" },
  { import = "usr.plugins.gitsigns" },
  { import = "usr.plugins.lspconfig" },
  { import = "usr.plugins.phpactor" },
  { import = "usr.plugins.trouble" },
  { "folke/todo-comments.nvim", opts = {} },
  { import = "usr.plugins.textcase" },
  { import = "usr.plugins.treesj" },
  { dir = "~/workspace/stay-in-place.nvim", opts = {} },
  { import = "usr.plugins.dial" },
  { import = "usr.plugins.diffview" },
  { import = "usr.plugins.alpha" },
  { import = "usr.plugins.null-ls" },
  { import = "usr.plugins.leap" },
  { import = "usr.plugins.hlslens" },
  { import = "usr.plugins.spectre" },
  { import = "usr.plugins.toggleterm" },
  { import = "usr.plugins.yanky" },
  { import = "usr.plugins.substitute" },
  { import = "usr.plugins.iron" },
  { import = "usr.plugins.sentiment" },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set("i", "<c-g>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true })
      vim.keymap.set("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true })
      vim.keymap.set("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true })
      -- vim.keymap.set("i", "<c-x>", function()
      --   return vim.fn["codeium#Clear"]()
      -- end, { expr = true })
    end,
  },
  { "kevinhwang91/nvim-bqf", ft = "qf" },
}, {
  install = {
    colorscheme = { "nord" },
  },
  ui = {
    border = "single",
  },
})
