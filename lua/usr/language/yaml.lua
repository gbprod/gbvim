local yaml = {}

function yaml.setup()
  vim.api.nvim_set_hl(0, "yamlBlockMappingKey", { link = "TSType" })
end

return yaml
