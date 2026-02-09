return {
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft.php = {
        "easy-coding-standard",
        "php_cs_fixer",
        stop_after_first = true,
      }

      opts.formatters_by_ft.c = {
        "clang-format",
      }

      opts.formatters_by_ft.cpp = {
        "clang-format",
      }

      opts.formatters_by_ft.javascript = {
        "prettier",
      }

      opts.formatters_by_ft.yaml = {
        "prettier",
      }

      opts.formatters.prettier = function()
        if vim.fn.filereadable(vim.fn.getcwd() .. "/.prettierrc") ~= 1 then
          return {
            "--config",
            vim.fn.expand("~/.config/prettier/.prettierrc"),
          }
        end

        return {}
      end

      opts.formatters.php_cs_fixer = {
        env = {
          PHP_CS_FIXER_IGNORE_ENV = "1",
        },
      }

      return opts
    end,
  },
}
