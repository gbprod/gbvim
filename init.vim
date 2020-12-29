" python3 and neovim bug
" see https://github.com/neovim/neovim/issues/1887#issuecomment-280653872
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif

let g:layers = [
\ 'defaults',
\ 'system',
\ 'ui',
\ 'homepage',
\ 'yanking',
\ 'motions',
\ 'edit',
\ 'filetree',
\ 'finder',
\ 'search',
\ 'tagbar',
\ 'checker',
\ 'autocomplete',
\ 'formatter',
\ 'comments',
\ 'vimscript',
\ 'git',
\ 'html',
\ 'php',
\ 'javascript',
\ 'sh',
\ 'snippets',
\ 'undotree',
\ 'yaml',
\ 'markdown',
\ 'terminal',
\ 'docker',
\ ]

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/main.vim'
