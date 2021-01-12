function! layers#terminal#plugins() abort
  Plug 'kassio/neoterm'
endfunction

function! layers#terminal#config() abort
  let g:neoterm_default_mod = "botright"
  let g:neoterm_autoinsert = 1
  let g:neoterm_autoscroll = 1

endfunction

function! layers#terminal#bindings() abort
  let g:leader_key_map.a.s = 'Terminal'
  nmap <silent> <leader>as :Ttoggle<CR>

  tnoremap <silent><C-Right> <C-\><C-n>:<C-u>wincmd l<CR>
  tnoremap <silent><C-Left> <C-\><C-n>:<C-u>wincmd h<CR>
  tnoremap <silent><C-Up> <C-\><C-n>:<C-u>wincmd k<CR>
  tnoremap <silent><C-Down> <C-\><C-n>:<C-u>wincmd j<CR>
  tnoremap <silent><C-o> <C-\><C-n>
endfunction
