return {
    {
        "johmsalas/text-case.nvim",
        config = function()
            vim.keymap.set("n", "gau", function()
                require("textcase").current_word("to_upper_case")
            end, { noremap = true, desc = "To upper case" })
            vim.keymap.set("n", "gal", function()
                require("textcase").current_word("to_lower_case")
            end, { noremap = true, desc = "To lower case" })
            vim.keymap.set("n", "gas", function()
                require("textcase").current_word("to_snake_case")
            end, { noremap = true, desc = "To snake case" })
            vim.keymap.set("n", "gad", function()
                require("textcase").current_word("to_dash_case")
            end, { noremap = true, desc = "To dash case" })
            vim.keymap.set("n", "gan", function()
                require("textcase").current_word("to_constant_case")
            end, { noremap = true, desc = "To constant case" })
            vim.keymap.set("n", "gad", function()
                require("textcase").current_word("to_dot_case")
            end, { noremap = true, desc = "To dot case" })
            vim.keymap.set("n", "gaa", function()
                require("textcase").current_word("to_phrase_case")
            end, { noremap = true, desc = "To phrase case" })
            vim.keymap.set("n", "gac", function()
                require("textcase").current_word("to_camel_case")
            end, { noremap = true, desc = "To camel case" })
            vim.keymap.set("n", "gap", function()
                require("textcase").current_word("to_pascal_case")
            end, { noremap = true, desc = "To pascal case" })
            vim.keymap.set("n", "gat", function()
                require("textcase").current_word("to_title_case")
            end, { noremap = true, desc = "To title case" })
            vim.keymap.set("n", "gaf", function()
                require("textcase").current_word("to_path_case")
            end, { noremap = true, desc = "To path case" })

            vim.keymap.set("n", "geu", function()
                require("textcase").operator("to_upper_case")
            end, { noremap = true, desc = "To upper case" })
            vim.keymap.set("n", "gel", function()
                require("textcase").operator("to_lower_case")
            end, { noremap = true, desc = "To lower case" })
            vim.keymap.set("n", "ges", function()
                require("textcase").operator("to_snake_case")
            end, { noremap = true, desc = "To snake case" })
            vim.keymap.set("n", "ged", function()
                require("textcase").operator("to_dash_case")
            end, { noremap = true, desc = "To dash case" })
            vim.keymap.set("n", "gen", function()
                require("textcase").operator("to_constant_case")
            end, { noremap = true, desc = "To constant case" })
            vim.keymap.set("n", "ged", function()
                require("textcase").operator("to_dot_case")
            end, { noremap = true, desc = "To dot case" })
            vim.keymap.set("n", "gea", function()
                require("textcase").operator("to_phrase_case")
            end, { noremap = true, desc = "To phrase case" })
            vim.keymap.set("n", "gec", function()
                require("textcase").operator("to_camel_case")
            end, { noremap = true, desc = "To camel case" })
            vim.keymap.set("n", "gep", function()
                require("textcase").operator("to_pascal_case")
            end, { noremap = true, desc = "To pascal case" })
            vim.keymap.set("n", "get", function()
                require("textcase").operator("to_title_case")
            end, { noremap = true, desc = "To title case" })
            vim.keymap.set("n", "gef", function()
                require("textcase").operator("to_path_case")
            end, { noremap = true, desc = "To path case" })

            require("telescope").load_extension("textcase")
        end,
    },
}
