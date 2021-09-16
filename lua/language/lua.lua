return {
  plugins = function(use)
    use({ "nvim-treesitter/tree-sitter-lua", run = ":TSInstall lua" })
  end,

  setup = function()
    require("null-ls").register(require("null-ls").builtins.formatting.stylua.with({
      extra_args = { "--config-path", vim.fn.expand("~/.config/stylua.toml") },
    }))
  end,
}
