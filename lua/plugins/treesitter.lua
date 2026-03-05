return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local parser_config = require("nvim-treesitter.parsers")

      parser_config.gitcommit = {
        install_info = {
          url = "~/workspace/tree-sitter-gitcommit",
          files = { "src/parser.c" },
        },
      }

      vim.list_extend(opts.ensure_installed, {
        "sql",
        "make",
        "php",
        "twig",
        "css",
        "cpp",
        "scheme",
        "scss",
        "phpdoc",
        "printf",
        "fish",
      })

      return opts
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    opts = {},
    keys = function()
      local moves = {
        goto_next_start = { [")f"] = "@function.outer", [")c"] = "@class.outer", [")a"] = "@parameter.inner" },
        goto_next_end = { [")F"] = "@function.outer", [")C"] = "@class.outer", [")A"] = "@parameter.inner" },
        goto_previous_start = { ["(f"] = "@function.outer", ["(c"] = "@class.outer", ["(a"] = "@parameter.inner" },
        goto_previous_end = { ["(F"] = "@function.outer", ["(C"] = "@class.outer", ["(A"] = "@parameter.inner" },
      }
      local ret = {} ---@type LazyKeysSpec[]
      for method, keymaps in pairs(moves) do
        for key, query in pairs(keymaps) do
          local desc = query:gsub("@", ""):gsub("%..*", "")
          desc = desc:sub(1, 1):upper() .. desc:sub(2)
          desc = (key:sub(1, 1) == "[" and "Prev " or "Next ") .. desc
          desc = desc .. (key:sub(2, 2) == key:sub(2, 2):upper() and " End" or " Start")
          ret[#ret + 1] = {
            key,
            function()
              -- don't use treesitter if in diff mode and the key is one of the c/C keys
              if vim.wo.diff and key:find("[cC]") then
                return vim.cmd("normal! " .. key)
              end
              require("nvim-treesitter-textobjects.move")[method](query, "textobjects")
            end,
            desc = desc,
            mode = { "n", "x", "o" },
            silent = true,
          }
        end
      end
      return ret
    end,
  },
}
