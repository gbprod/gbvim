local json = {}

function json.plugins(use)
  use({ "tree-sitter/tree-sitter-json", run = ":TSInstall json" })
end

return json
