return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "ray-x/lsp_signature.nvim",
      "nanotee/sqls.nvim",
    },
    config = function()
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "single",
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "single",
      })

      local signs = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " ",
      }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      local lspconfig = require("lspconfig")
      local utils = require("usr.lsp-utils")

      -- css
      local capabilities = utils.make_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      lspconfig.cssls.setup({
        capabilities = capabilities,
        init_options = {
          provideFormatter = false,
        },
      })

      -- html
      capabilities = utils.make_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      lspconfig.html.setup({
        capabilities = capabilities,
        on_attach = utils.on_attach,
        filetypes = { "html", "twig" },
        init_options = {
          provideFormatter = false,
        },
      })

      -- javascript
      lspconfig.tsserver.setup({
        on_attach = utils.on_attach,
        capabilities = utils.make_capabilities(),
      })
      lspconfig.eslint.setup({})

      -- json
      capabilities = utils.make_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      lspconfig.jsonls.setup({
        capabilities = capabilities,
      })

      -- lua
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            format = {
              enable = false,
            },
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

      -- python
      lspconfig.pyright.setup({
        on_attach = utils.on_attach,
        capabilities = utils.make_capabilities(),
      })

      lspconfig.bashls.setup({
        on_attach = utils.on_attach,
        capabilities = utils.make_capabilities(),
      })

      -- lspconfig.sqls.setup({
      --   root_dir = require("lspconfig.util").root_pattern(".project.lua"),
      --   on_attach = function(client, bufnr)
      --     require("sqls").on_attach(client, bufnr)
      --   end,
      --   capabilities = utils.make_capabilities(),
      -- })
    end,
  },
}
