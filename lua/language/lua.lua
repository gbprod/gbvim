return {
  plugins = function(use)
    use({ "nvim-treesitter/tree-sitter-lua", run = ":TSInstall lua" })
    use("folke/lua-dev.nvim")
  end,

  setup = function()
    local null_ls = require("null-ls")

    null_ls.register(null_ls.builtins.formatting.stylua.with({
      extra_args = { "--config-path", vim.fn.expand("~/.config/stylua.toml") },
    }))

    null_ls.register(null_ls.builtins.diagnostics.luacheck)

    local lsp_root_path = vim.fn.expand("~/workspace/lua-language-server/")
    local luadev = require("lua-dev").setup({
      lspconfig = {
        cmd = {
          lsp_root_path .. "bin/Linux/lua-language-server",
          "-E",
          lsp_root_path .. "main.lua",
        },
        on_attach = require("lsp").on_attach,
      },
    })
    local lspconfig = require("lspconfig")
    lspconfig.sumneko_lua.setup(luadev)
  end,
}
