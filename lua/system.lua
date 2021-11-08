return {
  plugins = function(use)
    use("nvim-lua/plenary.nvim")
    use("tpope/vim-eunuch")
    use("ahmedkhalf/project.nvim")
  end,

  setup = function()
    require("project_nvim").setup({
      patterns = {
        ".git/",
        ".env",
        ".env.dist",
        ".project.lua",
        ".envrc",
      },
      silent_chdir = false,
    })

    require("telescope").load_extension("projects")
  end,
  bindings = function(_)
    local wk = require("which-key")
    wk.register({
      ["<leader>p"] = {
        name = "+Project",
        p = { "<cmd>Telescope projects<cr>", "Projects" },
      },
    })
  end,
}
