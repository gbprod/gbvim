return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "ray-x/lsp_signature.nvim",
      {
        "dnlhc/glance.nvim",
        config = function()
          require("glance").setup(require("nord.plugins.glance").make_opts({
            folds = {
              folded = false,
            },
          }))
        end,
      },
      "nanotee/sqls.nvim",
    },
    config = function()
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = " ",
          },
        },
      })

      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "single",
      })

      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "single",
      })

      local signs = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " ",
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

      -- -- javascript
      lspconfig.ts_ls.setup({
        on_attach = utils.on_attach,
        capabilities = utils.make_capabilities(),
        settings = { documentFormatting = false },
      })
      lspconfig.eslint.setup({})

      -- json
      capabilities = utils.make_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      lspconfig.jsonls.setup({
        capabilities = capabilities,
        root_dir = require("lspconfig.util").root_pattern(".env", ".git"),
      })

      -- lua
      lspconfig.lua_ls.setup({
        on_attach = utils.on_attach,
        on_init = function(client)
          client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
            format = {
              enable = false,
            },
            runtime = {
              version = "LuaJIT",
            },
            workspace = {
              diagnostics = {
                globals = {
                  "it",
                  "vim",
                  "describe",
                  "before_each",
                },
              },
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
                "${3rd}/busted/library",
                "${3rd}/luv/library",
              },
            },
          })
        end,
      })

      lspconfig.bashls.setup({
        on_attach = utils.on_attach,
        capabilities = utils.make_capabilities(),
      })

      lspconfig.pyright.setup({
        on_attach = utils.on_attach,
        capabilities = utils.make_capabilities(),
      })

      -- psalm
      -- lspconfig.psalm.setup({
      --   cmd = {
      --     "psalm",
      --     "--language-server",
      --     "--show-diagnostic-warnings=false",
      --   },
      --   capabilities = utils.make_capabilities(),
      -- })

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
