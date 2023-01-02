local terminal = {}

function terminal.plugins(use)
  use("akinsho/toggleterm.nvim")
end

function terminal.setup()
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
end

function terminal.bindings(map)
  map("n", "<M-z>", "':ToggleTerm dir=' . getcwd() . '<cr>'", { expr = true })
  map("i", "<M-z>", "<esc><cmd>ToggleTerm<cr>", {})
  map("t", "<C-o>", [[<C-\><C-n>]], { silent = true })

  vim.cmd([[
    autocmd TermEnter term://*toggleterm#* tnoremap <silent><M-z> <Cmd>ToggleTerm<CR>
    autocmd TermEnter term://*toggleterm#* set signcolumn=no
    ]])
end

return terminal
