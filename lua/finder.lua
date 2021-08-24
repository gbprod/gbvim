local layer = {}

layer.plugins = function(use)
  use 'nvim-telescope/telescope.nvim'
end

layer.setup = function()
  require('telescope').setup{
    defaults = {
      sorting_strategy = "ascending",
    }
  }
end

layer.bindings = function(map)
  local wk = require("which-key")

  wk.register({
    ['<leader>ff'] = { "<cmd>lua require('telescope.builtin').find_files()<cr>", 'Find files' },
    -- ['<leader>fw'] = { ":Telescope find_files<cr>"..vim.fn.expand('<cword>'), 'Find file <cword>' },
    -- nnoremap <expr> <leader>sF ':Telescope find_files<cr>' . "'" . expand('<cword>')
    ['<leader>fm'] = { "<cmd>lua require('telescope.builtin').oldfiles()<cr>", 'MRU files' },
    ['<leader>ss'] = { "<cmd>lua require('telescope.builtin').live_grep()<cr>", 'Live grep' },
    ['<leader>sw'] = { "<cmd>lua require('telescope.builtin').grep_string()<cr>", 'Grep word' },
    ['<leader>bb'] = { "<cmd>lua require('telescope.builtin').buffers()<cr>", 'Buffers' },
  }, { mode="n" })

  map('n', '<c-p>', "<cmd>lua require('telescope.builtin').find_files()<cr>", {})
end

return layer


