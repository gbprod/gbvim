local yaml = {}

function yaml.setup()
  vim.highlight.link("yamlBlockMappingKey", "TSType", true)
end

return yaml
