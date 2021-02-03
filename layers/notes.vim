function! layers#notes#plugins() abort
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-notes'
endfunction

function! layers#notes#config() abort
  let g:notes_directories = ['~/.notes']
  let g:notes_suffix = '.md'
endfunction

function! layers#notes#bindings() abort
  let g:leader_key_map.n = { "name": "+Notes" }

  let g:leader_key_map.n.N = "New"
  nmap <silent><leader>nN :<C-u>Note<CR>
  let g:leader_key_map.n.n = "List recent"
  nmap <silent><leader>nn :<C-u>RecentNotes<CR>
  let g:leader_key_map.n.d = "Delete current"
  nmap <silent><leader>nd :<C-u>DeleteNote<CR>
  let g:leader_key_map.n.s = "Search"
  nmap <silent><leader>ns :<C-u>SearchNotes<space>
endfunction
