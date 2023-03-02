return {
  {
    "ahmedkhalf/project.nvim",
    config = function()
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

      vim.keymap.set("n", "<leader>pp", require("telescope").extensions.projects.projects, { desc = "Projects" })
    end,
  },
}
