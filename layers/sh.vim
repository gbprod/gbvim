function! layers#sh#plugins() abort
endfunction

function! layers#sh#config() abort
  call add(g:coc_global_extensions, 'coc-sh')
  let g:neoformat_enabled_sh = ['shfmt']
endfunction

function! layers#sh#bindings() abort
endfunction
