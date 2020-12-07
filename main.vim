execute 'set encoding=utf-8'
scriptencoding utf-8

let g:gbvim_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

for s:layer in g:layers
  execute 'source ' . g:gbvim_root_dir . '/layers/' . s:layer . '.vim'
endfor

let g:gbvim_plugins_root = (has('nvim') ? stdpath('data') : '~/.vim') . '/plugged'
call plug#begin(g:gbvim_plugins_root)
for s:layer in g:layers
  call layers#{s:layer}#plugins()
endfor
call plug#end()

" Auto install missing plugins on startup
if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  PlugInstall --sync | q
endif

for s:layer in g:layers
  call layers#{s:layer}#config()
  call layers#{s:layer}#bindings()
endfor


