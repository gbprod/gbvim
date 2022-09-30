local options = {}

function options.setup()
  vim.g.mapleader = " "

  vim.opt.cursorline = true
  vim.opt.number = true
  vim.opt.numberwidth = 2
  vim.opt.relativenumber = true
  vim.opt.termguicolors = true
  vim.opt.laststatus = 2
  vim.opt.showcmd = true
  vim.opt.autoindent = true
  vim.opt.smartindent = true
  vim.opt.cindent = true
  vim.opt.wildmenu = true
  vim.opt.wildmode = "longest:full,full"
  vim.opt.linebreak = true
  vim.opt.autoread = true
  vim.opt.expandtab = true
  vim.opt.showmatch = false
  vim.opt.showmode = true
  vim.opt.completeopt = "menu,menuone,noselect"
  vim.opt.complete = ".,w,b,u,t,k"
  vim.opt.pumheight = 15
  vim.opt.scrolloff = 4
  vim.opt.sidescrolloff = 5
  vim.opt.display = "lastline,msgsep"
  vim.opt.incsearch = true
  vim.opt.hlsearch = true
  vim.opt.wildignorecase = true
  vim.opt.mouse = "a"
  vim.opt.hidden = true
  vim.opt.ttimeout = true
  vim.opt.ttimeoutlen = 50
  vim.opt.wrap = false
  vim.opt.conceallevel = 2
  vim.opt.title = true
  vim.opt.undofile = true
  vim.opt.signcolumn = "yes"
  vim.opt.shiftround = true
  vim.opt.tabstop = 4
  vim.opt.softtabstop = 4
  vim.opt.shiftwidth = 4
  vim.opt.expandtab = true

  vim.o.confirm = true
end

return options