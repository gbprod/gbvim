local filetree = {}

function filetree.plugins(use)
  use("kyazdani42/nvim-tree.lua")
  use("nvim-telescope/telescope-file-browser.nvim")
end

function filetree.setup()
  require("nvim-tree").setup({
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
    },
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = true,
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
      mappings = {
        custom_only = false,
        list = {},
      },
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
    filters = {
      dotfiles = false,
      custom = { "^.null\\-ls_" },
      exclude = {},
    },
    renderer = {
      highlight_git = true,
      highlight_opened_files = "icon",
      special_files = {},
      icons = {
        show = {
          git = false,
          file = true,
          folder = true,
          folder_arrow = true,
        },
        glyphs = {
          git = {
            unstaged = "~",
            staged = "+",
            unmerged = "",
            renamed = ">",
            untracked = "*",
            deleted = "-",
            ignored = "",
          },
        },
      },
    },
  })

  local api = require("nvim-tree.api")

  api.events.subscribe(api.events.Event.FileCreated, function(data)
    vim.cmd(":edit " .. data.fname)
  end)
  vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = require("nord.colors").nord9_gui })

  require("telescope").load_extension("file_browser")
end

function filetree.bindings(map)
  local opts = { noremap = true, silent = true }
  local wk = require("which-key")

  map("n", "<M-a>", ":NvimTreeToggle<CR>", opts)

  wk.register({
    ["<leader>f"] = { name = "+Files" },
    ["<leader>fo"] = { "<cmd>NvimTreeFindFile<cr>", "Reveal in filetree" },
    ["<leader>fb"] = { "<cmd>Telescope file_browser grouped=true<cr>", "File browser" },
  })
end

return filetree
