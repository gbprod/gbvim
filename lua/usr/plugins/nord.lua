return {
  {
    dir = "~/workspace/nord.nvim/",
    lazy = false,
    priority = 1000,
    config = function()
      require("nord").setup({
        diff = { mode = "fg" },
        borders = true,
        errors = { mode = "none" },
        on_highlights = function(highlights, colors)
          highlights.Search = { bg = colors.polar_night.brighter, bold = true }
        end,
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
