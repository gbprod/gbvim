function! layers#cursor#plugins()
  Plug 'mg979/vim-visual-multi', {'branch': 'master'}
endfunction

function! layers#cursor#config()
  let g:VM_leader = "<leader>v"
  let g:VM_maps = {}
  let g:VM_maps['Find Under'] = '<C-d>'
  let g:VM_maps['Find Subword Under'] = '<C-d>'
  let g:VM_maps["Add Cursor Down"] = '<C-A-Down>'
  let g:VM_maps["Add Cursor Up"] = '<C-A-Up>'

  let g:leader_key_map.v = { "name": "+Visual multi cursor"}
  let g:leader_key_map.v.A = "Select All"
  let g:leader_key_map.v['/'] = "Start Regex Search"
  let g:leader_key_map.v['\'] = "Add Cursor At Pos"
  " let g:leader_key_map.v['/'] = "Visual Regex"
  " let g:leader_key_map.v.A = "Visual All"
  " let g:leader_key_map.v.a = "Visual Add"
  " let g:leader_key_map.v.f = "Visual Find"
  " let g:leader_key_map.v.c = "Visual Cursors"
endfunction
