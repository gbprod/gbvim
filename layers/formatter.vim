function! layers#formatter#plugins() abort
  Plug 'sbdchd/neoformat'
endfunction

function! layers#formatter#config() abort
  augroup FormatOnSave
    autocmd!
    autocmd BufWritePre * if get(g:, 'format_on_save', 1) | undojoin | Neoformat | endif
  augroup END
endfunction

function! layers#formatter#bindings() abort
  let g:leader_key_map.b.f = 'Format buffer'
  nnoremap <silent><leader>bf :Neoformat<CR>
  let g:leader_key_map.a.f = 'Toggle auto-format on save'
  nnoremap <silent><leader>af :ToggleFormatOnSave<CR>
endfunction

command! -nargs=0 ToggleFormatOnSave :call ToggleFormatOnSave()
function! ToggleFormatOnSave() abort
    let g:format_on_save = !get(g:, 'format_on_save', 1)
    if (g:format_on_save == 1)
      echom 'Auto-format enabled'
    else
      echom 'Auto-format disabled'
    endif
endfunction
