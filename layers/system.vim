" command! -nargs=0 GBLoadSession :call <SID>load_session()

function! layers#system#plugins() abort
  Plug 'airblade/vim-rooter'
  " should try coc workspaces...
endfunction

function! layers#system#config() abort
  let g:rooter_patterns = ['.git/', '.env', '.env.dist', '.project.vim', '.envrc']
  let g:rooter_silent_chdir = 1
endfunction

