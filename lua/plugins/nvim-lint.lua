return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft.sh = {
        "shellcheck",
      }

      opts.linters_by_ft.php = {
        "php",
      }
    end,
  },
}
