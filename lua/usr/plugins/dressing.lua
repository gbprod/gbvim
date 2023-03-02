return {
    {
        "stevearc/dressing.nvim",
        opts = {
            input = {
                enabled = true,
                anchor = "SW",
                border = "single",
                relative = "win",
                win_options = {
                    winblend = 0,
                },
                override = function(opt)
                    if vim.api.nvim_buf_get_option(0, "filetype") == "NvimTree" then
                        opt.anchor = "SW"
                        opt.col = 1
                        opt.row = vim.o.lines - vim.o.cmdheight - 1
                        opt.relative = "editor"
                    end
                end,
            },
            select = {
                enabled = true,
                backend = { "telescope", "builtin" },
                telescope = require("telescope.themes").get_dropdown(),
            },
        },
    },
}
