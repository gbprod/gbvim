function! layers#php#plugins() abort
  Plug 'StanAngeloff/php.vim'
  Plug '2072/PHP-Indenting-for-VIm'
  Plug 'nelsyeung/twig.vim'
  Plug 'phpactor/phpactor', {'branch' : 'develop', 'do' : 'composer install --no-dev -o' .
        \ ' && bin/phpactor extension:install phpactor/phpunit-extension'
        \ }
endfunction

function! layers#php#config() abort
  autocmd FileType php setlocal commentstring=//\ %s
  autocmd FileType html.twig* setlocal commentstring={#\ %s\ #} | let b:current_syntax = 'twig'
  let g:coc_filetype_map['html.twig.js.css'] = 'html'

  call add(g:extensions, 'coc-phpactor')
  let g:checkers['php'] = ['phpstan']
  call coc#config('diagnostic-languageserver.linters.phpstan.command', 'phpstan')

  if !isdirectory(expand('%:p')) || !filereadable(expand('%:p').'/phpstan.neon') || match(readfile(expand('%:p').'/phpstan.neon'), "level") < 0
    call coc#config('diagnostic-languageserver.linters.phpstan.args', [
          \ "analyze",
          \ "--error-format", "raw",
          \ "--no-progress",
          \ "--level", "max",
          \ "%file"
          \ ])
  endif

  let g:vista_executive_for['php'] = 'coc'

  call coc#config('phpactor', {
        \ 'enable': v:true,
        \ 'path': g:gbvim_plugins_root . '/phpactor/bin/phpactor'
        \ })

  " autocmd FileType php let b:coc_root_patterns = ['composer.json']
  autocmd FileType php setlocal colorcolumn=+1,+40 textwidth=80 formatoptions-=t

  let g:neoformat_enabled_php = ['phpcs']
  let g:neoformat_php_phpcs = {
        \ 'exe': 'php-cs-fixer',
        \ 'args': ['fix', '-q', '--config', expand('~/.config/phpcs/.php_cs')],
        \ 'replace': 1,
        \ }

  let g:PhpactorRootDirectoryStrategy = {-> getcwd() }

  let g:PHP_noArrowMatching = 1
endfunction

function! layers#php#bindings() abort
  autocmd FileType php nnoremap <leader>li :PhpactorImportClass<CR>
  autocmd FileType php nnoremap <leader>lI :PhpactorImportMissingClasses<CR>
  autocmd FileType php nnoremap <leader>lm :PhpactorContextMenu<CR>
  autocmd FileType php nnoremap <leader>lr :PhpactorFindReferences<CR>
  autocmd FileType php nnoremap <leader>ln :PhpactorNavigate<CR>
  autocmd FileType php nnoremap <leader>lv :PhpactorChangeVisibility<CR>
  autocmd FileType php nnoremap <leader>lt :call layers#php#alternate(expand("%@"))<CR>
  autocmd FileType php noremap <leader>lxm :PhpactorExtractMethod<CR>
  autocmd FileType php noremap <leader>lxv :PhpactorExtractExpression<CR>
  autocmd FileType php noremap <leader>lxc :PhpactorExtractConstant<CR>
  autocmd FileType php nnoremap <leader>lfc :PhpactorCopyFile<CR>',
  autocmd FileType php nnoremap <leader>lfm :PhpactorMoveFile<CR>
  autocmd FileType php nnoremap <leader>lci :PhpactorClassInflect<CR>
  autocmd FileType php nnoremap <leader>lca :PhpactorGenerateAccessors<CR>
  autocmd FileType php nnoremap <leader>lct :PhpactorTransform<CR>
  autocmd FileType php nnoremap <leader>lce :PhpactorClassExpand<CR>
  autocmd FileType php nnoremap <leader>lcn :PhpactorClassNew<CR>

  let g:language_specified_mappings['php'] = function('s:language_specified_mappings')
endfunction

function! s:language_specified_mappings() abort
  let g:leader_key_map.l.i = 'Import the name under the cusor'
  let g:leader_key_map.l.I = 'Attempt to import all non-resolvable classes'
  let g:leader_key_map.l.m = 'show the context menu for the current cursor position'
  let g:leader_key_map.l.r = 'Attempt to find all references'
  let g:leader_key_map.l.n = 'Navigate'
  let g:leader_key_map.l.v = 'Rotate visiblity'
  let g:leader_key_map.l.t = 'Alternate test file'

  let g:leader_key_map.l.x = {'name' : '+Extract'}
  let g:leader_key_map.l.x.m = 'Extract a new method'
  let g:leader_key_map.l.x.v = 'Extract to a variable'
  let g:leader_key_map.l.x.c = 'Extract a constant from a literal'

  let g:leader_key_map.l.f = {'name' : '+File'}
  let g:leader_key_map.l.f.c = 'Copy the current file'
  let g:leader_key_map.l.f.m = 'Move the current file'

  let g:leader_key_map.l.c = {'name' : '+Class'}
  let g:leader_key_map.l.c.i = 'Inflect a new class from the current class'
  let g:leader_key_map.l.c.a = 'Generate accessors'
  let g:leader_key_map.l.c.t = 'Show transform context menu'
  let g:leader_key_map.l.c.e = 'Expand the class name'
  let g:leader_key_map.l.c.n = 'create a new class'
endfunction

function! layers#php#alternate(file) abort
  if @% =~ "Test\.php$"
    execute 'find **/'.expand('%:t:r')[:-5].'.php'
  else
    find **/%:t:rTest.php
  endif
endfunction
