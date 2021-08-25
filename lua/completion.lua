local layer = {}

layer.plugins = function(use)
  use 'windwp/nvim-autopairs'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'
end

layer.setup = function()
  require('nvim-autopairs').setup{}

  require("nvim-autopairs.completion.cmp").setup({
    map_cr = true,
    map_complete = true,
  })

  local lspkind = require('lspkind')
  local cmp = require('cmp')
  cmp.setup {
    -- snippet = {
      -- expand = function(args)
        -- You must install `vim-vsnip` if you use the following as-is.
        -- vim.fn['vsnip#anonymous'](args.body)
      -- end
    -- },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 's' }),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
    },

    -- You should specify your *installed* sources.
    sources = {
      { name = 'nvim_lsp' },
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

end

return layer

