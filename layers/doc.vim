function! layers#doc#plugins() abort
  let g:doc_targets = {
    \ 'default': '"https://duckduckgo.com/?q=%s"'
    \ }
endfunction

function! layers#doc#bindings() abort
  let g:leader_key_map.D = { "name": "+Doc" }
  let g:leader_key_map.D.D = "Open online doc"
  nmap <expr> <leader>DD <SID>open_online_doc()
endfunction

function s:open_online_doc() abort
  return 'silent !firefox-developers --new-tab ' .
        \ printf(get(g:doc_targets, &ft, g:doc_targets['default']), expand('<cword>'))
endfunction
