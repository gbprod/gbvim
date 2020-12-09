function! layers#terminal#bindings() abort
  let g:leader_key_map.a.s = 'Terminal'
  nmap <silent> <leader>as :botright split<CR>:terminal<CR>:setlocal nonumber norelativenumber<CR>i

  tnoremap <silent><C-Right> <C-\><C-n>:<C-u>wincmd l<CR>
  tnoremap <silent><C-Left> <C-\><C-n>:<C-u>wincmd h<CR>
  tnoremap <silent><C-Up> <C-\><C-n>:<C-u>wincmd k<CR>
  tnoremap <silent><C-Down> <C-\><C-n>:<C-u>wincmd j<CR>
  tnoremap <silent><esc><esc> <C-\><C-n>
endfunction
