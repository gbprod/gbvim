return {
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local formatting_autogroup = vim.api.nvim_create_augroup("LspFormatting", {})

      local null_ls = require("null-ls")
      null_ls.setup({
        debug = true,
        update_on_insert = false,
        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = formatting_autogroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = formatting_autogroup,
              buffer = bufnr,
              callback = function()
                if require("usr.lsp-utils").should_format() then
                  vim.lsp.buf.format({ bufnr = bufnr })
                end
              end,
            })
          end

          local opts = { noremap = true, silent = true, buffer = bufnr }
          vim.keymap.set("n", "<space>cf", function()
            vim.lsp.buf.format({ buffer = bufnr })
          end, opts)
          vim.keymap.set("n", "<space>cF", require("usr.lsp-utils").toggle_should_format, opts)
          vim.keymap.set({ "v", "n" }, "<a-cr>", vim.lsp.buf.code_action, opts)
        end,
      })

      -- null_ls.register(null_ls.builtins.formatting.clang_format)

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
          "--config=/home/gilles/.config/phpcs/.php-cs-fixer.php",
          "fix",
          "$FILENAME",
        },
        runtime_condition = function(_)
          return require("usr.lsp-utils").should_format()
        end,
      }))

      -- python
      null_ls.register(null_ls.builtins.formatting.black.with({
        runtime_condition = function(_)
          return require("usr.lsp-utils").should_format()
        end,
      }))

      null_ls.register(require("none-ls-shellcheck.diagnostics"))
      null_ls.register(require("none-ls-shellcheck.code_actions"))
      -- null_ls.register(null_ls.builtins.formatting.shfmt)
      null_ls.register(require("none-ls-php.diagnostics.php"))
      -- null_ls.register(require("none-ls-psalm.diagnostics"))
    end,
    dependencies = {
      { dir = "~/workspace/none-ls-php.nvim" },
      { dir = "~/workspace/none-ls-luacheck.nvim" },
      { dir = "~/workspace/none-ls-shellcheck.nvim" },
      { dir = "~/workspace/none-ls-psalm.nvim" },
    },
  },
}
