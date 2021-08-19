local layer = {}

layer.plugins = function(use)
  use 'kana/vim-textobj-user'
  use 'kana/vim-textobj-indent'
  use 'kana/vim-textobj-entire'
  use 'terryma/vim-expand-region'
  use 'andymass/vim-matchup'
  use 'wellle/targets.vim'
  use 'wellle/line-targets.vim'
  use 'justinmk/vim-sneak'
end

layer.setup = function()
  vim.g.expand_region_text_objects = {
    ['iw'] = 0,
    ['iW'] = 0,
    ['i"'] = 0,
    ['i\''] = 0,
    ['i]'] = 1,
    ['ib'] = 1,
    ['iB'] = 1,
    ['il'] = 1,
    ['ii'] = 1,
    ['ip'] = 0,
    ['if'] = 1,
    ['ic'] = 1,
    ['ie'] = 0,
  }

 vim.g.targets_nl = 'nN'
 vim.cmd
 [[
   autocmd User targets#mappings#user call targets#mappings#extend({ '-': {'separator': [{'d': '-'}]}, 'l': {'line': [{'c': 1}]}, })
   autocmd ColorScheme * highlight Sneak cterm=underline ctermfg=14 ctermbg=201 gui=underline guifg=Red guibg=#2E3440
 ]]

end

layer.bindings = function(map)
  map('x', 'v', '<Plug>(expand_region_expand)', {})
  map('x', 'V', '<Plug>(expand_region_shrink)', {})

  map('n', '))', ']]', {})
  map('n', '((', '[[', {})

  map('n', 'm', '<Plug>Sneak_s', {})
  map('n', 'M', '<Plug>Sneak_S', {})
  map('x', 'm', '<Plug>Sneak_s', {})
  map('x', 'M', '<Plug>Sneak_S', {})
  map('o', 'm', '<Plug>Sneak_s', {})
  map('o', 'M', '<Plug>Sneak_S', {})
  map('n', ';', '<Plug>Sneak_;', {})
  map('n', ',', '<Plug>Sneak_,', {})
  map('n', 'f', '<Plug>Sneak_f', {})
  map('n', 'F', '<Plug>Sneak_F', {})
  map('x', 'f', '<Plug>Sneak_f', {})
  map('x', 'F', '<Plug>Sneak_F', {})
  map('o', 'f', '<Plug>Sneak_f', {})
  map('o', 'F', '<Plug>Sneak_F', {})
  map('n', 't', '<Plug>Sneak_t', {})
  map('n', 'T', '<Plug>Sneak_T', {})
  map('x', 't', '<Plug>Sneak_t', {})
  map('x', 'T', '<Plug>Sneak_T', {})
  map('o', 't', '<Plug>Sneak_t', {})
  map('o', 'T', '<Plug>Sneak_T', {})
end

return layer



