return {
  {
    "ggandor/leap.nvim",
    dependencies = {

      "ggandor/flit.nvim",
      "ggandor/leap-spooky.nvim",
    },
    config = function()
      require("leap").setup({
        safe_labels = { "m", "n", "u", "t", ",", "F", "L", "N", "H", "G", "M", "U", "T", "Z" },
        -- stylua: ignore
        -- luacheck:ignore 631
        labels = { "m", "n", "j", "k", "l", "o", "d", "w", "e", "h", "m", "v", "g", "u", "t", "c", ".", "z", ",", "F", "L", "N", "H", "G", "M", "U", "T", "Z" },
        highlight_unlabeled_phase_one_targets = true,
      })

      require("flit").setup({
        keys = { f = "f", F = "F", t = "t", T = "T" },
        labeled_modes = "nvo",
        multiline = true,
      })
      require("leap-spooky").setup({
        affixes = {
          remote = { window = "r", cross_window = "R" },
          magnetic = { window = "m", cross_window = "M" },
        },
        paste_on_remote_yank = false,
      })
      vim.keymap.set("n", "m", "<Plug>(leap-forward)", {})
      vim.keymap.set("n", "M", "<Plug>(leap-backward)", {})
      vim.keymap.set("x", "m", "<Plug>(leap-forward)", {})
      vim.keymap.set("x", "M", "<Plug>(leap-backward)", {})
      vim.keymap.set("o", "m", "<Plug>(leap-forward)", {})
      vim.keymap.set("o", "M", "<Plug>(leap-backward)", {})
      vim.keymap.set("o", "z", "<Plug>(leap-forward-x)", {})
      vim.keymap.set("o", "Z", "<Plug>(leap-backward-x)", {})
      vim.keymap.set("n", "gm", "<Plug>(leap-cross-window)", {})
      vim.keymap.set("x", "gm", "<Plug>(leap-cross-window)", {})
      vim.keymap.set("o", "gm", "<Plug>(leap-cross-window)", {})
    end,
  },
}
