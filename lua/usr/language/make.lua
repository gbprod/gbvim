local make = {}

function make.plugins(use)
  use({ "alemuller/tree-sitter-make", run = ":TSInstall! make" })
end

return make
