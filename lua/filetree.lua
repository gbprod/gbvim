return {

  plugins = function(use)
    use 'kyazdani42/nvim-tree.lua'
  end,

  setup = function()
    vim.g.nvim_tree_width = 40
    vim.g.nvim_tree_auto_close = 1
    vim.g.nvim_tree_auto_open = 1
    vim.g.nvim_tree_auto_ignore_ft = { 'dashboard' }
    vim.g.nvim_tree_git_hl = 1
    vim.g.nvim_tree_highlight_opened_files = 1
    vim.g.nvim_tree_lsp_diagnostics = 1
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

  end,

  bindings = function(map)
    local opts = { noremap = true, silent = true }
    local wk = require("which-key")

    map('n', '<F3>', ':NvimTreeToggle<CR>', opts)

    wk.register({
      ["<leader>f"] = { name = "+Files" },
      ["<leader>fo"] = { "<cmd>NvimTreeFindFile<cr>", "Reveal in filetree" }
    })
  end,
}


