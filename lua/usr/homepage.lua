local homepage = {}

function homepage.plugins(use)
  use("goolord/alpha-nvim")
end

function homepage.setup()
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")
  local button = dashboard.button

  dashboard.section.buttons.val = {
    button("r", "  > Recents", ":Telescope oldfiles cwd_only=true<cr>"),
    button("b", "  > Filebrowser", ":Telescope file_browser grouped=true<cr>"),
    button("t", "  > Filetree", ":NvimTreeToggle<cr>"),
    button("f", "  > Find File", ":Telescope find_files<cr>"),
    button("g", "  > Git Status", ":Telescope git_status<cr>"),
    button("w", "  > Find Word", ":Telescope live_grep<cr>"),
    button("e", "  > New file", ":ene <cr>"),
    button("u", "  > Update plugins", ":PackerSync<cr>"),
    button("q", "  > Exit", ":qa<cr>"),
  }

  dashboard.section.buttons.opts = {
    spacing = 0,
  }

  alpha.setup(dashboard.config)

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

  vim.api.nvim_exec("autocmd VimEnter * lua require('usr.homepage').on_vim_enter()", false)
end

function homepage.on_vim_enter()
  if 2 == vim.tbl_count(vim.v.argv) and 0 == vim.fn.filereadable(vim.v.argv[2]) then
    vim.cmd("Alpha")
    vim.cmd("bwipeout 1")
  end
end

return homepage
