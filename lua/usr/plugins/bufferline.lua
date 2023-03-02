return {
    {
        "romgrk/barbar.nvim",
        config = function()
            require("bufferline").setup({
                exclude_ft = { "qf" },
                exclude_name = {},
                icons = "both",
                icon_separator_active = "▎",
                icon_separator_inactive = "▎ ",
                letters = "qsdfjklghnmxcvbziowerutyqpQSDFJKLGHNMXCVBZIOWERUTYQP",
                maximum_padding = 2,
                diagnostics = {
                    [vim.diagnostic.severity.ERROR] = { enabled = true, icon = " " },
                    [vim.diagnostic.severity.WARN] = { enabled = true, icon = " " },
                    [vim.diagnostic.severity.INFO] = { enabled = true, icon = " " },
                    [vim.diagnostic.severity.HINT] = { enabled = true, icon = " " },
                },
            })

            -- TODO
            -- vim.api.nvim_create_autocmd("BufWinEnter", {
            --     pattern = "*",
            --     callback = function()
            --         if vim.bo.filetype == "NvimTree" then
            --             require("bufferline.api").set_offset(41, "FileTree")
            --         end
            --     end,
            -- })
            --
            -- vim.api.nvim_create_autocmd("BufWinLeave", {
            --     pattern = "*",
            --     callback = function()
            --         if vim.fn.expand("<afile>"):match("NvimTree") then
            --             require("bufferline.api").set_offset(0)
            --         end
            --     end,
            -- })

            vim.keymap.set("n", "<leader>bd", "<cmd>confirm BufferClose<cr>", { desc = "Close current" })
            vim.keymap.set("n", "<leader>bp", "<cmd>BufferPin<cr>", { desc = "Pin buffer" })
            vim.keymap.set("n", "<leader>bod", "<cmd>BufferOrderByDirectory<CR>", { desc = "Sort by directory" })
            vim.keymap.set("n", "<leader>boe", "<cmd>BufferOrderByLanguage<CR>", { desc = "Sort by language" })

            vim.keymap.set("n", "<leader>bca", "<cmd>bufdo :confirm BufferClose<cr>", { desc = "Close all" })
            vim.keymap.set("n", "<leader>bcp", "<cmd>BufferCloseAllButPinned<cr>", { desc = "Close all but pinned" })
            vim.keymap.set("n", "<leader>bcc", "<cmd>BufferCloseAllButCurrent<cr>", { desc = "Close all but current" })
            vim.keymap.set("n", "<leader>bcl", "<cmd>BufferCloseBuffersLeft<cr>", { desc = "Close buffers left" })
            vim.keymap.set("n", "<leader>bcr", "<cmd>BufferCloseBuffersRight<cr>", { desc = "Close buffers right" })

            vim.keymap.set("n", "<A-Left>", ":BufferPrevious<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<A-Right>", ":BufferNext<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<A-j>", ":BufferPrevious<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<A-k>", ":BufferNext<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<A-<>", ":BufferMovePrevious<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<A->>", " :BufferMoveNext<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<A-q>", ":confirm BufferClose<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "gh", ":BufferPick<CR>", { noremap = true, silent = true })

            vim.keymap.set("n", "<leader>&", "<cmd>BufferGoto 1<cr>", { desc = "which_key_ignore" })
            vim.keymap.set("n", "<leader>é", "<cmd>BufferGoto 2<cr>", { desc = "which_key_ignore" })
            vim.keymap.set("n", '<leader>"', "<cmd>BufferGoto 3<cr>", { desc = "which_key_ignore" })
            vim.keymap.set("n", "<leader>'", "<cmd>BufferGoto 4<cr>", { desc = "which_key_ignore" })
            vim.keymap.set("n", "<leader>(", "<cmd>BufferGoto 5<cr>", { desc = "which_key_ignore" })
            vim.keymap.set("n", "<leader>-", "<cmd>BufferGoto 6<cr>", { desc = "which_key_ignore" })
            vim.keymap.set("n", "<leader>è", "<cmd>BufferGoto 7<cr>", { desc = "which_key_ignore" })
            vim.keymap.set("n", "<leader>_", "<cmd>BufferGoto 8<cr>", { desc = "which_key_ignore" })
            vim.keymap.set("n", "<leader>ç", "<cmd>BufferGoto 9<cr>", { desc = "which_key_ignore" })
        end,
    },
}
