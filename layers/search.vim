function! layers#search#plugins() abort
  Plug 'haya14busa/vim-asterisk'
  Plug 'google/vim-searchindex'
endfunction

function! layers#search#config() abort
  call add(g:extensions, 'coc-lists')

  if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
  endif

  call coc#config('refactor', {
    \ 'openCommand': 'rightbelow vsplit'
    \ }
    \ )

  let g:asterisk#keeppos = 1
endfunction

function! layers#search#bindings() abort
  let g:leader_key_map.s.s = 'Search'
  nmap <leader>ss :call SelectMain()<CR>:<c-u>CocSearch --fixed-strings<space>
  let g:leader_key_map.s.w = 'Search <cword>'
  nmap <expr> <leader>sw <SID>SearchCwordCmd()
  let g:leader_key_map.s['/'] = 'Search <lastsearch>'
  nmap <expr> <leader>s/ <SID>SearchPwordCmd()
  let g:leader_key_map.s.g = 'Grep'
  nnoremap <silent><leader>sg :call SelectMain()<CR>:<c-u>CocList grep<CR>
  let g:leader_key_map.s.f = 'Word in file'
  nnoremap <silent><leader>sf :call SelectMain()<CR>:<c-u>CocList words<CR>
  let g:leader_key_map.s.d = 'Search in directory'
  nmap <expr> <leader>sd <SID>SearchInDirCmd()
  let g:leader_key_map.s.r = 'Search regex'
  nnoremap <silent><leader>sr :call SelectMain()<CR>:<c-u>CocSearch --regex<space>

  nmap <silent> <Leader>sb <Plug>SearchNormal
  vmap <silent> <Leader>sb <Plug>SearchVisual

  map * <Plug>(asterisk-z*)
  map # <Plug>(asterisk-z#)
  map g* <Plug>(asterisk-gz*)
  map g# <Plug>(asterisk-gz#)
endfunction

function! s:SearchCwordCmd()
  return ":call SelectMain()\<CR>:\<C-U>CocSearch --fixed-strings " . expand('<cword>')
endfunction

function! s:SearchPwordCmd()
  return ":call SelectMain()\<CR>:\<C-U>CocSearch --fixed-strings " . @/
endfunction

function! s:SearchInDirCmd()
  if &ft == 'defx'
    if defx#get_candidate().is_directory
      let path = expand(defx#get_candidate().action__path, '%:h')
    else
      let path = expand(defx#get_candidate().action__path, '%:h')
    endif
    let path = fnamemodify(substitute(path, escape(getcwd(), '/').'\/', '', ''), ':h')
  else
    let path = expand('%:h')
  endif
  return printf(":call SelectMain()\<CR>:\<C-U>CocSearch --glob=%s/** --fixed-strings ", path)
endfunction
