function! layers#homepage#plugins() abort
  Plug 'mhinz/vim-startify'
endfunction

function! layers#homepage#config() abort
  autocmd VimEnter * if isdirectory(expand('%:p')) | Startify | endif

  let g:startify_lists = [
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ ]
  " \ { 'type': 'sessions',  'header': ['   Sessions']       },
endfunction

function! layers#homepage#bindings() abort
  let g:leader_key_map.a.h = 'Homepage'
  nnoremap <silent><leader>ah :Startify<CR>
endfunction

function! s:gitModified()
  let files = systemlist('git ls-files -m 2>/dev/null')
  return map(files, "{'line': v:val, 'path': v:val}")
endfunction

function! s:gitUntracked()
  let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
  return map(files, "{'line': v:val, 'path': v:val}")
endfunction

