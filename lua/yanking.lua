local yanking = {}

function yanking.plugins(use)
  use("~/workspace/cutlass.nvim")
  vim.g.use_yanky = true
  use("~/workspace/yanky.nvim")
  use("svermeulen/vim-yoink")
  use("~/workspace/substitute.nvim")
end

function yanking.setup()
  require("cutlass").setup({
    cut_key = "x",
    override_del = true,
    exclude = { "ns", "nS" },
  })

  require("substitute").setup({
    on_substitute = function(_)
      vim.cmd("call yoink#startUndoRepeatSwap()")
    end,
    range = {
      prompt_current_text = true,
    },
  })

  if vim.g.use_yanky then
    require("yanky").setup()
  end

  vim.highlight.create("YankedText", { guibg = "#4C566A" }, false)

  vim.cmd([[
    let &clipboard = "unnamed,unnamedplus"
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup='YankedText', timeout=500}
  ]])

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

  vim.g.yoinkIncludeDeleteOperations = 1
  if not vim.g.use_yanky then
    vim.g.yoinkMaxItems = 20
    vim.g.yoinkSyncNumberedRegisters = 1
    vim.g.yoinkSavePersistently = 1
    vim.g.yoinkMoveCursorToEndOfPaste = 1
    vim.g.yoinkSwapClampAtEnds = 1
    vim.g.yoinkIncludeNamedRegisters = 1
    vim.g.yoinkSyncSystemClipboardOnFocus = 1
  end
end

function yanking.bindings(map)
  local wk = require("which-key")

  if vim.g.use_yanky then
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
  else
    map("n", "<M-p>", "<plug>(YoinkPostPasteSwapBack)", {})
    map("n", "<M-P>", "<plug>(YoinkPostPasteSwapForward)", {})
    map("n", "p", "<plug>(YoinkPaste_p)", {})
    map("n", "P", "<Plug>(YoinkPaste_P)", {})
    map("n", "y", "<Plug>(YoinkYankPreserveCursorPosition)", {})
    map("x", "y", "<Plug>(YoinkYankPreserveCursorPosition)", {})

    map("x", "p", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })
    map("x", "P", "<cmd>lua require('substitute').visual()<cr>", { noremap = true })
  end

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
