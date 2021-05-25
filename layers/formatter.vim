function! layers#formatter#plugins() abort
  Plug 'sbdchd/neoformat'
endfunction

function! layers#formatter#bindings() abort
  let g:leader_key_map.b.f = 'Format buffer'
  nnoremap <silent><leader>bf :Neoformat<CR>
  let g:leader_key_map.a.f = 'Toggle auto-format on save'
  nnoremap <silent><leader>af :ToggleFormatOnSave<CR>

  autocmd BufWritePre * AutoFormat
endfunction

command! -nargs=0 ToggleFormatOnSave :call ToggleFormatOnSave()
function! ToggleFormatOnSave() abort
  let b:format_on_save = !get(b:, 'format_on_save', 1)
  if (b:format_on_save == 1)
    echom 'Auto-format enabled'
  else
    echom 'Auto-format disabled'
  endif
endfunction

command! -nargs=0 AutoFormat :call AutoFormat()
function! AutoFormat() abort
  if get(b:, 'format_on_save', 0)
    try
      undojoin
      Neoformat
    catch /^Vim\%((\a\+)\)\=:E790/
    finally
      silent Neoformat
    endtry
  endif
endfunction

