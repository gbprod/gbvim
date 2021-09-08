return {
  plugins = function(use)
    use {
      'phpactor/phpactor',
      branch = 'master',
      ft = 'php',
      run = 'composer install --no-dev -o && bin/phpactor extension:install phpactor/phpunit-extension',
    }
    use { 'tree-sitter/tree-sitter-php', run = ':TSInstall php'}
    use 'nelsyeung/twig.vim'
  end,

  setup = function()
    require'lspconfig'.phpactor.setup{
      cmd = { require'packer'.config.package_root .. '/packer/opt/phpactor/bin/phpactor', 'language-server' },
      on_attach = require'lsp'.on_attach,
      flags = {
        debounce_text_changes = 150,
      }
    }

    --[[ require'lspconfig'.diagnosticls.setup{
      filetypes = { 'php' },
      init_options = {
        filetypes = {
          php = { "psalm" },
        },
        linters = {
          psalm = {
            command = "./vendor/bin/psalm",
            debounce = 100,
            rootPatterns = {"composer.json", "composer.lock", "vendor", ".git"},
            args = {"--output-format=emacs", "--no-progress", '%file' },
            offsetLine = 0,
            offsetColumn = 0,
            sourceName = "psalm",
            formatLines = 1,
            formatPattern = {
              "^[^:]+:(\\d+):(\\d+):(.*)\\s-\\s(.*)(\\r|\\n)*$",
              {
                line = 1,
                column = 2,
                message = 4,
                security = 3
              }
            },
            securities = {
              error = "error",
              warning = "warning"
            },
            requiredFiles = {"psalm.xml"},
          },
        },
      }
    } ]]

    require('formatter').setup({
      logging = false,
      filetype = {
        php = {
          function()
            return {
              exe = 'php-cs-fixer',
              args = {
                '--using-cache=no',
                '--no-interaction',
                '--quiet',
                '--config=/home/gilles/.config/phpcs/.php_cs',
                'fix',
              },
              stdin = false,
              tempfile_dir = "/tmp"
            }
          end
        }
      }
    })


    local null_ls = require("null-ls")
    null_ls.register(null_ls.builtins.diagnostics.phpstan.with({
      command = './vendor/bin/phpstan',
      condition = function(utils)
        return utils.root_has_file("phpstan.neon")
      end,
    }))
    null_ls.register(null_ls.builtins.diagnostics.psalm.with({
      command = './vendor/bin/psalm',
      condition = function(utils)
        return utils.root_has_file("psalm.xml")
      end,
    }))
  end,

  on_ft = function()
    require("which-key").register({
      ['<leader>l'] = { name = '+Php' },
      ['<leader>li'] = { ':PhpactorImportClass<CR>', "Import the name under the cusor", buffer = 0 },
      ['<leader>lI'] = { ':PhpactorImportMissingClasses<CR>', "Attempt to import all non-resolvable classes", buffer = 0 },
      ['<leader>lm'] = { ':PhpactorContextMenu<CR>', "show the context menu for the current cursor position", buffer = 0 },
      ['<leader>lr'] = { ':PhpactorFindReferences<CR>', "Attempt to find all references", buffer = 0 },
      ['<leader>ln'] = { ':PhpactorNavigate<CR>', "Navigate", buffer = 0 },
      ['<leader>lv'] = { ':PhpactorChangeVisibility<CR>', "Rotate visiblity", buffer = 0 },

      ['<leader>lf'] = { name = "+File" },
      ['<leader>lfc'] = { ':PhpactorCopyFile<CR>', "Copy the current file", buffer = 0 },
      ['<leader>lfm'] = { ':PhpactorMoveFile<CR>', "Move the current file", buffer = 0 },

      ['<leader>lc'] = { name = "+Class" },
      ['<leader>lci'] = { ':PhpactorClassInflect<CR>', "Inflect a new class from the current class", buffer = 0 },
      ['<leader>lca'] = { ':PhpactorGenerateAccessors<CR>', "Generate accessors", buffer = 0 },
      ['<leader>lct'] = { ':PhpactorTransform<CR>', "Show transform context menu", buffer = 0 },
      ['<leader>lce'] = { ':PhpactorClassExpand<CR>', "Expand the class name", buffer = 0 },
      ['<leader>lcn'] = { ':PhpactorClassNew<CR>', "Create a new class", buffer = 0 },

      ['<leader>lx'] = { name = "+Extract" },
      ['<leader>lxm'] = { ':PhpactorExtractMethod<CR>', "Extract a new method", buffer = 0 },
      ['<leader>lxv'] = { ':PhpactorExtractExpression<CR>', "Extract to a variable", buffer = 0 },
      ['<leader>lxc'] = { ':PhpactorExtractConstant<CR>', "Extract a constant from a literal", buffer = 0 },
      -- ['<leader>lt'] = { ':call layers#php#alternate(expand("%@"))<CR>', "Alternate test file", buffer = 0 },
    })
  end,
}



