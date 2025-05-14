return {
  {
    dir = "/home/gbprod/workspace/nord.nvim/",
    lazy = false,
    priority = 1000,
    opts = {
      diff = { mode = "fg" },
      search = { theme = "vscode" },
      borders = true,
      transparent = false,
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
      on_highlights = function(highlights, c)
        highlights["@variable.parameter.bash"] = { link = "@variable" }
        highlights["NormalNC"] = { bg = "#292f3a" }
      end,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}
