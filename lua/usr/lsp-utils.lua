local M = {}

function M.on_attach(client, bufnr)
  require("lsp_signature").on_attach({
    bind = false,
    hint_enable = false,
    padding = " ",
    handler_opts = {
      border = "single",
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
  vim.keymap.set({ "v", "n" }, "<a-cr>", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>ft", "<cmd>Telescope lsp_document_symbols<CR>", opts)

  vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)

  vim.keymap.set("n", ")d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "(d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", ")D", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "<leader>ds", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<space>cf", function()
    vim.lsp.buf.format({ buffer = bufnr })
  end, opts)
  vim.keymap.set("n", "<space>cF", M.toggle_should_format, opts)

  vim.keymap.set("n", "<M-s>", require("lsp_signature").toggle_float_win, opts)
end

function M.make_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  return require("cmp_nvim_lsp").default_capabilities(capabilities)
end

function M.should_format()
  if vim.b.should_format ~= nil then
    return vim.b.should_format
  end

  if vim.g.should_format ~= nil then
    return vim.g.should_format
  end

  return true
end

function M.toggle_should_format()
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

return M
