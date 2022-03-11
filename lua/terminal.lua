local terminal = {}

local custom = {}

function terminal.plugins(use)
  use("numToStr/FTerm.nvim")
end

function terminal.setup()
  require("FTerm").setup({
    ft = "FTerm",
    cmd = os.getenv("SHELL") .. ";#term_default#",
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
  autocmd TermEnter term://*#term_default#* tnoremap <silent><M-z> <cmd>lua require('FTerm').close()<CR>
  ]])
end

function terminal.create_custom(name, cmd)
  local fterm = require("FTerm")

  custom[name] = fterm:new({
    cmd = cmd .. ";#term_" .. name .. "#",
    ft = "term_" .. name,
    dimensions = {
      height = 0.95,
      width = 0.95,
    },
  })

  vim.cmd(
    string.format(
      [[ autocmd TermEnter term://*#term_%s#* tnoremap <silent><M-z> <cmd>lua require('terminal').toggle_custom('%s')<CR> ]],
      name,
      name
    )
  )
end

function terminal.toggle_custom(name)
  custom[name]:toggle()
end

return terminal
