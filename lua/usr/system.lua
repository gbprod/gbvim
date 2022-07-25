local system = {}

function system.plugins(use)
  use("nvim-lua/plenary.nvim")
  use("tpope/vim-eunuch")
  use("ahmedkhalf/project.nvim")
end

function system.setup()
  require("project_nvim").setup({
    patterns = {
      ".git/",
      ".env",
      ".env.dist",
      ".project.lua",
      ".envrc",
      "composer.json",
    },
    silent_chdir = true,
  })

  require("telescope").load_extension("projects")
end
function system.bindings(_)
  local wk = require("which-key")
  wk.register({
    ["<leader>p"] = {
      name = "+Project",
      p = { "<cmd>Telescope projects<cr>", "Projects" },
    },
  })
end

return system
