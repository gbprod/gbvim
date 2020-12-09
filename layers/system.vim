function! layers#system#plugins() abort
  Plug 'airblade/vim-rooter'
  " should try coc workspaces...
endfunction

function! layers#system#config() abort
  call coc#config('rootPatterns', ['.git/', '.env', '.env.dist', '.project.json', '.envrc'])
  let g:rooter_silent_chdir = 1
endfunction
