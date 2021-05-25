function! layers#checker#plugins() abort
  let g:checkers = {}
endfunction

function! layers#checker#config() abort
  call add(g:extensions, 'coc-diagnostic')
  call coc#config('diagnostic', {
    \ "errorSign": "✖",
    \ "warningSign": "⚠",
    \ "infoSign": "🛈",
    \ "hintSign": "➤",
    \ })

  call coc#config('diagnostic-languageserver.mergeConfig', v:true)
endfunction

function! layers#checker#bindings() abort
  let g:leader_key_map.e = { 'name': '+Errors' }

  let g:leader_key_map.e.e = 'Open'
  nnoremap <silent><leader>ee :CocDiagnostics<CR>
  let g:leader_key_map.e.O = 'Open All'
  nnoremap <silent><leader>eO :CocList diagnostics<CR>
  let g:leader_key_map.e.c = 'Close'
  nnoremap <silent><leader>ec :lclose<CR>
  let g:leader_key_map.e.n = 'Next'
  nmap <silent> <leader>en <Plug>(coc-diagnostic-next)
  let g:leader_key_map.e.N = 'Previous'
  nmap <silent> <leader>eN <Plug>(coc-diagnostic-prev)
  let g:leader_key_map.e.t = 'Toggle'
  nmap <silent> <leader>et :call CocAction('diagnosticToggle')<CR>
endfunction

function! layers#checker#config_after() abort
  call coc#config('diagnostic-languageserver.filetypes', g:checkers)
endfunction
