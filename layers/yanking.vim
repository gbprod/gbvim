function! layers#yanking#plugins() abort
  Plug 'svermeulen/vim-yoink'
  Plug 'tpope/vim-repeat'
endfunction

function! layers#yanking#config() abort
endfunction

function! layers#yanking#bindings() abort
  let g:localleader_key_map.y = 'Yank to clipboard'
  let g:localleader_key_map.p = 'Paste clipboard after'
  let g:localleader_key_map.P = 'Paste clipboard before'
  if has('unnamedplus')
    xnoremap <localleader>y "+y
    nnoremap <localleader>p "+p
    nnoremap <localleader>P "+P
    xnoremap <localleader>p "+p
    xnoremap <localleader>P "+P
  else
    xnoremap <localleader>y "*y
    nnoremap <localleader>p "*p
    nnoremap <localleader>P "*P
    xnoremap <localleader>p "*p
    xnoremap <localleader>P "*P
  endif

  nmap <M-p> <plug>(YoinkPostPasteSwapBack)
  nmap <M-P> <plug>(YoinkPostPasteSwapForward)

  nmap p <plug>(YoinkPaste_p)
  nmap P <plug>(YoinkPaste_P)

  nmap y <plug>(YoinkYankPreserveCursorPosition)
  xmap y <plug>(YoinkYankPreserveCursorPosition)

  nnoremap <Del> "_x
  xnoremap p "_dP

endfunction

