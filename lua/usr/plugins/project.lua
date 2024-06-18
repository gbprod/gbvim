return {
  {
    "ahmedkhalf/project.nvim",
    priority = 1000,
    config = function()
      require("project_nvim").setup({
        patterns = {
          ".git/",
          ".env",
          ".env.dist",
          ".nvim.lua",
          ".envrc",
          "composer.json",
        },
        silent_chdir = false,
      })

      require("telescope").load_extension("projects")

      vim.keymap.set("n", "<leader>pp", require("telescope").extensions.projects.projects, { desc = "Projects" })

      vim.api.nvim_create_autocmd("VimEnter", {
        pattern = "*",
        callback = function()
          if "" == vim.api.nvim_buf_get_name(0) then
            return
          end

          if 0 == vim.fn.filereadable(vim.api.nvim_buf_get_name(0)) then
            vim.api.nvim_set_current_dir(vim.api.nvim_buf_get_name(0))
            vim.notify("Set CWD to " .. vim.api.nvim_buf_get_name(0))
          end
        end,
      })
    end,
  },
}
