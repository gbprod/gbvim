return {
  plugins = function(use)
    use("glepnir/dashboard-nvim")
  end,

  setup = function()
    vim.g.dashboard_default_executive = "telescope"
    vim.g.dashboard_custom_section = {
      a = { description = { "  Recents          " }, command = "Telescope oldfiles cwd_only=true" },
      b = { description = { "  Load Last Session" }, command = "SessionLoad" },
      c = { description = { "  Find File        " }, command = "Telescope find_files" },
      d = { description = { "  Find Word        " }, command = "Telescope live_grep" },
      d = { description = { "  Git Status       " }, command = "Telescope git_status" },
      e = { description = { "洛 New File         " }, command = "DashboardNewFile" },
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
