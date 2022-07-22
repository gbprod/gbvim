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
    yank_substituted_text = false,
    on_substitute = function(event)
      require("yanky").init_ring("p", event.register, event.count, event.vmode:match("[vV]"))
    end,
    range = {
      prompt_current_text = false,
      group_substituted_text = true,
    },
  })

  require("yanky").setup()
  require("telescope").load_extension("yank_history")
  vim.cmd([[ let &clipboard = "unnamed,unnamedplus" ]])
end

function yanking.bindings(map)
  local wk = require("which-key")

  map("n", "p", "<Plug>(YankyPutAfter)", {})
  map("n", "P", "<Plug>(YankyPutBefore)", {})

  map("x", "p", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })
  map("x", "P", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })

  map({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)", {})
  map({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)", {})

  map({ "n", "x" }, ")p", "<Plug>(YankyPutIndentAfterLinewise)", {})
  map({ "n", "x" }, "(p", "<Plug>(YankyPutIndentBeforeLinewise)", {})
  map({ "n", "x" }, ")P", "<Plug>(YankyPutIndentAfterLinewise)", {})
  map({ "n", "x" }, "(P", "<Plug>(YankyPutIndentBeforeLinewise)", {})

  map({ "n", "x" }, ")gp", "<Plug>(YankyGPutAfterLinewise)", {})
  map({ "n", "x" }, "(gp", "<Plug>(YankyGPutBeforeLinewise)", {})
  map({ "n", "x" }, ")gP", "<Plug>(YankyGPutAfterLinewise)", {})
  map({ "n", "x" }, "(gP", "<Plug>(YankyGPutBeforeLinewise)", {})

  map({ "n", "x" }, ">p", "<Plug>(YankyPutIndentAfterShiftRight)", {})
  map({ "n", "x" }, "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", {})
  map({ "n", "x" }, ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", {})
  map({ "n", "x" }, "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", {})

  map({ "n", "x" }, "=p", "<Plug>(YankyPutAfterFilter)", {})
  map({ "n", "x" }, "=P", "<Plug>(YankyPutBeforeFilter)", {})
  map({ "n", "x" }, "=gp", "<Plug>(YankyGPutAfterFilter)", {})
  map({ "n", "x" }, "=gP", "<Plug>(YankyGPutBeforeFilter)", {})

  map("n", "<M-p>", "<Plug>(YankyCycleForward)", {})
  map("n", "<M-P>", "<Plug>(YankyCycleBackward)", {})

  map({ "n", "x" }, "y", "<Plug>(YankyYank)", {})

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
    ["<leader>yy"] = {
      "<cmd>Telescope yank_history<cr>",
      "Yank History",
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
    ["<leader>yy"] = {
      "<cmd>Telescope yank_history<cr>",
      "Yank History",
    },
  }, {
    mode = "x",
  })
end

return yanking
