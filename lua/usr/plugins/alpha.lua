return {
  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      local button = dashboard.button

      dashboard.section.buttons.val = {
        button("r", "  > Recents", ":Telescope oldfiles cwd_only=true<cr>", { silent = true }),
        button("t", "  > Filetree", ":Neotree toggle<cr>", { silent = true }),
        button("b", "  > Filebrowser", ":Telescope file_browser grouped=true<cr>", { silent = true }),
        button("f", "  > Find File", ":Telescope find_files<cr>", { silent = true }),
        button("e", "  > New file", ":ene <cr>", { silent = true }),
        button(
          "u",
          "  > Update plugins",
          ":Lazy update | TSUpdate | lua require('phpactor.handler.update')()<cr>",
          { silent = true }
        ),
        button("q", "  > Exit", ":qa<cr>", { silent = true }),
      }

      dashboard.section.buttons.opts = {
        spacing = 0,
      }

      alpha.setup(dashboard.config)

      dashboard.section.header.val = {
        " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
        " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
        " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
        " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
        " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
        " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
      }

      vim.api.nvim_create_autocmd("VimEnter", {
        pattern = "*",
        callback = function()
          if "" == vim.api.nvim_buf_get_name(0) then
            return
          end
          if 0 == vim.fn.filereadable(vim.api.nvim_buf_get_name(0)) then
            vim.cmd("Alpha")
            vim.cmd("bwipeout 1")
          end
        end,
      })
    end,
  },
}
