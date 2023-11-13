return {
  {
    dir = "~/workspace/nord.nvim/",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup({
        diff = { mode = "fg" },
        search = { theme = "vscode" },
        borders = true,
        errors = { mode = "none" },
        styles = {
          comments = { italic = true },
          keywords = {},
          functions = { italic = true },
          variables = {},
          errors = {},
          bufferline = {
            current = { bold = false },
            modified = { bold = false, italic = true },
          },
        },
      })
      vim.cmd.colorscheme("nord")
    end,
  },
}
