function! layers#notes#plugins() abort
  Plug 'xolox/vim-misc'
  Plug 'xolox/vim-notes'
endfunction

function! layers#notes#config() abort
  let g:notes_directories = ['~/.notes']
  let g:notes_suffix = '.md'

  let g:notes_conceal_code = 0
  let g:notes_conceal_italic = 0
  let g:notes_conceal_bold = 0
  let g:notes_conceal_url = 0
  let g:notes_smart_quotes = 0

  highlight link notesCodeStart NonText
  highlight link notesCodeEnd NonText
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
