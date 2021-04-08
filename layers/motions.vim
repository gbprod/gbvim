function! layers#motions#plugins() abort
  Plug 'terryma/vim-expand-region'
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-entire'
  Plug 'andymass/vim-matchup'
  Plug 'wellle/targets.vim'
  Plug 'wellle/line-targets.vim'
  Plug 'justinmk/vim-sneak'
endfunction

function! layers#motions#config() abort
  highlight Sneak cterm=underline ctermfg=14 ctermbg=201 gui=underline guifg=Red guibg=#2E3440
endfunction

function! layers#motions#bindings() abort
  xmap v <Plug>(expand_region_expand)
  xmap V <Plug>(expand_region_shrink)
  let g:expand_region_text_objects = {
        \ 'iw': 0,
        \ 'iW': 0,
        \ 'i"': 0,
        \ 'i''': 0,
        \ 'i]': 1,
        \ 'ib': 1,
        \ 'iB': 1,
        \ 'il': 1,
        \ 'ii': 1,
        \ 'ip': 0,
        \ 'ie': 0,
        \ }

  let g:targets_nl = 'nN'
  autocmd User targets#mappings#user call targets#mappings#extend({
        \ '-': {'separator': [{'d': '-'}]},
        \ 'l': {'line': [{'c': 1}]},
        \ })

  nmap )) ]]
  nmap (( [[

  " 2-character Sneak (default)
  nmap z <Plug>Sneak_s
  nmap Z <Plug>Sneak_S
  " visual-mode
  xmap z <Plug>Sneak_s
  xmap Z <Plug>Sneak_S
  " operator-pending-mode
  omap z <Plug>Sneak_s
  omap Z <Plug>Sneak_S
  " repeat motion
  map ; <Plug>Sneak_;
  map , <Plug>Sneak_,
  " 1-character enhanced 'f'
  nmap f <Plug>Sneak_f
  nmap F <Plug>Sneak_F
  " visual-mode
  xmap f <Plug>Sneak_f
  xmap F <Plug>Sneak_F
  " operator-pending-mode
  omap f <Plug>Sneak_f
  omap F <Plug>Sneak_F
  " 1-character enhanced 't'
  nmap t <Plug>Sneak_t
  nmap T <Plug>Sneak_T
  " visual-mode
  xmap t <Plug>Sneak_t
  xmap T <Plug>Sneak_T
  " operator-pending-mode
  omap t <Plug>Sneak_t
  omap T <Plug>Sneak_T
endfunction

