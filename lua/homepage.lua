local layer = {}

layer.plugins = function(use)
  use 'glepnir/dashboard-nvim'
end

layer.setup = function()
  vim.g.dashboard_default_executive = 'telescope'
  vim.g.dashboard_custom_section = {
    a = {description = {"  Load Last Session"}, command = "SessionLoad"},
    b = {description = {"  Recents          "}, command = "Telescope oldfiles"},
    c = {description = {"  Find File        "}, command = "Telescope find_files"},
    d = {description = {"  Find Word        "}, command = "Telescope live_grep"},
    d = {description = {"  Git Status       "}, command = "Telescope git_status"},
    e = {description = {"洛 New File         "}, command = "DashboardNewFile"},
  }
  vim.g.dashboard_custom_header = {
    ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
  }

  local utils = require('telescope.utils')
  local set_var = vim.api.nvim_set_var
  local git_root, ret = utils.get_os_command_output({ "git", "rev-parse", "--show-toplevel" }, vim.loop.cwd())

  local function get_dashboard_git_status()
    local git_cmd = {'git', 'status', '-s', '--', '.'}
    local output = utils.get_os_command_output(git_cmd)
    set_var('dashboard_custom_footer', {'Git status', '', unpack(output)})
  end

  if ret ~= 0 then
    local is_worktree = utils.get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" }, vim.loop.cwd())
    if is_worktree[1] == "true" then
      get_dashboard_git_status()
    else
      set_var('dashboard_custom_footer', {'Not in a git directory'})
    end
  else
    get_dashboard_git_status()
  end
end

return layer
