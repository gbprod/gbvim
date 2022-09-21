local yaml = {}

function yaml.on_ft()
  vim.api.nvim_set_hl(0, "TSField", { link = "TSType" })
end

return yaml
