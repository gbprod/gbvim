return {
  {
    "nvim-tree/nvim-tree.lua",
    config = function()
      require("nvim-tree").setup({
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true,
        },
        disable_netrw = true,
        hijack_netrw = true,
        open_on_tab = false,
        update_cwd = false,
        hijack_cursor = true,
        hijack_directories = {
          enable = true,
          auto_open = false,
        },
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
        filesystem_watchers = {
          enable = false,
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

      local nvim_tree_events = require("nvim-tree.events")
      local bufferline_api = require("bufferline.api")
      local function get_tree_size()
        return require("nvim-tree.view").View.width
      end
      nvim_tree_events.subscribe("TreeOpen", function()
        bufferline_api.set_offset(get_tree_size(), "NvimTree")
      end)
      nvim_tree_events.subscribe("Resize", function()
        bufferline_api.set_offset(get_tree_size(), "NvimTree")
      end)
      nvim_tree_events.subscribe("TreeClose", function()
        bufferline_api.set_offset(0)
      end)

      vim.keymap.set("n", "<M-a>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>fo", "<cmd>NvimTreeFindFile<cr>", { desc = "Reveal in filetree" })
    end,
  },
}
