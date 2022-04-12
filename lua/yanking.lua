local yanking = {}

function yanking.plugins(use)
  use("~/workspace/cutlass.nvim")
  use("~/workspace/yanky.nvim")
  use("~/workspace/substitute.nvim")
end

function yanking.setup()
  require("cutlass").setup({
    cut_key = "x",
    override_del = true,
    exclude = { "ns", "nS" },
  })

  require("substitute").setup({
    on_substitute = function(event)
      require("yanky").init_ring("p", event.register, event.count, event.vmode:match("[vV]"))
    end,
    range = {
      prompt_current_text = true,
    },
  })

  require("yanky").setup()

  vim.highlight.create("YankyPut", { guibg = "#4C566A" }, false)
  vim.highlight.create("YankyYanked", { guibg = "#4C566A" }, false)

  vim.cmd([[ let &clipboard = "unnamed,unnamedplus" ]])

  vim.g.clipboard = {
    name = "xsel_override",
    copy = {
      ["+"] = "xsel --input --clipboard",
      ["*"] = "xsel --input --primary",
    },
    paste = {
      ["+"] = "xsel --output --clipboard",
      ["*"] = "xsel --output --primary",
    },
    cache_enabled = 1,
  }
end

function yanking.bindings(map)
  local wk = require("which-key")

  map("n", "p", "<Plug>(YankyPutAfter)", {})
  map("n", "P", "<Plug>(YankyPutBefore)", {})
  map("x", "p", "<Plug>(YankyPutAfter)", {})
  map("x", "P", "<Plug>(YankyPutBefore)", {})

  map("n", "gp", "<Plug>(YankyGPutAfter)", {})
  map("n", "gP", "<Plug>(YankyGPutBefore)", {})
  map("x", "gp", "<Plug>(YankyGPutAfter)", {})
  map("x", "gP", "<Plug>(YankyGPutBefore)", {})

  map("n", "<M-p>", "<Plug>(YankyCycleForward)", {})
  map("n", "<M-P>", "<Plug>(YankyCycleBackward)", {})

  map("n", "y", "<Plug>(YankyYank)", {})
  map("x", "y", "<Plug>(YankyYank)", {})

  map("n", "s", "<cmd>lua require('substitute').operator()<cr>", { noremap = true })
  map("n", "ss", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
  map("n", "S", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
  map("x", "s", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })

  map("n", "sx", "<cmd>lua require('substitute.exchange').operator()<cr>", { noremap = true })
  map("n", "sxx", "<cmd>lua require('substitute.exchange').line()<cr>", { noremap = true })
  map("x", "X", "<cmd>lua require('substitute.exchange').visual()<cr>", { noremap = true })
  map("n", "sxc", "<cmd>lua require('substitute.exchange').cancel()<cr>", { noremap = true })

  wk.register({
    ["<leader>xs"] = {
      name = "+Substitute",
      s = { "<cmd>lua require('substitute.range').operator()<cr>", "Substitute <motion><motion>" },
      S = {
        "<cmd>lua require('substitute.range').operator({ confirm = true })<cr>",
        "Substitute <motion><motion> with confirm",
      },
      ["ss"] = { "<cmd>lua require('substitute.range').word()<cr>", "Substitute <motion><motion>" },
    },
    ["<leader>xS"] = {
      name = "+Substitute abolish",
      s = { "<cmd>lua require('substitute.range').operator({ prefix = 'S' })<cr>", "Substitute <motion><motion>" },
      S = {
        "<cmd>lua require('substitute.range').operator({ confirm = true,  prefix = 'S' })<cr>",
        "Substitute <motion><motion> with confirm",
      },
      ["ss"] = { "<cmd>lua require('substitute.range').word({ prefix = 'S' })<cr>", "Substitute <motion><motion>" },
    },
  }, {
    mode = "n",
  })

  wk.register({
    ["<leader>xs"] = {
      name = "+Substitute",
      s = { "<cmd>lua require('substitute.range').visual()<cr>", "Substitute <motion>" },
      S = {
        "<cmd>lua require('substitute.range').visual({ confirm = true })<cr>",
        "Substitute <motion> with confirm",
      },
    },
    ["<leader>xS"] = {
      name = "+Subvert",
      s = {
        "<cmd>lua require('substitute.range').visual({ prefix = 'S' })<cr>",
        "Substitute <motion>",
      },
      S = {
        "<cmd>lua require('substitute.range').visual({ confirm = true,  prefix = 'S' })<cr>",
        "Substitute <motion> with confirm",
      },
    },
  }, {
    mode = "x",
  })
end

return yanking
