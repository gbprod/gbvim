return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
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
      opts.textobjects = {
        move = {
          enable = true,
          goto_next_start = { [")f"] = "@function.outer", [")c"] = "@class.outer", [")a"] = "@parameter.inner" },
          goto_next_end = { [")F"] = "@function.outer", [")C"] = "@class.outer", [")A"] = "@parameter.inner" },
          goto_previous_start = { ["(f"] = "@function.outer", ["(c"] = "@class.outer", ["(a"] = "@parameter.inner" },
          goto_previous_end = { ["(F"] = "@function.outer", ["(C"] = "@class.outer", ["(A"] = "@parameter.inner" },
        },
      }

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
      parser_config.twig = {
        install_info = {
          url = "~/workspace/tree-sitter-twig",
          files = { "src/parser.c" },
          branch = "main",
        },
      }
    end,
  },
}
