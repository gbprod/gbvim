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
