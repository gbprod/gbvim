function! layers#yanking#plugins() abort
  Plug 'svermeulen/vim-cutlass'
  Plug 'svermeulen/vim-subversive'
  Plug 'svermeulen/vim-yoink'
  Plug 'tpope/vim-repeat'
endfunction

function! layers#yanking#config() abort
  set clipboard=unnamed,unnamedplus

  call add(g:extensions, 'coc-yank')
  hi HighlightedyankRegion term=bold ctermbg=0 guibg=#4C566A
  let g:yoinkIncludeDeleteOperations = 1
  let g:yoinkMaxItems = 20
  let g:yoinkSyncNumberedRegisters = 1
  let g:yoinkSavePersistently = has('nvim')
  let g:yoinkMoveCursorToEndOfPaste = 1
  let g:yoinkSwapClampAtEnds = 1
  let g:yoinkIncludeNamedRegisters = 1
  let g:yoinkSyncSystemClipboardOnFocus = 1

  let g:subversivePromptWithCurrent = 1
  let g:subversivePreserveCursorPosition = 1
endfunction

function! layers#yanking#bindings() abort
  nnoremap x d
  xnoremap x d
  nnoremap xx dd
  nnoremap X D

  nmap <M-p> <plug>(YoinkPostPasteSwapBack)
  nmap <M-P> <plug>(YoinkPostPasteSwapForward)

  nmap p <plug>(YoinkPaste_p)
  nmap P <plug>(YoinkPaste_P)

  nmap y <plug>(YoinkYankPreserveCursorPosition)
  xmap y <plug>(YoinkYankPreserveCursorPosition)

  nnoremap <Del> "_x

  nmap s <plug>(SubversiveSubstitute)
  nmap ss <plug>(SubversiveSubstituteLine)
  nmap S <plug>(SubversiveSubstituteToEndOfLine)

  xmap s <plug>(SubversiveSubstitute)
  xmap p <plug>(SubversiveSubstitute)
  xmap P <plug>(SubversiveSubstitute)

  let g:leader_key_map.x.s = { 'name': '+Substitute' }
  let g:leader_key_map.x.s.s = 'substitute <motion><motion>'
  nmap <leader>xss <plug>(SubversiveSubstituteRange)
  xmap <leader>xss <plug>(SubversiveSubstituteRange)
  let g:leader_key_map.x.s.w = 'substitute word<motion>'
  nmap <leader>xsw <plug>(SubversiveSubstituteWordRange)
  let g:leader_key_map.x.s.S = 'substitute <motion><motion> with confirm'
  nmap <leader>xsS <plug>(SubversiveSubstituteRangeConfirm)
  xmap <leader>wsS <plug>(SubversiveSubstituteRangeConfirm)
  let g:leader_key_map.x.s.W = 'substitute word with confirm'
  nmap <leader>xsW <plug>(SubversiveSubstituteWordRangeConfirm)

  let g:leader_key_map.x.S = { 'name': '+Subs. Keep Case' }
  let g:leader_key_map.x.S.s = 'substitute <motion><motion>'
  nmap <leader>xSs <plug>(SubversiveSubvertRange)
  xmap <leader>xSs <plug>(SubversiveSubvertRange)
  let g:leader_key_map.x.S.w = 'substitute word <motion>'
  nmap <leader>xSw <plug>(SubversiveSubvertWordRange)

  let g:leader_key_map.f.r = 'Registers'
  nnoremap <silent><leader>fr :Yanks<CR>
  let g:leader_key_map.f.y = 'Yanks'
  nnoremap <silent><leader>fy :CocList yank<CR>
endfunction

