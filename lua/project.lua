return {
  setup = function()
    vim.cmd([[
    autocmd VimEnter * lua require('project').load()
    ]])
  end,

  load = function()
    if vim.fn.filereadable(".project.lua") == 1 then
      vim.cmd("source .project.lua")
    end
  end,
}
