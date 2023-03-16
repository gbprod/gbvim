return {
  {
    dir = "~/workspace/open-related.nvim",
    config = function()
      local open = require("open-related")

      open.setup({
        open_with = "telescope",
        create_with = "telescope",
      })
      open.add_relation(require("open-related.builtin.nvim").alternate_spec)
      open.add_relation(require("open-related.builtin.php").alternate_test_file.with({
        opts = {
          test_namespace_prefixes = { "Integration", "Unit" },
        },
      }))
      open.add_relation({
        filetypes = { "php" },
        related_to = require("open-related.helpers.filename").from_patterns({
          { match = "^(.*)src/(.*)%.php$", format = "%ssrc/%sHandler.php" },
          { match = "^(.*)src/(.*)Handler%.php$", format = "%ssrc/%s.php" },
        }),
      })
      open.add_relation(require("open-related.builtin.nvim").alternate_spec)

      vim.keymap.set("n", "<leader>fr", "<cmd>Telescope open_related<cr>", { desc = "Open Related" })
      vim.keymap.set("n", "<leader>fc", "<cmd>Telescope create_related<cr>", { desc = "Create Related" })
    end,
  },
}
