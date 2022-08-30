local sql = {}

local util = require("lspconfig.util")

function sql.plugins(use)
  use("nanotee/sqls.nvim")
  use({ "derekstride/tree-sitter-sql", run = ":TSInstall sql" })
end

function sql.setup()
  require("lspconfig").sqls.setup({
    root_dir = util.root_pattern(".project.lua"),
    on_attach = function(client, bufnr)
      require("sqls").on_attach(client, bufnr)
    end,
    capabilities = require("usr.lsp").make_capabilities(),
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
