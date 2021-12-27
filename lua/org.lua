return {
  plugins = function(use)
    use("nvim-neorg/neorg")
  end,

  setup = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.norg.dirman"] = {
          config = {
            workspaces = {
              work = "~/neorg",
            },
          },
        },
        ["core.norg.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
      },
    })
  end,
}
