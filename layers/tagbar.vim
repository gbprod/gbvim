function! layers#tagbar#plugins() abort
  Plug 'liuchengxu/vista.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  let g:vista_executive_for = {}
endfunction

function! layers#tagbar#config() abort
  let g:vista_sidebar_width = 40
  let g:vista_default_executive = 'coc'
endfunction

function! layers#tagbar#bindings() abort
  let g:leader_key_map.a.t = "Tagbar"
  nmap <silent><leader>at :Vista!!<CR>
  let g:leader_key_map.f.t = "Tags"
  nmap <silent><leader>ft :Vista finder<CR>
endfunction

