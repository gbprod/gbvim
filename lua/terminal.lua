local layer = {}

layer.plugins = function(use)
  use "akinsho/toggleterm.nvim"
end

layer.setup = function()
  require("toggleterm").setup{
    open_mapping = nil,
    persist_size = true,
    direction = 'float',
    float_opts = {
      border = 'single',
    }
  }
end

layer.bindings = function(map)
  map('n', '<F4>', "':ToggleTerm dir=' . getcwd() . '<cr>'", { expr = true })
  map('i', '<F4>', "<esc><cmd>ToggleTerm<cr>", {})

  vim.cmd([[
    autocmd TermEnter term://*toggleterm#* tnoremap <silent><F4> <Cmd>ToggleTerm<CR>
  ]])
end

return layer
