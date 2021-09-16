return {
  plugins = function(use)
    use("svermeulen/vim-cutlass")
    use("svermeulen/vim-yoink")
    use("svermeulen/vim-subversive")
  end,

  setup = function()
    vim.cmd([[
    let &clipboard = "unnamed,unnamedplus"

    autocmd ColorScheme * highlight YankedText guibg=#4C566A
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup='YankedText', timeout=500}
    ]])

    vim.g.yoinkIncludeDeleteOperations = 1
    vim.g.yoinkMaxItems = 20
    vim.g.yoinkSyncNumberedRegisters = 1
    vim.g.yoinkSavePersistently = 1
    vim.g.yoinkMoveCursorToEndOfPaste = 1
    vim.g.yoinkSwapClampAtEnds = 1
    vim.g.yoinkIncludeNamedRegisters = 1
    vim.g.yoinkSyncSystemClipboardOnFocus = 1

    vim.g.subversivePromptWithCurrent = 1
    vim.g.subversivePreserveCursorPosition = 1
  end,

  bindings = function(map)
    local wk = require("which-key")

    map("n", "x", "d", { noremap = true })
    map("x", "x", "d", { noremap = true })
    map("n", "xx", "dd", { noremap = true })
    map("n", "X", "D", { noremap = true })
    map("n", "<Del>", '"_x', { noremap = true })

    map("n", "<M-p>", "<plug>(YoinkPostPasteSwapBack)", {})
    map("n", "<M-P>", "<plug>(YoinkPostPasteSwapForward)", {})

    map("n", "p", "<plug>(YoinkPaste_p)", {})
    map("n", "P", "<Plug>(YoinkPaste_P)", {})

    map("n", "y", "<Plug>(YoinkYankPreserveCursorPosition)", {})
    map("x", "y", "<Plug>(YoinkYankPreserveCursorPosition)", {})

    map("n", "s", "<Plug>(SubversiveSubstitute)", {})
    map("n", "ss", "<Plug>(SubversiveSubstituteLine)", {})
    map("n", "S", "<Plug>(SubversiveSubstituteToEndOfLine)", {})

    map("x", "s", "<plug>(SubversiveSubstitute)", {})
    map("x", "p", "<plug>(SubversiveSubstitute)", {})
    map("x", "P", "<plug>(SubversiveSubstitute)", {})

    wk.register({
      ["<leader>xs"] = {
        name = "+Substitute",
        s = { "<plug>(SubversiveSubstituteRange)", "Substitute <motion><motion>" },
        S = { "<plug>(SubversiveSubstituteRangeConfirm)", "Substitute <motion><motion> with confirm" },
      },
      ["<leader>xS"] = {
        name = "+Subvert",
        s = { "<plug>(SubversiveSubvertRange)", "Subvert <motion><motion>" },
        S = { "<plug>(SubversiveSubvertRangeConfirm)", "Subvert <motion><motion> with confirm" },
      },
    }, {
      mode = "n",
    })

    wk.register({
      ["<leader>xs"] = {
        name = "+Substitute",
        s = { "<plug>(SubversiveSubstituteRange)", "Substitute <motion><motion>" },
        S = { "<plug>(SubversiveSubstituteRangeConfirm)", "Substitute <motion><motion> with confirm" },
      },
      ["<leader>xS"] = {
        name = "+Subvert",
        s = { "<plug>(SubversiveSubvertRange)", "Subvert <motion><motion>" },
        S = { "<plug>(SubversiveSubvertRangeConfirm)", "Subvert <motion><motion> with confirm" },
      },
    }, {
      mode = "x",
    })
  end,
}
