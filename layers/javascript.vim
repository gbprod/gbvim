function! layers#javascript#plugins() abort
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
endfunction

function! layers#javascript#config() abort
  call add(g:extensions, 'coc-json')
  call add(g:extensions, 'coc-tsserver')
  call add(g:extensions, 'coc-eslint')
  call add(g:extensions, 'coc-react-refactor')

  autocmd FileType *.js,*.jsx,*.ts,*.tsx let b:format_on_save=1

  autocmd Filetype json let g:indentLine_setConceal = 0 | set conceallevel=0
  autocmd FileType javascript let b:coc_root_patterns = ['package.json']
  autocmd FileType javascript setlocal
        \ shiftwidth=2
        \ tabstop=2
        \ colorcolumn=+1,+40
        \ textwidth=80
        \ formatoptions-=t

  let g:neoformat_enabled_javascript = ['prettier']
  let g:neoformat_enabled_json = ['prettier']
endfunction

function! layers#javascript#bindings() abort
  autocmd FileType javascript,javascriptreact nnoremap <leader>lo :CocCommand tsserver.organizeImports<CR>

  let g:language_specified_mappings['javascript'] = function('s:language_specified_mappings')
  let g:language_specified_mappings['javascriptreact'] = function('s:language_specified_mappings')
endfunction

function! s:language_specified_mappings() abort
  let g:leader_key_map.l.o = 'Organize imports'
endfunction
