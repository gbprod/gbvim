function! layers#tagbar#plugins() abort
  Plug 'liuchengxu/vista.vim'
  let g:vista_executive_for = {}
endfunction

function! layers#tagbar#config() abort
  let g:vista_sidebar_width = 40
  let g:vista_default_executive = 'coc'
endfunction

function! layers#tagbar#bindings() abort
  let g:leader_key_map.a.v = "Tagbar"
  nmap <silent><leader>av :Vista!!<CR>
endfunction

