local terminal = {}

local custom = {}

function terminal.plugins(use)
  use("numToStr/FTerm.nvim")
end

function terminal.setup()
  require("FTerm").setup({
    ft = "FTerm",
    dimensions = {
      height = 0.95,
      width = 0.95,
    },
  })
end

function terminal.bindings(map)
  map("n", "<M-z>", "<cmd>lua require('FTerm').toggle()<CR>", { noremap = true, silent = true })
  map("i", "<M-z>", "<esc><cmd>lua require('FTerm').toggle()<CR>", { noremap = true, silent = true })
  map("t", "<C-o>", [[<C-\><C-n>]], { noremap = true, silent = true })

  vim.cmd([[
  autocmd TermEnter term://*FTerm#* tnoremap <M-z> <cmd>lua require('FTerm').toggle()<CR>
]])
end

function terminal.create_custom(name, cmd)
  local fterm = require("FTerm")

  custom[name] = fterm:new({
    cmd = cmd,
    ft = "FTerm_" .. name,
  })

  vim.cmd(
    string.format(
      [[ autocmd TermEnter term://FTerm_%s lua vim.api.nvim_buf_set_keymap('t', '<M-z>', '<C-\\><C-n><cmd>lua require("terminal").toggle_custom("%s")<CR>', { noremap = true, silent = true }) ]],
      name,
      name
    )
  )
end

function terminal.toggle_custom(name)
  custom[name]:toggle()
end

return terminal
