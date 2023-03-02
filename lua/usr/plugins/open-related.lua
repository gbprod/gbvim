return {
    {
        dir = "~/workspace/open-related.nvim",
        config = function()
            require("open-related").setup({
                open_with = "telescope",
                create_with = "telescope",
            })
            require("open-related").add_relation(require("open-related.builtin.nvim").alternate_spec)
            require("open-related").add_relation(require("open-related.builtin.php").alternate_test_file.with({
                opts = {
                    test_namespace_prefixes = { "Integration", "Unit" },
                },
            }))
            require("open-related").add_relation({
                filetypes = { "php" },
                related_to = require("open-related.helpers.filename").from_patterns({
                    { match = "^(.*)src/(.*)%.php$",        format = "%ssrc/%sHandler.php" },
                    { match = "^(.*)src/(.*)Handler%.php$", format = "%ssrc/%s.php" },
                }),
            })
        end,
    },
}
