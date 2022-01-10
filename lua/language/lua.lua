local lua = {}

function lua.plugins(use)
  use({ "nvim-treesitter/tree-sitter-lua", run = ":TSInstall lua" })
  use({ "vigoux/tree-sitter-viml", run = ":TSInstall vim" })
  use("folke/lua-dev.nvim")
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
      return vim.b.should_format == nil or vim.b.should_format == true
    end,
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

  require("open-related").add_relation(require("open-related.builtin.nvim").alternate_spec)
end

function lua.on_ft()
  vim.opt.textwidth = 80
  vim.opt.colorcolumn = { "+1", "+41" }
end

return lua
