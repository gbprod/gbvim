function! layers#system#plugins() abort
  Plug 'airblade/vim-rooter'
endfunction

function! layers#system#config() abort
  let g:rooter_patterns = ['.git/', '.env', '.env.dist', '.project_alt.json']
  let g:rooter_silent_chdir = 1
endfunction

function! layers#system#bindings() abort
endfunction

