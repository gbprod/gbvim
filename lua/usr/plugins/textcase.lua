return {
  {
    "johmsalas/text-case.nvim",
    config = function()
      vim.keymap.set("n", "cru", function()
        require("textcase").current_word("to_upper_case")
      end, { noremap = true, desc = "To upper case" })
      vim.keymap.set("n", "crl", function()
        require("textcase").current_word("to_lower_case")
      end, { noremap = true, desc = "To lower case" })
      vim.keymap.set("n", "crs", function()
        require("textcase").current_word("to_snake_case")
      end, { noremap = true, desc = "To snake case" })
      vim.keymap.set("n", "crk", function()
        require("textcase").current_word("to_dash_case")
      end, { noremap = true, desc = "To dash case" })
      vim.keymap.set("n", "crn", function()
        require("textcase").current_word("to_constant_case")
      end, { noremap = true, desc = "To constant case" })
      vim.keymap.set("n", "crd", function()
        require("textcase").current_word("to_dot_case")
      end, { noremap = true, desc = "To dot case" })
      vim.keymap.set("n", "cra", function()
        require("textcase").current_word("to_phrase_case")
      end, { noremap = true, desc = "To phrase case" })
      vim.keymap.set("n", "crc", function()
        require("textcase").current_word("to_camel_case")
      end, { noremap = true, desc = "To camel case" })
      vim.keymap.set("n", "crp", function()
        require("textcase").current_word("to_pascal_case")
      end, { noremap = true, desc = "To pascal case" })
      vim.keymap.set("n", "crt", function()
        require("textcase").current_word("to_title_case")
      end, { noremap = true, desc = "To title case" })
      vim.keymap.set("n", "crf", function()
        require("textcase").current_word("to_path_case")
      end, { noremap = true, desc = "To path case" })

      vim.keymap.set("n", "cRu", function()
        require("textcase").operator("to_upper_case")
      end, { noremap = true, desc = "To upper case" })
      vim.keymap.set("n", "cRl", function()
        require("textcase").operator("to_lower_case")
      end, { noremap = true, desc = "To lower case" })
      vim.keymap.set("n", "cRs", function()
        require("textcase").operator("to_snake_case")
      end, { noremap = true, desc = "To snake case" })
      vim.keymap.set("n", "cRd", function()
        require("textcase").operator("to_dash_case")
      end, { noremap = true, desc = "To dash case" })
      vim.keymap.set("n", "cRn", function()
        require("textcase").operator("to_constant_case")
      end, { noremap = true, desc = "To constant case" })
      vim.keymap.set("n", "cRd", function()
        require("textcase").operator("to_dot_case")
      end, { noremap = true, desc = "To dot case" })
      vim.keymap.set("n", "cRa", function()
        require("textcase").operator("to_phrase_case")
      end, { noremap = true, desc = "To phrase case" })
      vim.keymap.set("n", "cRc", function()
        require("textcase").operator("to_camel_case")
      end, { noremap = true, desc = "To camel case" })
      vim.keymap.set("n", "cRp", function()
        require("textcase").operator("to_pascal_case")
      end, { noremap = true, desc = "To pascal case" })
      vim.keymap.set("n", "cRt", function()
        require("textcase").operator("to_title_case")
      end, { noremap = true, desc = "To title case" })
      vim.keymap.set("n", "cRf", function()
        require("textcase").operator("to_path_case")
      end, { noremap = true, desc = "To path case" })

      require("telescope").load_extension("textcase")
    end,
  },
}
