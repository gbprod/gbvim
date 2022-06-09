local sql = {}

local util = require("lspconfig.util")

function sql.plugins(use)
  use("nanotee/sqls.nvim")
end

function sql.setup()
  local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

  parser_configs.sql = {
    install_info = {
      url = "https://github.com/m-novikov/tree-sitter-sql",
      files = { "src/parser.c" },
      branch = "main",
    },
  }

  require("lspconfig").sqls.setup({
    root_dir = util.root_pattern(".project.lua"),
    on_attach = function(client, bufnr)
      require("sqls").on_attach(client, bufnr)
    end,
    capabilities = require("lsp").make_capabilities(),
  })
end

function sql.on_ft()
  require("which-key").register({
    ["<leader>l"] = { name = "+Sql" },
    ["<leader>le"] = {
      "<cmd>SqlsExecuteQuery<CR>",
      "Execute query",
      buffer = 0,
    },
    ["<leader>lE"] = {
      "<cmd>SqlsExecuteQueryVertical<CR>",
      "Execute query vertical mode",
      buffer = 0,
    },
    ["<leader>ls"] = {
      "<cmd>SqlsSwitchConnection<CR>",
      "Switch connection",
      buffer = 0,
    },
  }, { mode = "n" })
end

return sql
