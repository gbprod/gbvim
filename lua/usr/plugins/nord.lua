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
                colorblind = {
                    enable = false,
                    preserve_background = true,
                    severity = {
                        protan = 0,
                        deutan = 1,
                        tritan = 1,
                    },
                },
                styles = {
                    comments = { italic = false },
                    keywords = {},
                    functions = {},
                    variables = {},
                    errors = {},
                    bufferline = {
                        current = { bold = false },
                        modified = { bold = false, italic = true },
                    },
                },
            })
            vim.cmd("colorscheme nord")
        end,
    },
}
