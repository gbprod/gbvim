function! layers#snippets#config() abort
  call add(g:extensions, 'coc-snippets')

  call coc#config('snippets', {
  \ 'userSnippetsDirectory': g:gbvim_root_dir . '/layers/snippets'
  \ })
endfunction
