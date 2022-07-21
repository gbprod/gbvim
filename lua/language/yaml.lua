local yaml = {}

function yaml.setup()
  vim.api.nvim_set_hl(0, "yamlBlockMappingKey", { link = "TSType" })

  vim.cmd([[
  autocmd Filetype yaml,yml setlocal cursorcolumn
  ]])
end

return yaml
