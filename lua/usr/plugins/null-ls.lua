return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local formatting_autogroup = vim.api.nvim_create_augroup("LspFormatting", {})

      local null_ls = require("null-ls")

      null_ls.setup({
        debug = true,
        update_on_insert = false,
        sources = {},
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = formatting_autogroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = formatting_autogroup,
              buffer = bufnr,
              callback = function()
                if require("usr.lsp-utils").should_format() then
                  vim.lsp.buf.format({ async = false, timeout_ms = 3000 })
                end
              end,
            })
          end

          vim.keymap.set("n", "<space>cf", function()
            vim.lsp.buf.format({ async = false, timeout_ms = 3000 })
          end, { noremap = true, silent = true, buffer = bufnr })
          vim.keymap.set(
            "n",
            "<space>cF",
            require("usr.lsp-utils").toggle_should_format,
            { noremap = true, silent = true, buffer = bufnr }
          )
          vim.keymap.set(
            { "v", "n" },
            "<a-cr>",
            vim.lsp.buf.code_action,
            { noremap = true, silent = true, buffer = bufnr }
          )
        end,
      })

      null_ls.register(null_ls.builtins.formatting.clang_format)

      null_ls.register(null_ls.builtins.formatting.prettier.with({
        args = {
          "--config",
          vim.fn.filereadable(vim.fn.getcwd() .. "/.prettierrc") == 1 and vim.fn.getcwd() .. "/.prettierrc"
          or vim.fn.expand("~/.config/prettier/.prettierrc"),
          "--stdin-filepath",
          "$FILENAME",
        },
        runtime_condition = function(_)
          return require("usr.lsp-utils").should_format()
        end,
      }))

      null_ls.register(null_ls.builtins.formatting.stylua.with({
        extra_args = {
          "--config-path",
          vim.fn.filereadable(vim.fn.getcwd() .. "/stylua.toml") == 1 and vim.fn.getcwd() .. "/stylua.toml"
          or vim.fn.expand("~/.config/stylua.toml"),
        },
        runtime_condition = function(_)
          return require("usr.lsp-utils").should_format()
        end,
      }))

      null_ls.register(require("none-ls-luacheck.diagnostics.luacheck"))

      -- php
      null_ls.register(null_ls.builtins.formatting.phpcsfixer.with({
        env = {
          PHP_CS_FIXER_IGNORE_ENV = true,
        },
        args = {
          "--no-interaction",
          "--quiet",
          "--config=/home/gbprod/.dotfiles/config/phpcs/.php-cs-fixer.php",
          "fix",
          "$FILENAME",
        },
        runtime_condition = function(_)
          return require("usr.lsp-utils").should_format()
        end,
        condition = function(utils)
          return utils.root_has_file(".php-cs-fixer.php") or utils.root_has_file(".php-cs-fixer.dist.php")
        end,
      }))

      null_ls.register(require("none-ls-shellcheck.diagnostics"))
      null_ls.register(require("none-ls-shellcheck.code_actions"))

      null_ls.register(require("none-ls-php.diagnostics.php"))
      -- null_ls.register(require("none-ls-psalm.diagnostics").with({
      --   condition = function(utils)
      --     return utils.root_has_file("psalm.xml")
      --   end,
      --   method = require("null-ls.methods").internal.DIAGNOSTICS_ON_SAVE,
      -- }))
      null_ls.register(require("none-ls-ecs.formatting").with({
        command = "vendor/bin/ecs",
        runtime_condition = function(_)
          return require("usr.lsp-utils").should_format()
        end,
        condition = function(utils)
          return utils.root_has_file("ecs.php")
        end,
      }))
    end,
    dependencies = {
      { dir = "~/workspace/none-ls-ecs.nvim" },
      { dir = "~/workspace/none-ls-php.nvim" },
      { dir = "~/workspace/none-ls-luacheck.nvim" },
      { dir = "~/workspace/none-ls-shellcheck.nvim" },
      { dir = "~/workspace/none-ls-psalm.nvim" },
    },
  },
}
