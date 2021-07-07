" command! -nargs=0 GBLoadSession :call <SID>load_session()

function! layers#system#plugins() abort
  Plug 'airblade/vim-rooter'
  Plug 'tpope/vim-eunuch'
endfunction

function! layers#system#config() abort
  let g:rooter_patterns = ['.git/', '.env', '.env.dist', '.project.vim', '.envrc']
  let g:rooter_silent_chdir = 1
  call coc#config("coc.preferences.rootPatterns", ['.git/', '.env', '.env.dist', '.project.vim', '.envrc'])
endfunction

