local php = {}

function php.plugins(use)
  use({
    "phpactor/phpactor",
    branch = "master",
    ft = "php",
    run = "composer install --no-dev -o && bin/phpactor extension:install phpactor/phpunit-extension",
  })
  use({ "tree-sitter/tree-sitter-php", run = ":TSInstall php" })
  use("nelsyeung/twig.vim")
  use("2072/PHP-Indenting-for-VIm")
end

function php.setup()
  require("open-related").add_relation(require("open-related.builtin.php").alternate_test_file.with({
    opts = {
      test_namespace_prefixes = { "Integration", "Unit" },
    },
  }))
  require("open-related").add_relation({
    filetypes = { "php" },
    related_to = require("open-related.helpers.filename").from_patterns({
      { match = "^(.*)src/(.*)%.php$", format = "%ssrc/%sHandler.php" },
      { match = "^(.*)src/(.*)Handler%.php$", format = "%ssrc/%s.php" },
    }),
  })

  require("lspconfig").phpactor.setup({
    cmd = {
      require("packer").config.package_root .. "/packer/opt/phpactor/bin/phpactor",
      "language-server",
    },
    on_attach = require("lsp").on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  })

  vim.g.PhpactorRootDirectoryStrategy = function()
    return vim.fn.getcwd()
  end

  local null_ls = require("null-ls")

  null_ls.register(null_ls.builtins.formatting.phpcsfixer.with({
    args = {
      "--no-interaction",
      "--quiet",
      "--config=/home/gilles/.config/phpcs/.php-cs-fixer.php",
      "fix",
      "$FILENAME",
    },
    runtime_condition = function(_)
      return vim.b.should_format == nil or vim.b.should_format == true
    end,
  }))

  null_ls.register(null_ls.builtins.diagnostics.phpstan.with({
    condition = function(utils)
      return utils.root_has_file("phpstan.neon")
    end,
  }))

  null_ls.register(null_ls.builtins.diagnostics.psalm)

  null_ls.register(null_ls.builtins.diagnostics.php)

  vim.g.PHP_noArrowMatching = 1
  vim.g.PHP_vintage_case_default_indent = 1

  vim.cmd([[
  autocmd Filetype php :iabbrev ret return
  autocmd Filetype php :iabbrev pub public
  autocmd Filetype php :iabbrev pri private
  autocmd Filetype php :iabbrev pro protected
  autocmd Filetype php :iabbrev con const
  autocmd Filetype php :iabbrev thr throw
  ]])
end

function php.on_ft()
  vim.opt.textwidth = 80
  vim.opt.colorcolumn = { "+1", "+41" }

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
  })
end

return php
