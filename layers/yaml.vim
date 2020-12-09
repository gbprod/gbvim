function layers#yaml#config() abort
  call add(g:extensions, 'coc-yaml')

  let g:neoformat_enabled_yaml = ['prettier']
  let g:checkers.yaml = ['yamllint']
endfunction
