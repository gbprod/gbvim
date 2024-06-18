return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "onsails/lspkind-nvim",
      "dcampos/cmp-snippy",
      "dcampos/nvim-snippy",
    },
    config = function()
      local lspkind = require("lspkind")
      local cmp = require("cmp")
      local types = require("cmp.types")
      cmp.setup({
        snippet = {
          expand = function(args)
            require("snippy").expand_snippet(args.body)
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
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<Tab>"] = cmp.mapping.select_next_item({
            behavior = types.cmp.SelectBehavior.Select,
          }),
          ["<S-Tab>"] = cmp.mapping.select_prev_item({
            behavior = types.cmp.SelectBehavior.Select,
          }),
          ["<CR>"] = cmp.mapping.confirm( --[[ { select = true } ]]),
        },
        sources = {
          { name = "copilot" },
          { name = "nvim_lsp" },
          { name = "snippy" },
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
            ellipsis_char = "...",
            symbol_map = {
              Copilot = "",
            },
          }),
        },
        experimental = {
          ghost_text = { hl_group = "Comment" },
        },
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
      })

      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

      require("snippy").setup({
        mappings = {
          is = {
            ["<C-j>"] = "expand_or_advance",
            ["<C-k>"] = "previous",
          },
          nx = {
            ["gx"] = "cut_text",
          },
        },
      })
    end,
  },
}
