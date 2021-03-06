function! layers#sh#config() abort
  call add(g:extensions, 'coc-sh')
  let g:checkers.sh = "shellcheck"
  let g:neoformat_enabled_sh = ['shfmt']

  call coc#config('diagnostic-languageserver.linters.shellcheck.args', [
    \ "--format", "json",
    \ "-x",
    \ "-"
    \ ])
endfunction

