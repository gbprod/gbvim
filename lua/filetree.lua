return {

  plugins = function(use)
    use({
      "kyazdani42/nvim-tree.lua",
      commit = "d7f73b5ae9c8fa85535c32e2861c2cb97df5d56b",
    })
  end,

  setup = function()
    --[[ require("nvim-tree").setup({
      disable_netrw = true,
      hijack_netrw = true,
      open_on_setup = true,
      ignore_ft_on_setup = {},
      auto_close = true,
      open_on_tab = false,
      hijack_cursor = true,
      update_cwd = true,
      lsp_diagnostics = true,
      update_focused_file = {
        enable = false,
        update_cwd = false,
        ignore_list = {},
      },
      system_open = {
        cmd = nil,
        args = {},
      },
      view = {
        width = 40,
        side = "left",
        auto_resize = false,
        mappings = {
          custom_only = false,
          list = {},
        },
      },
    }) ]]

    vim.g.nvim_tree_width = 40
    vim.g.nvim_tree_auto_close = 0
    vim.g.nvim_tree_auto_open = 0
    vim.g.nvim_tree_auto_ignore_ft = { "dashboard" }
    vim.g.nvim_tree_git_hl = 1
    vim.g.nvim_tree_highlight_opened_files = 1
    vim.g.nvim_tree_lsp_diagnostics = 1
    vim.g.nvim_tree_window_picker_exclude = {
      filetype = {
        "packer",
        "qf",
      },
      buftype = {
        "terminal",
      },
    }
    vim.g.nvim_tree_special_files = {}
    vim.g.nvim_tree_show_icons = {
      git = 0,
      folders = 1,
      files = 1,
      folder_arrows = 1,
    }

    vim.g.nvim_tree_icons = {
      default = "",
      symlink = "",
      git = {
        unstaged = "~",
        staged = "+",
        unmerged = "",
        renamed = ">",
        untracked = "*",
        deleted = "-",
        ignored = "",
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
      },
    }

    vim.api.nvim_exec(
      [[
    autocmd ColorScheme * highlight NvimTreeGitDirty guifg=#EBCB8B | highlight Directory guifg=#81A1C1
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) | execute 'cd '.argv()[0] | execute 'Dashboard' | wincmd l | endif
    ]],
      false
    )
  end,

  bindings = function(map)
    local opts = { noremap = true, silent = true }
    local wk = require("which-key")

    map("n", "<F3>", ":NvimTreeToggle<CR>", opts)

    wk.register({
      ["<leader>f"] = { name = "+Files" },
      ["<leader>fo"] = { "<cmd>NvimTreeFindFile<cr>", "Reveal in filetree" },
    })
  end,
}
