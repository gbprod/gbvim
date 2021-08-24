local layer = {}

layer.plugins = function(use)
end

layer.setup = function()
  vim.g.mapleader = " "

  local opt = vim.opt

  opt.cursorline = true
  opt.number = true
  opt.numberwidth = 2
  opt.relativenumber = true
  opt.termguicolors = true
  opt.laststatus = 2
  opt.showcmd = true
  opt.autoindent = true
  opt.smartindent = true
  opt.cindent = true
  opt.wildmenu = true
  opt.wildmode = "longest:full,full"
  opt.linebreak = true
  opt.autoread = true
  opt.expandtab = true
  opt.showmatch = true
  opt.showmode = true
  opt.completeopt = "menu,menuone,longest"
  opt.complete = ".,w,b,u,t,k"
  opt.pumheight = 15
  opt.scrolloff = 4
  opt.sidescrolloff = 5
  opt.display = "lastline,msgsep"
  opt.incsearch = true
  opt.hlsearch = true
  opt.wildignorecase = true
  opt.mouse = "a"
  opt.hidden = true
  opt.ttimeout = true
  opt.ttimeoutlen = 50
  opt.wrap = false
  opt.conceallevel = 2
  opt.title = true
  opt.undofile = true
end

layer.bindings = function(map)
end

return layer
