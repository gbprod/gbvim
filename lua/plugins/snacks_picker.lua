return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {},
    },
    keys = {
      {
        "<c-p>",
        function()
          require("snacks.picker").smart({ filter = { cwd = true } })
        end,
        desc = "Find Files (Root Dir)",
      },
      {
        "<leader>,",
        false,
      },
      {
        "<leader>fR",
        LazyVim.pick("oldfiles"),
        desc = "Recent",
      },
      {
        "<leader>fr",
        function()
          Snacks.picker.recent({ filter = { cwd = true } })
        end,
        desc = "Recent (cwd)",
      },
      {
        "<leader>fF",
        LazyVim.pick("files"),
        desc = "Find Files (Root Dir)",
      },
      {
        "<leader>ff",
        LazyVim.pick("files", { root = false }),
        desc = "Find Files (cwd)",
      },
      {
        "<leader>fw",
        function()
          Snacks.picker.files({
            on_show = function(picker)
              picker.input.win.opts.actions.insert_cword.action()
            end,
          })
        end,
      },
    },
  },
}
