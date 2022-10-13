local markdown = {}

function markdown.plugins(use)
  use({ "MDeiml/tree-sitter-markdown", run = ":TSInstall! markdown markdown_inline" })
end

function markdown.on_ft()
  vim.opt.conceallevel = 0
end

return markdown
