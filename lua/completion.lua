local layer = {}

layer.plugins = function(use)
  use 'windwp/nvim-autopairs'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/vim-vsnip'
  use 'hrsh7th/vim-vsnip-integ'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
  use 'hrsh7th/cmp-vsnip'
end

layer.setup = function()
  vim.g.vsnip_snippet_dir = vim.g.root_dir .. '/snippets'

  local lspkind = require('lspkind')
  local cmp = require('cmp')
  cmp.setup {
    snippet = {
      expand = function(args)
        vim.fn['vsnip#anonymous'](args.body)
      end
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
    },

    sources = {
      { name = 'nvim_lsp' },
      { name = 'vsnip' },
      { name = 'buffer' },
      { name = 'path' },
      { name = 'nvim_lua' },
    },
    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = lspkind.presets.default[vim_item.kind]
        return vim_item
      end
    },
  }

  require('nvim-autopairs').setup{}

  require("nvim-autopairs.completion.cmp").setup({
    map_cr = true,
    map_complete = true,
  })

end

layer.bindings = function(map)
  map('i', '<C-j>' , 'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"', { expr = true })
  map('s', '<C-j>' , 'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"', { expr = true })
  map('i', '<C-l>' , 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>"', { expr = true })
  map('s', '<C-l>' , 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>"', { expr = true })
  map('i', '<c-j>' , 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<c-j>"', { expr = true })
  map('s', '<c-j>' , 'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<c-j>"', { expr = true })
  -- map('i', '<c-j>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"');
  -- map('s', '<S-Tab>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<S-Tab>"');
end
return layer

