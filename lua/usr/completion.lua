local completion = {}

function completion.plugins(use)
  use("windwp/nvim-autopairs")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/vim-vsnip")
  use("hrsh7th/vim-vsnip-integ")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-nvim-lua")
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/cmp-cmdline")
  use("onsails/lspkind-nvim")
end

function completion.setup()
  vim.g.vsnip_snippet_dir = vim.g.root_dir .. "/snippets"

  local lspkind = require("lspkind")
  local cmp = require("cmp")
  cmp.setup({
    snippet = {
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    window = {
      documentation = cmp.config.window.bordered({
        winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      }),
    },
    mapping = {
      ["<C-n>"] = cmp.mapping.select_next_item({
        behavior = cmp.SelectBehavior.Insert,
      }),
      ["<C-p>"] = cmp.mapping.select_prev_item({
        behavior = cmp.SelectBehavior.Insert,
      }),
      ["<C-g>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "s", "c" }),
      ["<C-e>"] = cmp.mapping(cmp.mapping.close(), { "i", "s", "c" }),
      ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s", "c" }),
      ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s", "c" }),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },

    sources = {
      { name = "nvim_lsp" },
      { name = "vsnip" },
      {
        name = "buffer",
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end,
          keyword_pattern = [[\k\+]],
        },
      },
      { name = "path" },
      { name = "nvim_lua" },
    },
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = lspkind.cmp_format({
        mode = "symbol",
        maxwidth = 50,
      }),
    },
  })

  cmp.setup.cmdline("/", {
    sources = {
      { name = "buffer" },
    },
  })

  cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })

  require("nvim-autopairs").setup({
    check_ts = true,
  })

  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

function completion.bindings(map)
  vim.cmd([[
  imap <expr> <C-j> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-j>'
  smap <expr> <C-j> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<C-j>'
  ]])

  map("n", "gZ", "<Plug>(vsnip-select-text)", {})
  map("x", "gZ", "<Plug>(vsnip-select-text)", {})
  map("n", "gz", "<Plug>(vsnip-cut-text)", {})
  map("x", "gz", "<Plug>(vsnip-cut-text)", {})
end

return completion
