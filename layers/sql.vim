function! layers#sql#plugins() abort
  Plug 'tpope/vim-dadbod'
  Plug 'kristijanhusak/vim-dadbod-completion'
  Plug 'kristijanhusak/vim-dadbod-ui'
endfunction

function! layers#sql#config() abort
  call add(g:extensions, 'coc-db')
  let g:db_ui_use_nerd_fonts=1
  " let g:db_ui_disable_mappings=1
endfunction

function! layers#sql#bindings() abort
  nmap <leader>aq :Defx -close<CR>:DBUIToggle<CR>
endfunction

