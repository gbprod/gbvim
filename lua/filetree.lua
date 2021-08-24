local layer = {}

layer.plugins = function(use)
  use 'kyazdani42/nvim-tree.lua'
end

layer.setup = function()
  vim.g.nvim_tree_width = 40
  vim.g.nvim_tree_auto_close = 0
  vim.g.nvim_tree_auto_open = 1
  vim.g.nvim_tree_auto_ignore_ft = { 'dashboard' }
-- let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
  vim.g.nvim_tree_git_hl = 1
  vim.g.nvim_tree_highlight_opened_files = 1
  vim.g.nvim_tree_lsp_diagnostics = 1
-- vim.g.nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
-- vim.g.nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
  vim.g.nvim_tree_window_picker_exclude = {
    filetype = {
      'packer',
      'qf'
    },
    buftype = {
      'terminal'
    }
  }
  vim.g.nvim_tree_special_files = { }
  vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1,
    folder_arrows = 1,
  }

  vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
      unstaged = "~",
      staged = "+",
      unmerged = "",
      renamed = ">",
      untracked = "*",
      deleted = "-",
      ignored = ""
    },
    folder = {
      arrow_open = "",
      arrow_closed = "",
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
    },
    lsp = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  }

  vim.cmd [[
    autocmd ColorScheme * highlight NvimTreeGitDirty guifg=#EBCB8B | highlight Directory guifg=#81A1C1
  ]]

end

layer.bindings = function(map)
  local opts = { noremap = true, silent = true }
  local wk = require("which-key")

  map('n', '<F3>', ':NvimTreeToggle<CR>', opts)

  wk.register({
    ["<leader>f"] = { name = "+Files" },
    ["<leader>fo"] = { "<cmd>NvimTreeFindFile<cr>", "Reveal in filetree" }
  })
end

return layer

