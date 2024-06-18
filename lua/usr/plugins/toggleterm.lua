return {
  {
    "akinsho/toggleterm.nvim",

    config = function()
      require("toggleterm").setup({
        open_mapping = nil,
        persist_size = true,
        direction = "float",
        highlights = {
          FloatBorder = {
            link = "FloatBorder",
          },
        },
        float_opts = {
          border = "single",
        },
      })

      vim.keymap.set("n", "<M-z>", "':ToggleTerm dir=' . getcwd() . '<cr>'", { expr = true })
      vim.keymap.set("i", "<M-z>", "<esc><cmd>ToggleTerm<cr>", {})
      vim.keymap.set("t", "<C-o>", [[<C-\><C-n>]], { silent = true })

      vim.cmd([[
      autocmd TermEnter term://*toggleterm#* tnoremap <silent><M-z> <Cmd>ToggleTerm<CR>
      autocmd TermEnter term://*toggleterm#* set signcolumn=no
      autocmd TermEnter term://*toggleterm#* set winfixbuf
      ]])
    end,
  },
}
