return {
  plugins = function(use)
    use("neovim/nvim-lspconfig")
    use("ray-x/lsp_signature.nvim")
    use("onsails/lspkind-nvim")
    use("jose-elias-alvarez/null-ls.nvim")
  end,

  setup = function()
    require("null-ls").setup({
      update_on_insert = false,
      on_attach = function(client, bufnr)
        if client.resolved_capabilities.document_formatting then
          vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
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
        end
      end,
    })
  end,

  on_attach = function(_, bufnr)
    require("lsp_signature").on_attach({
      bind = false,
      hint_enable = false,
      padding = " ",
      handler_opts = {
        border = "none",
      },
      always_trigger = false,
      auto_close_after = 10,
      toggle_key = "<M-s>",
    })

    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
      vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    local opts = { noremap = true, silent = true }
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

    buf_set_keymap("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)
    buf_set_keymap("n", "<a-cr>", "<cmd>Telescope lsp_code_actions theme=dropdown<CR>", opts)
    buf_set_keymap("v", "<a-cr>", "<cmd>Telescope lsp_range_code_actions theme=dropdown<CR>", opts)
    buf_set_keymap("n", "<leader>ft", "<cmd>Telescope lsp_document_symbols<CR>", opts)

    buf_set_keymap("n", "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

    buf_set_keymap("n", "<leader>dN", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "<leader>dn", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<leader>ds", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "<space>cf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    buf_set_keymap(
      "n",
      "<space>cF",
      "<cmd>lua vim.b.should_format = vim.b.should_format ~= nil and not vim.b.should_format or false<CR>",
      opts
    )

    buf_set_keymap("n", "<M-s>", "<cmd>lua require('lsp_signature').toggle_float_win()<CR>", opts)
    --[[
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    ]]

    require("lspkind").init({
      with_text = true,
      preset = "default",
      symbol_map = {
        Text = "",
        Method = "",
        Function = "",
        Constructor = "",
        Field = "ﰠ",
        Variable = "",
        Class = "ﴯ",
        Interface = "",
        Module = "",
        Property = "ﰠ",
        Unit = "塞",
        Value = "",
        Enum = "",
        Keyword = "",
        Snippet = "",
        Color = "",
        File = "",
        Reference = "",
        Folder = "",
        EnumMember = "",
        Constant = "",
        Struct = "פּ",
        Event = "",
        Operator = "",
        TypeParameter = "",
      },
    })

    -- Gutter signs
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
  end,
}
