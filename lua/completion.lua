return {
  plugins = function(use)
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
    use("ray-x/cmp-treesitter")
  end,

  setup = function()
    vim.g.vsnip_snippet_dir = vim.g.root_dir .. "/snippets"

    local lspkind = require("lspkind")
    local cmp = require("cmp")
    cmp.setup({
      completion = {
        keyword_pattern = [[\k]],
      },
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      mapping = {
        ["<C-n>"] = cmp.mapping.select_next_item({
          behavior = cmp.SelectBehavior.Insert,
        }),
        ["<C-p>"] = cmp.mapping.select_prev_item({
          behavior = cmp.SelectBehavior.Insert,
        }),
        ["<Down>"] = cmp.mapping(
          cmp.mapping.select_next_item(),
          { "i", "s", "c" }
        ),
        ["<Up>"] = cmp.mapping(
          cmp.mapping.select_prev_item(),
          { "i", "s", "c" }
        ),
        ["<C-g>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.close(),
        ["<Tab>"] = cmp.mapping(
          cmp.mapping.select_next_item(),
          { "i", "s", "c" }
        ),
        ["<S-Tab>"] = cmp.mapping(
          cmp.mapping.select_prev_item(),
          { "i", "s", "c" }
        ),
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
            keyword_pattern = [[\k]],
          },
        },
        { name = "treesitter" },
        { name = "path" },
        { name = "nvim_lua" },
      },
      formatting = {
        format = function(_, vim_item)
          vim_item.kind = lspkind.presets.default[vim_item.kind]
          return vim_item
        end,
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

    -- vim.cmd([[
    -- autocmd ColorScheme * highlight link CmpItemAbbr CmpItemAbbrMatch
    -- ]])
    require("nvim-autopairs").setup({
      check_ts = true,
    })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    cmp.event:on(
      "confirm_done",
      cmp_autopairs.on_confirm_done({ map_char = { tex = "" } })
    )
  end,

  bindings = function(map)
    map(
      "i",
      "<C-j>",
      'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"',
      { expr = true }
    )
    map(
      "s",
      "<C-j>",
      'vsnip#expandable() ? "<Plug>(vsnip-expand)" : "<C-j>"',
      { expr = true }
    )
    map(
      "i",
      "<C-l>",
      'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>"',
      { expr = true }
    )
    map(
      "s",
      "<C-l>",
      'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-l>"',
      { expr = true }
    )
    map(
      "i",
      "<c-j>",
      'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<c-j>"',
      { expr = true }
    )
    map(
      "s",
      "<c-j>",
      'vsnip#jumpable(1) ? "<Plug>(vsnip-jump-next)" : "<c-j>"',
      { expr = true }
    )
    map("n", "gZ", "<Plug>(vsnip-select-text)", {})
    map("x", "gZ", "<Plug>(vsnip-select-text)", {})
    map("n", "gz", "<Plug>(vsnip-cut-text)", {})
    map("x", "gz", "<Plug>(vsnip-cut-text)", {})
  end,
}
