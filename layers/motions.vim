function! layers#motions#plugins() abort
  Plug 'terryma/vim-expand-region'
  Plug 'kana/vim-textobj-user'
  Plug 'kana/vim-textobj-indent'
  Plug 'kana/vim-textobj-line'
  " Plug 'kana/vim-textobj-function'
  Plug 'glts/vim-textobj-comment'
  Plug 'kana/vim-textobj-entire'
  Plug 'rhysd/clever-f.vim'
  Plug 'andymass/vim-matchup'
  Plug 'wellle/targets.vim'
  " https://github.com/mg979/vim-visual-multi ?
endfunction

function! layers#motions#bindings() abort
  xmap v <Plug>(expand_region_expand)
  xmap V <Plug>(expand_region_shrink)
  let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'il'  :1,
      \ 'ii'  :1,
      \ 'ip'  :0,
      \ 'ie'  :0,
      \ }
endfunction

