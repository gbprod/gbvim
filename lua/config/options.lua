vim.opt.relativenumber = false
vim.g.lazyvim_picker = "snacks"

vim.diagnostic.config({
  float = {
    show_header = true,
    source = true,
    border = "single",
    focusable = false,
  },
})

vim.cmd([[ let &clipboard = "unnamed,unnamedplus" ]])

vim.cmd([[
  cnoreabbrev P PhpActor
  cnoreabbrev G Genghis
  cnoreabbrev N Neotree
  cnoreabbrev h vertical help
  cnoreabbrev qa confirm qa
  cnoreabbrev q confirm q
  cnoreabbrev hi highlight
]])

vim.g.root_spec = { "lsp", "cwd", { ".git", "lua" } }
