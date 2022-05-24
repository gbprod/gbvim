local project = {}

function project.setup()
  vim.cmd([[
    autocmd VimEnter * lua require('project').load()
    ]])
end

function project.load()
  if vim.fn.filereadable(".project.lua") == 1 then
    vim.cmd("source .project.lua")
  end
end

return project
