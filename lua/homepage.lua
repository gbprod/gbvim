return {
  plugins = function(use)
    use("goolord/alpha-nvim")
  end,

  setup = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local button = dashboard.button

    dashboard.section.buttons.val = {
      button("r", "  Recents", ":Telescope oldfiles cwd_only=true<cr>"),
      button("t", "  Filetree", ":NvimTreeToggle<cr>"),
      button("f", "  Find File", ":Telescope find_files<cr>"),
      button("g", "  Git Status", ":Telescope git_status<cr>"),
      button("w", "  Find Word", ":Telescope live_grep<cr>"),
      button("e", "  New file", ":ene <cr>"),
      button("u", "  Update plugins", ":PackerSync<cr>"),
    }

    alpha.setup(dashboard.opts)

    vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
    ]])

    dashboard.section.header.val = {
      " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
      " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
      " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
      " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
      " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
      " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    }

    vim.api.nvim_exec(
      "autocmd VimEnter * if argc() == 1 && !filereadable(argv()[0]) | Alpha",
      false
    )
  end,
}
