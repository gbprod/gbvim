function! layers#markdown#plugins() abort
  Plug 'godlygeek/tabular'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
endfunction

function! layers#markdown#config() abort
  call add(g:extensions, 'coc-markdownlint')
  let g:vim_markdown_conceal = 0
endfunction


function! layers#markdown#bindings() abort
  autocmd FileType markdown nmap <silent><leader>lp <Plug>MarkdownPreviewToggle
  autocmd FileType markdown setlocal colorcolumn=+1 textwidth=80
  let g:language_specified_mappings['markdown'] = function('s:language_specified_mappings')
endfunction

function! s:language_specified_mappings() abort
  let g:leader_key_map.l.p = 'Preview toggle'
endfunction
