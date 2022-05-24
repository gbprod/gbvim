local lsp = {}

function lsp.plugins(use)
  use("neovim/nvim-lspconfig")
  use("ray-x/lsp_signature.nvim")
  use("jose-elias-alvarez/null-ls.nvim")
end

function lsp.setup()
  require("null-ls").setup({
    -- debug = true,
    update_on_insert = false,
    on_attach = function(client, bufnr)
      if client.resolved_capabilities.document_formatting then
        vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
          ]])

        local opts = { noremap = true, silent = true }
        local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        buf_set_keymap("n", "<space>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
        buf_set_keymap(
          "n",
          "<space>cF",
          "<cmd>lua vim.b.should_format = vim.b.should_format ~= nil and not vim.b.should_format or false<CR>",
          opts
        )
        buf_set_keymap("n", "<a-cr>", "<cmd>Telescope lsp_code_actions theme=dropdown<CR>", opts)
        buf_set_keymap("x", "<a-cr>", "<cmd>Telescope lsp_range_code_actions theme=dropdown<CR>", opts)
      end
    end,
  })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "single",
  })
end

function lsp.on_attach(_, bufnr)
  require("lsp_signature").on_attach({
    bind = false,
    hint_enable = false,
    padding = " ",

    handler_opts = {
      border = "rounded",
    },
    always_trigger = false,
    -- auto_close_after = 10,
    toggle_key = "<M-s>",
    hi_parameter = "Search",
  })

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

  vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
  vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
  vim.keymap.set("n", "<a-cr>", vim.lsp.buf.code_action, opts)
  vim.keymap.set("x", "<a-cr>", ":'<,'>lua vim.lsp.buf.range_code_action()<CR>", opts)
  vim.keymap.set("n", "<leader>ft", "<cmd>Telescope lsp_document_symbols<CR>", opts)

  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)

  vim.keymap.set("n", "<leader>dN", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>dn", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<space>cf", vim.lsp.buf.formatting, opts)
  vim.keymap.set(
    "n",
    "<space>cF",
    "<cmd>lua vim.b.should_format = vim.b.should_format ~= nil and not vim.b.should_format or false<CR>",
    opts
  )

  vim.keymap.set("n", "<M-s>", require("lsp_signature").toggle_float_win, opts)

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
end

return lsp
