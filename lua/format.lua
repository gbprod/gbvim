local layer = {}

layer.plugins = function(use)
  use 'mhartington/formatter.nvim'
end

layer.setup = function()
  vim.api.nvim_exec([[
    augroup FormatAutogroup
      autocmd!
      autocmd BufWritePost * silent! FormatWrite
    augroup END
  ]], true)
end

return layer

