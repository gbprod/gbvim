function! layers#defaults#config() abort
  let g:mapleader=','
  let g:loaded_netrwPlugin = 1

  autocmd VimEnter * if isdirectory(expand('%:p:h')) | cd %:p:h | endif

  set backspace=indent,eol,start
  set nrformats-=octal
  set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
  set fillchars=vert:│,fold:·

  set cursorline
  set guicursor=n-v-c:block-blinkon10,i-ci-ve:ver25-blinkon10,r-cr:hor20,o:hor50
  set relativenumber
  set termguicolors
  set laststatus=2
  set showcmd
  set autoindent
  set smartindent
  set cindent
  set wildmenu
  set wildmode=longest:full,full
  set linebreak
  set number
  set autoread

  set backup
  set undofile
  set undolevels=1000
  let g:data_dir = '/home/gilles/cache/gbvim/'
  let g:backup_dir = g:data_dir . 'backup'
  let g:swap_dir = g:data_dir . 'swap'
  let g:undo_dir = g:data_dir . 'undofile'
  let g:conf_dir = g:data_dir . 'conf'
  if finddir(g:data_dir) ==# ''
    silent call mkdir(g:data_dir, 'p', 0700)
  endif
  if finddir(g:backup_dir) ==# ''
    silent call mkdir(g:backup_dir, 'p', 0700)
  endif
  if finddir(g:swap_dir) ==# ''
    silent call mkdir(g:swap_dir, 'p', 0700)
  endif
  if finddir(g:undo_dir) ==# ''
    silent call mkdir(g:undo_dir, 'p', 0700)
  endif
  if finddir(g:conf_dir) ==# ''
    silent call mkdir(g:conf_dir, 'p', 0700)
  endif
  let &undodir = g:undo_dir
  let &backupdir = g:backup_dir
  let &directory = g:swap_dir
  unlet g:backup_dir
  unlet g:swap_dir
  unlet g:undo_dir
  unlet g:conf_dir

  set nowritebackup
  set matchtime=0
  set ruler
  set showmatch
  set showmode
  set completeopt=menu,menuone,longest
  set complete=.,w,b,u,t
  set pumheight=15
  set scrolloff=4
  set sidescrolloff=5
  set display+=lastline
  set incsearch
  set hlsearch
  set wildignorecase
  set mouse=nv
  set hidden
  set ttimeout
  set ttimeoutlen=50
  set shortmess+=c
  set shortmess+=s
  set nowrap
  set conceallevel=0
  set title
endfunction
