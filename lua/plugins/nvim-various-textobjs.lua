return {
  {
    "kana/vim-textobj-user",
    priority = 1000,
  },
  {
    "glts/vim-textobj-comment",
    keys = {
      {
        "ax",
        mode = { "o", "x" },
        "<Plug>(textobj-comment-a)",
        desc = "comment",
      },
      {
        "ix",
        mode = { "o", "x" },
        "<Plug>(textobj-comment-i)",
        desc = "comment",
      },
    },
  },
  {
    "chrisgrieser/nvim-various-textobjs",
    event = "VeryLazy",
    opts = {
      keymaps = {
        useDefaults = false,
      },
    },
    keys = {
      {
        "gi",
        mode = { "o", "x" },
        function()
          require("various-textobjs").restOfIndentation()
        end,
        desc = "rest of indentation",
      },
      {
        "C",
        mode = { "o", "x" },
        function()
          require("various-textobjs").toNextClosingBracket()
        end,
        desc = "to next closing bracket",
      },
      {
        "Q",
        mode = { "o", "x" },
        function()
          require("various-textobjs").toNextClosingBracket()
        end,
        desc = "to next closing bracket",
      },
      {
        "gr",
        mode = { "o", "x" },
        function()
          require("various-textobjs").restOfParagraph()
        end,
        desc = "rest of paragraph",
      },
      {
        "e",
        mode = { "o", "x" },
        function()
          require("various-textobjs").nearEol()
        end,
        desc = "near end of line",
      },
      {
        "a_",
        mode = { "o", "x" },
        function()
          require("various-textobjs").lineCharacterwise("outer")
        end,
        desc = "line characterwise",
      },
      {
        "i_",
        mode = { "o", "x" },
        function()
          require("various-textobjs").lineCharacterwise("inner")
        end,
        desc = "line characterwise",
      },
      {
        "ak",
        mode = { "o", "x" },
        function()
          require("various-textobjs").key("outer")
        end,
        desc = "key",
      },
      {
        "ik",
        mode = { "o", "x" },
        function()
          require("various-textobjs").key("inner")
        end,
        desc = "key",
      },
      {
        "av",
        mode = { "o", "x" },
        function()
          require("various-textobjs").value("outer")
        end,
        desc = "value",
      },
      {
        "iv",
        mode = { "o", "x" },
        function()
          require("various-textobjs").value("inner")
        end,
        desc = "value",
      },
      {
        "L",
        mode = { "o", "x" },
        function()
          require("various-textobjs").url()
        end,
        desc = "url",
      },
      {
        "!",
        mode = { "o", "x" },
        function()
          require("various-textobjs").diagnostic()
        end,
        desc = "diagnostic",
      },
      {
        "g;",
        mode = { "o", "x" },
        function()
          require("various-textobjs").lastChange()
        end,
        desc = "last change",
      },
    },
  },
}
