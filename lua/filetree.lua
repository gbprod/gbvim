return {
  plugins = function(use)
    use("kyazdani42/nvim-tree.lua")
  end,

  setup = function()
    vim.g.nvim_tree_git_hl = 1
    vim.g.nvim_tree_highlight_opened_files = 1
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
      update_focused_file = {
        enable = true,
      },
    }

    require("nvim-tree").setup({
      disable_netrw = true,
      hijack_netrw = true,
      open_on_setup = true,
      auto_close = false,
      open_on_tab = false,
      update_cwd = false,
      hijack_cursor = true,
      diagnostics = {
        enable = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
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
      update_to_buf_dir = {
        enable = false,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = true,
            chars = "fjqsdghklm",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
      },
    })

    vim.highlight.create("NvimTreeGitDirty", { guifg = "#EBCB8B" }, false)
    vim.highlight.create("Directory ", { guifg = "#81A1C1" }, false)
  end,

  bindings = function(map)
    local opts = { noremap = true, silent = true }
    local wk = require("which-key")

    map("n", "<M-a>", ":NvimTreeToggle<CR>", opts)

    wk.register({
      ["<leader>f"] = { name = "+Files" },
      ["<leader>fo"] = { "<cmd>NvimTreeFindFile<cr>", "Reveal in filetree" },
    })
  end,
}
