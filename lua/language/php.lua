local layer = {}

layer.plugins = function(use)
  use {
    'phpactor/phpactor',
    branch = 'master',
    ft = 'php',
    run = 'composer install --no-dev -o && bin/phpactor extension:install phpactor/phpunit-extension',
  }
  use { 'tree-sitter/tree-sitter-php', run = ':TSInstall php'}
  use 'nelsyeung/twig.vim'
end

layer.setup = function()
  --[[ vim.cmd [[
    autocmd BufEnter *.php setlocal indentexpr= smartindent autoindent
  ]]
  require'lspconfig'.phpactor.setup{
    cmd = { require'packer'.config.package_root .. '/packer/opt/phpactor/bin/phpactor', 'language-server' },
    on_attach = function()
      --[[ buf_set_keymap('n', '<leader>li', ':PhpactorImportClass<CR>', {})
      buf_set_keymap('n', '<leader>lI', ':PhpactorImportMissingClasses<CR>', {})
      buf_set_keymap('n', '<leader>lm', ':PhpactorContextMenu<CR>', {})
      buf_set_keymap('n', '<leader>lr', ':PhpactorFindReferences<CR>', {})
      buf_set_keymap('n', '<leader>ln', ':PhpactorNavigate<CR>', {})
      buf_set_keymap('n', '<leader>lv', ':PhpactorChangeVisibility<CR>', {})
      buf_set_keymap('n', '<leader>lt', ':call layers#php#alternate(expand("%@"))<CR>', {})
      buf_set_keymap('n', '<leader>lfc', ':PhpactorCopyFile<CR>', {})
      buf_set_keymap('n', '<leader>lfm', ':PhpactorMoveFile<CR>', {})
      buf_set_keymap('n', '<leader>lci', ':PhpactorClassInflect<CR>', {})
      buf_set_keymap('n', '<leader>lca', ':PhpactorGenerateAccessors<CR>', {})
      buf_set_keymap('n', '<leader>lct', ':PhpactorTransform<CR>', {})
      buf_set_keymap('n', '<leader>lce', ':PhpactorClassExpand<CR>', {})
      buf_set_keymap('n', '<leader>lcn', ':PhpactorClassNew<CR>', {})
      buf_set_keymap('n', '<leader>lxm', ':PhpactorExtractMethod<CR>', {})
      buf_set_keymap('n', '<leader>lxv', ':PhpactorExtractExpression<CR>', {})
      buf_set_keymap('n', '<leader>lxc', ':PhpactorExtractConstant<CR>', {}) ]]

      require'lsp'.on_attach()
    end,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

layer.bindings = function(map)
end

return layer


