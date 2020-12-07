function! layers#php#plugins() abort
  Plug 'StanAngeloff/php.vim'
  Plug '2072/PHP-Indenting-for-VIm'
  Plug 'phpactor/phpactor', {'branch' : 'develop', 'do' : 'composer install --no-dev -o' . 
  \ ' && bin/phpactor extension:install phpactor/language-server-phpstan-extension' . 
  \ ' && bin/phpactor extension:install phpactor/phpunit-extension' 
  \ }
endfunction

function! layers#php#config() abort
  call add(g:coc_global_extensions, 'coc-phpactor')

  call coc#config('phpactor', {
  \ 'enable': v:true,
  \ 'path': g:gbvim_plugins_root . '/phpactor/bin/phpactor'
  \ })
  call coc#config('language_server_phpstan', {
  \ 'bin': '/home/gilles/.config/composer/vendor/bin/phpstan',
  \ })
endfunction

function! layers#php#bindings() abort
endfunction

