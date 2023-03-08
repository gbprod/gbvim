return {
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                signs = {
                    error = "",
                    warning = "",
                    hint = "",
                    information = "",
                    other = "﫠",
                },
            })
            require("which-key").register({
                ["<leader>d"] = {
                    name = "+Diagnostics",
                },
            })
            vim.keymap.set(
                "n",
                "<leader>dw",
                "<cmd>TroubleToggle workspace_diagnostics<cr>",
                { silent = true, noremap = true }
            )
            vim.keymap.set(
                "n",
                "<leader>dd",
                "<cmd>TroubleToggle document_diagnostics<cr>",
                { silent = true, noremap = true }
            )
            vim.keymap.set("n", "<leader>dl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
            vim.keymap.set("n", "<leader>dq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
        end,
    },
}
