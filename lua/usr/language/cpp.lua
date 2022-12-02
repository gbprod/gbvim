local cpp = {}

function cpp.plugins(use)
  use({ "tree-sitter/tree-sitter-cpp", run = ":TSInstall! cpp" })
  use({ "tree-sitter/tree-sitter-c", run = ":TSInstall! c" })
end

function cpp.setup()
  local null_ls = require("null-ls")
  null_ls.register(null_ls.builtins.formatting.clang_format)
end

return cpp
