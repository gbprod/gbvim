local php = {}

function php.plugins(use)
  use({ "tree-sitter/tree-sitter-php", run = ":TSInstall! php" })
  use({ "claytonrcarter/tree-sitter-phpdoc", run = ":TSInstall! phpdoc" })
  use({ "gbprod/tree-sitter-twig", run = ":TSInstall! twig" })
  -- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
  -- parser_config.twig = {
  --   install_info = {
  --     url = "~/workspace/tree-sitter-twig",
  --     files = { "src/parser.c" },
  --     branch = "main",
  --   },
  --   filetype = "twig",
  -- }

  use({
    "~/workspace/phpactor.nvim",
    run = require("phpactor.handler.update"),
    requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  })
  use({
    "~/workspace/php-enhanced-treesitter.nvim",
    requires = {
      { "derekstride/tree-sitter-sql",   run = ":TSInstall! sql" },
      { "tree-sitter/tree-sitter-regex", run = ":TSInstall! regex" },
    },
  })
end

function php.setup()
  require("phpactor").setup({
    install = {
      check_on_startup = "daily",
    },
    lspconfig = {
      options = {
        on_attach = require("usr.lsp").on_attach,
        capabilities = require("usr.lsp").make_capabilities(),
      },
    },
  })

  vim.g.PhpactorRootDirectoryStrategy = function()
    return vim.fn.getcwd()
  end

  local null_ls = require("null-ls")

  null_ls.register(null_ls.builtins.formatting.phpcsfixer.with({
    env = {
      PHP_CS_FIXER_IGNORE_ENV = true,
    },
    args = {
      "--no-interaction",
      "--quiet",
      "--config=/home/gilles/.config/phpcs/.php-cs-fixer.php",
      "fix",
      "$FILENAME",
    },
    runtime_condition = function(_)
      return require("usr.lsp").should_format()
    end,
  }))

  -- null_ls.register(null_ls.builtins.diagnostics.phpstan.with({
  --   condition = function(utils)
  --     return utils.root_has_file("phpstan.neon")
  --   end,
  -- }))

  -- null_ls.register(null_ls.builtins.diagnostics.psalm.with({
  --   condition = function(utils)
  --     return utils.root_has_file("psalm.xml")
  --   end,
  -- }))

  -- null_ls.register(null_ls.builtins.diagnostics.php)

  vim.cmd([[
  autocmd Filetype php setlocal textwidth=80
  autocmd Filetype php setlocal colorcolumn=+1,+41
  autocmd Filetype php :iabbrev ret return
  autocmd Filetype php :iabbrev pub public
  autocmd Filetype php :iabbrev pri private
  autocmd Filetype php :iabbrev pro protected
  autocmd Filetype php :iabbrev con const
  autocmd Filetype php :iabbrev thr throw
  autocmd Filetype php :iabbrev impl implements
  autocmd Filetype php :iabbrev ext extends
  autocmd Filetype php :iabbrev fun function
  autocmd Filetype php :iabbrev str string
  autocmd Filetype php :iabbrev rea readonly
  cnoreabbrev P PhpActor
  ]])
end

function php.on_ft()
  require("which-key").register({
    ["<leader>l"] = { name = "+Php" },
    ["<leader>li"] = {
      "<cmd>PhpActor import_class<CR>",
      "Import the name under the cusor",
      buffer = 0,
    },
    ["<leader>lI"] = {
      "<cmd>PhpActor import_missing_classes<CR>",
      "Attempt to import all non-resolvable classes",
      buffer = 0,
    },
    ["<leader>lm"] = {
      "<cmd>PhpActor context_menu<CR>",
      "show the context menu for the current cursor position",
      buffer = 0,
    },
    ["<leader>ln"] = { "<cmd>PhpActor navigate<CR>", "Navigate", buffer = 0 },
    ["<leader>lc"] = { name = "+Class" },
    ["<leader>lcc"] = {
      ":PhpActor copy_class<CR>",
      "Copy the current class",
      buffer = 0,
    },
    ["<leader>lcm"] = {
      ":PhpActor move_class<CR>",
      "Move the current class",
      buffer = 0,
    },
    ["<leader>lci"] = {
      "<cmd>PhpActor class_inflect<CR>",
      "Inflect a new class from the current class",
      buffer = 0,
    },
    ["<leader>lca"] = {
      "<cmd>PhpActor generate_accessors<CR>",
      "Generate accessors",
      buffer = 0,
    },
    ["<leader>lct"] = {
      "<cmd>PhpActor transform<CR>",
      "Show transform context menu",
      buffer = 0,
    },
    ["<leader>lce"] = {
      "<cmd>PhpActor class_expand<CR>",
      "Expand the class name",
      buffer = 0,
    },
    ["<leader>lcn"] = {
      "<cmd>PhpActor class_new<CR>",
      "Create a new class",
      buffer = 0,
    },
  }, { mode = "n" })
end

return php
