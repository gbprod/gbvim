local lsp = {}

function lsp.plugins(use)
  use("neovim/nvim-lspconfig")
  use("ray-x/lsp_signature.nvim")
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
      vim.keymap.set("n", "<a-cr>", "<cmd>Telescope lsp_code_actions theme=dropdown<CR>", opts)
      vim.keymap.set("x", "<a-cr>", "<cmd>Telescope lsp_range_code_actions theme=dropdown<CR>", opts)
    end,
  })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
end

function lsp.on_attach(client, bufnr)
  require("lsp_signature").on_attach({
    bind = false,
    hint_enable = false,
    padding = " ",
    handler_opts = {
      border = "rounded",
    },
    always_trigger = false,
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

  vim.keymap.set("n", ")d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "(d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", ")D", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<space>cf", function()
    vim.lsp.buf.format({ buffer = bufnr })
  end, opts)
  vim.keymap.set("n", "<space>cF", lsp.toggle_should_format, opts)

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

  require("nvim-navic").attach(client, bufnr)
end

function lsp.make_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  return require("cmp_nvim_lsp").update_capabilities(capabilities)
end

function lsp.should_format()
  if vim.b.should_format ~= nil then
    return vim.b.should_format
  end

  if vim.g.should_format ~= nil then
    return vim.g.should_format
  end

  return true
end

function lsp.toggle_should_format()
  if vim.b.should_format == nil then
    if vim.g.should_format ~= nil then
      vim.b.should_format = vim.g.should_format
    else
      vim.b.should_format = true
    end
  end

  vim.b.should_format = not vim.b.should_format

  print(string.format("autoformat %s", vim.b.should_format and "on" or "off"))
end

return lsp
