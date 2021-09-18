return {
  plugins = function(use)
    use({ "ikatyang/tree-sitter-yaml", run = ":TSInstall yaml" })
  end,
}
