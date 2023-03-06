local lsp = {}

function lsp.plugins(use)
  use("jose-elias-alvarez/null-ls.nvim")
end

function lsp.setup()
  local formatting_autogroup = vim.api.nvim_create_augroup("LspFormatting", {})

  require("null-ls").setup({
    -- debug = true,
    update_on_insert = false,
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = formatting_autogroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = formatting_autogroup,
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
          end,
        })
      end

      local opts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "<space>cf", function()
        vim.lsp.buf.format({ buffer = bufnr })
      end, opts)
      vim.keymap.set("n", "<space>cF", lsp.toggle_should_format, opts)
      vim.keymap.set({ "v", "n" }, "<a-cr>", vim.lsp.buf.code_action, opts)
    end,
  })
end

return lsp
