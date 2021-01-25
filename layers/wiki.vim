function! layers#wiki#plugins() abort
  Plug 'vimwiki/vimwiki'
endfunction

function! layers#wiki#config() abort
  nmap <leader>nw <Plug>VimwikiIndex
  nmap <leader>nt <Plug>VimwikiTabIndex
  nmap <leader>ns <Plug>VimwikiUISelect
  nmap <leader>ni <Plug>VimwikiDiaryIndex
  nmap <leader>ndi <Plug>VimwikiDiaryGenerateLinks
  nmap <leader>ndw <Plug>VimwikiMakeDiaryNote
  nmap <leader>ndt <Plug>VimwikiTabMakeDiaryNote
  nmap <leader>ndy <Plug>VimwikiMakeYesterdayDiaryNote
  nmap <leader>ndm <Plug>VimwikiMakeTomorrowDiaryNote
endfunction
