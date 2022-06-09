local filetree = {}

function filetree.plugins(use)
  use("kyazdani42/nvim-tree.lua")
  use("nvim-telescope/telescope-file-browser.nvim")
end

function filetree.setup()
  require("nvim-tree").setup({
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
    update_focused_file = {
      enable = true,
    },
  })

  vim.highlight.create("NvimTreeFolderName", { guifg = require("nord.colors").nord9_gui }, false)

  -- vim.api.nvim_create_user_command("TreeToggle", function()
  --   local view = require("nvim-tree.view")
  --   if view.win_open() then
  --     view.close()
  --     require("bufferline.state").set_offset(0)
  --   else
  --     require("bufferline.state").set_offset(40, "FileTree")
  --     require("nvim-tree.lib").open()
  --   end
  -- end, {})
  --
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
