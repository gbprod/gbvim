"=============================================================================
" init.vim --- Entry file for neovim
" Copyright (c) 2016-2020 Wang Shidong & Contributors
" Author: Wang Shidong < wsdjeg@outlook.com >
" URL: https://spacevim.org
" License: GPLv3
"=============================================================================

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
\ 'autocomplete',
\ 'checker',
\ 'formatter',
\ 'comments',
\ 'vimscript',
\ 'git',
\ 'html',
\ 'php',
\ 'javascript',
\ 'sh',
\ ]

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/main.vim'
