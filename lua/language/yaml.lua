local yaml = {}

function yaml.setup()
  vim.highlight.link("yamlBlockMappingKey", "TSType", true)

  vim.cmd([[
  autocmd Filetype yaml,yml setlocal cursorcolumn
  ]])
end

return yaml
