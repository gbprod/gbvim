return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide", "fallback" },
        ["<CR>"] = { "accept", "fallback" },

        ["<Up>"] = { "fallback" },
        ["<Down>"] = { "fallback" },

        ["<S-Tab>"] = { "select_prev", "fallback" },
        ["<Tab>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },

        ["<c-j>"] = { "snippet_forward", "fallback" },
        ["<c-k>"] = { "snippet_backward", "fallback" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },
        ["<C-y>"] = { "select_and_accept" },
      },
      completion = {
        documentation = {
          window = {
            border = "single",
          },
        },
      },
    },
  },
}
