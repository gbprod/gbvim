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
-- M.grep_word = {
--   finder = "grep",
--   regex = false,
--   format = "file",
--   search = function(picker)
--     return picker:word()
--   end,
--   live = false,
--   supports_live = true,
-- }M.files = {
--   finder = "files",
--   format = "file",
--   show_empty = true,
--   hidden = false,
--   ignored = false,
--   follow = false,
--   supports_live = true,
-- }
