return {
  plugins = function(use)
    use "neovim/nvim-lspconfig"
    use "ray-x/lsp_signature.nvim"
    use "onsails/lspkind-nvim"
    use "jose-elias-alvarez/null-ls.nvim"
  end,

  setup = function()
    require("null-ls").config({
      debug = true,
    })
    require("lspconfig")["null-ls"].setup({
      on_attach = function(client, bufnr)
        if client.resolved_capabilities.document_formatting then
          vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
        end
      end
    })
  end,

  on_attach = function(client, bufnr)
    require "lsp_signature".on_attach({
      bind = true,
      hint_enable = false,
      padding = ' ',
      handler_opts = {
        border = "none"
      }
    })

    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

    buf_set_keymap('n', 'gr', '<cmd>Telescope lsp_references<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>Telescope lsp_implementations<CR>', opts)
    buf_set_keymap('n', '<a-cr>', '<cmd>Telescope lsp_code_actions theme=get_cursor<CR>', opts)
    buf_set_keymap('v', '<a-cr>', '<cmd>Telescope lsp_range_code_actions theme=get_cursor<CR>', opts)
    buf_set_keymap('n', '<leader>ft', '<cmd>Telescope lsp_document_symbols<CR>', opts)

    buf_set_keymap('n', '<leader>cr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

    buf_set_keymap('n', '<leader>dN', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<leader>dn', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<leader>ds', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)

    --[[
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    ]]

    require('lspkind').init({
      with_text = true,
      preset = 'default',
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
        TypeParameter = ""
      },
    })

    -- Gutter signs
    local signs = { Error = " ", Warning = " ", Hint = " ", Information = " " }
    for type, icon in pairs(signs) do
      local hl = "LspDiagnosticsSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end
  end,
}

