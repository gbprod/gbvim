local layer = {}

layer.plugins = function(use)
  use 'tpope/vim-git'
  use 'lewis6991/gitsigns.nvim'
end

layer.setup = function()
  require('gitsigns').setup{
    keymaps = {
      ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
      ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    }
  }
end

layer.bindings = function(map)
  local wk = require("which-key")

  wk.register({
    ["<leader>g"] = { name = "+Git" },
    ["<leader>gh"] = { name = "+Hunk" },
    ['<leader>gn'] = { "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'", "Next hunk", expr = true},
    ['<leader>gN'] = { "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'", "Prev hunk", expr = true},
    ['<leader>ghs'] = { '<cmd>lua require"gitsigns".stage_hunk()<CR>', "Stage hunk" },
    ['<leader>ghu'] = { '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>', "Undo stage hunk" },
    ['<leader>ghr'] = { '<cmd>lua require"gitsigns".reset_hunk()<CR>', "Reset hunk" },
    ['<leader>gR'] = { '<cmd>lua require"gitsigns".reset_buffer()<CR>', 'Reset buffer' },
    ['<leader>ghp'] = { '<cmd>lua require"gitsigns".preview_hunk()<CR>', 'Preview hunk' },
    ['<leader>gb'] = { '<cmd>lua require"gitsigns".blame_line(true)<CR>', 'Blame' },
    ['<leader>gs'] = { '<cmd>Telescope git_status<CR>', 'Status' },
  })

  --[[ let g:leader_key_map.g.r.p = 'Pick'
  nmap <silent> <leader>grp :Pick<CR>
  xmap <silent> <leader>grp :Pick<CR>
  let g:leader_key_map.g.r.r = 'Reword'
  nmap <silent> <leader>grr :Reword<CR>
  xmap <silent> <leader>grr :Reword<CR>
  let g:leader_key_map.g.r.e = 'Edit'
  nmap <silent> <leader>gre :Edit<CR>
  xmap <silent> <leader>gre :Edit<CR>
  let g:leader_key_map.g.r.s = 'Squash'
  nmap <silent> <leader>grs :Squash<CR>
  xmap <silent> <leader>grs :Squash<CR>
  let g:leader_key_map.g.r.f = 'Fixup'
  nmap <silent> <leader>grf :Fixup<CR>
  xmap <silent> <leader>grf :Fixup<CR>
  let g:leader_key_map.g.r.b = 'Break'
  nmap <silent> <leader>grb :Break<CR>
  xmap <silent> <leader>grb :Break<CR>
  let g:leader_key_map.g.r.d = 'Drop'
  nmap <silent> <leader>grd :DropCR>
  xmap <silent> <leader>grd :DropCR> ]]

  wk.register({
    ['<leader>ghs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['<leader>ghr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>'
  }, { mode='v' })
end

layer.on_ft = function()
  vim.api.nvim_exec([[
    setlocal nocindent colorcolumn=+1 textwidth=80
  ]], true)
end

return layer

