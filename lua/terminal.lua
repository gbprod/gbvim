return {
  plugins = function(use)
    use("numToStr/FTerm.nvim")
  end,

  setup = function()
    require("FTerm").setup({
      dimensions = {
        height = 0.95,
        width = 0.95,
      },
    })
  end,

  bindings = function(map)
    map("n", "<M-z>", "<CMD>lua require('FTerm').toggle()<CR>", { noremap = true, silent = true })
    map("i", "<M-z>", "<esc><CMD>lua require('FTerm').toggle()<CR>", { noremap = true, silent = true })
    map("t", "<C-o>", [[<C-\><C-n>]], { noremap = true, silent = true })
    map("t", "<M-z>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { noremap = true, silent = true })

    -- vim.cmd([[
    -- autocmd TermEnter term://*toggleterm#* set signcolumn=no
    -- ]])
  end,
}
