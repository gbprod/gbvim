return {
  plugins = function(use)
    use({
      "phpactor/phpactor",
      branch = "master",
      ft = "php",
      run = "composer install --no-dev -o && bin/phpactor extension:install phpactor/phpunit-extension",
    })
    use({ "tree-sitter/tree-sitter-php", run = ":TSInstall php" })
    use("nelsyeung/twig.vim")
    use("2072/PHP-Indenting-for-VIm")
  end,

  setup = function()
    require("lspconfig").phpactor.setup({
      cmd = {
        require("packer").config.package_root
          .. "/packer/opt/phpactor/bin/phpactor",
        "language-server",
      },
      on_attach = require("lsp").on_attach,
      flags = {
        debounce_text_changes = 150,
      },
    })

    local null_ls = require("null-ls")

    null_ls.register(null_ls.builtins.diagnostics.phpstan.with({
      condition = function(utils)
        return utils.root_has_file("phpstan.neon")
      end,
    }))

    null_ls.register(null_ls.builtins.diagnostics.psalm.with({
      condition = function(utils)
        return utils.root_has_file("psalm.xml")
      end,
    }))

    null_ls.register(null_ls.builtins.formatting.phpcsfixer.with({
      args = {
        "--no-interaction",
        "--quiet",
        "--config=/home/gilles/.config/phpcs/.php-cs-fixer.php",
        "fix",
        "$FILENAME",
      },
    }))

    vim.g.PHP_noArrowMatching = 1
    vim.g.PHP_vintage_case_default_indent = 1
  end,

  on_ft = function()
    vim.opt.colorcolumn = { "80", "120" }

    require("which-key").register({
      ["<leader>l"] = { name = "+Php" },
      ["<leader>li"] = {
        ":PhpactorImportClass<CR>",
        "Import the name under the cusor",
        buffer = 0,
      },
      ["<leader>lI"] = {
        ":PhpactorImportMissingClasses<CR>",
        "Attempt to import all non-resolvable classes",
        buffer = 0,
      },
      ["<leader>lm"] = {
        ":PhpactorContextMenu<CR>",
        "show the context menu for the current cursor position",
        buffer = 0,
      },
      ["<leader>lr"] = {
        ":PhpactorFindReferences<CR>",
        "Attempt to find all references",
        buffer = 0,
      },
      ["<leader>ln"] = { ":PhpactorNavigate<CR>", "Navigate", buffer = 0 },
      ["<leader>lv"] = {
        ":PhpactorChangeVisibility<CR>",
        "Rotate visiblity",
        buffer = 0,
      },

      ["<leader>lf"] = { name = "+File" },
      ["<leader>lfc"] = {
        ":PhpactorCopyFile<CR>",
        "Copy the current file",
        buffer = 0,
      },
      ["<leader>lfm"] = {
        ":PhpactorMoveFile<CR>",
        "Move the current file",
        buffer = 0,
      },

      ["<leader>lc"] = { name = "+Class" },
      ["<leader>lci"] = {
        ":PhpactorClassInflect<CR>",
        "Inflect a new class from the current class",
        buffer = 0,
      },
      ["<leader>lca"] = {
        ":PhpactorGenerateAccessors<CR>",
        "Generate accessors",
        buffer = 0,
      },
      ["<leader>lct"] = {
        ":PhpactorTransform<CR>",
        "Show transform context menu",
        buffer = 0,
      },
      ["<leader>lce"] = {
        ":PhpactorClassExpand<CR>",
        "Expand the class name",
        buffer = 0,
      },
      ["<leader>lcn"] = {
        ":PhpactorClassNew<CR>",
        "Create a new class",
        buffer = 0,
      },

      ["<leader>lx"] = { name = "+Extract" },
      ["<leader>lxm"] = {
        ":PhpactorExtractMethod<CR>",
        "Extract a new method",
        buffer = 0,
      },
      ["<leader>lxv"] = {
        ":PhpactorExtractExpression<CR>",
        "Extract to a variable",
        buffer = 0,
      },
      ["<leader>lxc"] = {
        ":PhpactorExtractConstant<CR>",
        "Extract a constant from a literal",
        buffer = 0,
      },
      -- ['<leader>lt'] = { ':call layers#php#alternate(expand("%@"))<CR>', "Alternate test file", buffer = 0 },
    })
  end,
}
