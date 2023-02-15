local lua = {}

function lua.plugins(use)
  use({ "nvim-treesitter/tree-sitter-query", run = ":TSInstall! query" })
  use("folke/neodev.nvim")
end

function lua.setup()
  local null_ls = require("null-ls")

  null_ls.register(null_ls.builtins.formatting.stylua.with({
    extra_args = {
      "--config-path",
      vim.fn.filereadable(vim.fn.getcwd() .. "/stylua.toml") == 1 and vim.fn.getcwd() .. "/stylua.toml"
        or vim.fn.expand("~/.config/stylua.toml"),
    },
    runtime_condition = function(_)
      return require("usr.lsp").should_format()
    end,
  }))

  null_ls.register(null_ls.builtins.diagnostics.luacheck)

  require("neodev").setup()
  require("lspconfig").lua_ls.setup({
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  })

  require("open-related").add_relation(require("open-related.builtin.nvim").alternate_spec)

  vim.cmd([[
  autocmd Filetype lua :iabbrev ret return
  autocmd Filetype lua :iabbrev lo local
  autocmd Filetype php :iabbrev fun function
  ]])
end

function lua.on_ft()
  vim.opt.textwidth = 80
  vim.opt.colorcolumn = { "+1", "+41" }
end

return lua
