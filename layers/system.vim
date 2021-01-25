" command! -nargs=0 GBLoadSession :call <SID>load_session()

function! layers#system#plugins() abort
  Plug 'airblade/vim-rooter'
  " should try coc workspaces...
endfunction

function! layers#system#config() abort
  let g:rooter_patterns = ['.git/', '.env', '.env.dist', '.project.vim', '.envrc']
  let g:rooter_silent_chdir = 1

  " autocmd VimEnter * if isdirectory(expand('%:p')) | :call <SID>load_session() | endif
  " autocmd VimLeavePre * call <SID>save_session()
endfunction

" function! s:load_session() abort
"   if file_readable(expand('%:p').'/.project.vim')
"     execute 'source ' . expand('%:p').'/.project.vim'

"     if get(g:, 'project', '') == ''
"       echoerr 'Missing project name'
"       return
"     endif

"     if get(g:, 'save_session', 0) == 1 && file_readable(expand('~/.vim/sessions/' . g:project . '.vim'))
"       " execute 'source ' . expand('~/.vim/sessions/' . g:project . '.vim')
"     endif
"   endif
" endfunction

" function! s:save_session() abort
"   if get(g:, 'project', '') == ''
"     return
"   endif

"   Defx -close
"   execute 'CocCommand session.save ' . g:project
" endfunction
