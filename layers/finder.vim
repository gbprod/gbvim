function! layers#finder#plugins() abort
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'FelikZ/ctrlp-py-matcher'
  Plug 'mattn/ctrlp-register'
  Plug 'DeaR/ctrlp-jumps'
  Plug 'tacahiroy/ctrlp-funky'
endfunction

function! layers#finder#config() abort
  let g:ctrlp_working_path_mode = 'ra'
  let g:ctrlp_root_markers = g:rooter_patterns
  let g:ctrlp_show_hidden = 1
  
  let g:ctrlp_use_caching = 500
  let g:ctrlp_clear_cache_on_exit = 1
  let g:ctrlp_cache_dir = g:data_dir . '/ctrlp'

  let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
endfunction

function! layers#finder#bindings() abort
  let g:leader_key_map.b.b = 'Buffers list'
  nnoremap <silent><leader>bb :CtrlPBuffer<CR>
  let g:leader_key_map.f.m = 'MRU Files'
  nnoremap <silent><leader>fm :CtrlPMRU<CR>

  let g:localleader_key_map.f = { "name": '+Finder' }
  let g:localleader_key_map.f.r = 'Registers'
  nnoremap <silent><localleader>fr :CtrlPRegister<CR>
  let g:localleader_key_map.f.j = 'Jumps'
  nnoremap <silent><localleader>fj :CtrlPJump<CR>
  let g:localleader_key_map.f.f = 'Function'
  nnoremap <silent><localleader>ff :CtrlPFunky<CR>

  let g:ctrlp_prompt_mappings = {
  \ 'PrtInsert()': ['<c-a>'],
  \ 'AcceptSelection("e")': ['<cr>'],
  \ }
endfunction

