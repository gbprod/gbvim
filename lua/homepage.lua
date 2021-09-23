return {
  plugins = function(use)
    use("glepnir/dashboard-nvim")
  end,

  setup = function()
    vim.g.dashboard_default_executive = "telescope"
    vim.g.dashboard_custom_section = {
      a = {
        description = { "  Recents          " },
        command = "Telescope oldfiles cwd_only=true",
      },
      b = {
        description = { "  Filetree          " },
        command = "NvimTreeToggle",
      },
      c = {
        description = { "  Find File        " },
        command = "Telescope find_files",
      },
      e = {
        description = { "  Git Status       " },
        command = "Telescope git_status",
      },
      d = {
        description = { "  Find Word        " },
        command = "Telescope live_grep",
      },
      f = {
        description = { "洛 New File         " },
        command = "DashboardNewFile",
      },
    }
    vim.g.dashboard_custom_header = {
      " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
      " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
      " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
      " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
      " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
      " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
    }

    vim.api.nvim_set_var("dashboard_custom_footer", {})
  end,
}
