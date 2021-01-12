function! layers#filetree#plugins() abort
  if has('python3')
    Plug 'shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'kristijanhusak/defx-git'
    Plug 'kristijanhusak/defx-icons'
  else
    Plug 'ryanoasis/vim-devicons'
    Plug 'preservim/nerdtree'
  endif
endfunction

function! layers#filetree#config() abort
  if has('python3')
    call s:defx_options()
    autocmd FileType defx call s:defx_setup()
    " Open filetree if open a folder or nothing
    autocmd VimEnter * if isdirectory(expand('%:p')) || 0 ==# argc() | Defx | wincmd l | endif
  endif
endfunction

function! s:defx_options() abort
  call defx#custom#option('_', {
    \ 'columns': 'indent:mark:git:icons:filename:type:size:time',
    \ 'winwidth': 40,
    \ 'split': 'vertical',
    \ 'direction': 'leftabove',
    \ 'show_ignored_files': 1,
    \ 'buffer_name': '',
    \ 'toggle': 1,
    \ 'resume': 1
    \ })

  call defx#custom#column('mark', {
    \ 'readonly_icon': '',
    \ 'selected_icon': '',
    \ })

  call defx#custom#column('filename', {
    \ 'max_width': -90,
    \ })

  call defx#custom#column('git', 'indicators', {
    \ 'Modified'  : '~',
    \ 'Staged'    : '+',
    \ 'Untracked' : '*',
    \ 'Renamed'   : '➜',
    \ 'Unmerged'  : '═',
    \ 'Ignored'   : ' ',
    \ 'Deleted'   : 'x',
    \ 'Unknown'   : '?'
    \ })

  autocmd BufEnter * nested if
    \ (!has('vim_starting') && winnr('$') == 1
    \ && &filetype ==# 'defx') |
    \ q | endif
endfunction

function! s:defx_setup() abort
  nnoremap <silent><buffer><expr> <CR>
    \  defx#is_directory()
    \ ? defx#do_action('open_tree', 'toggle')
    \ : defx#do_action('drop')
  nnoremap <silent><buffer><expr> c
    \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
    \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
    \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> o
    \ defx#do_action('open')
  nnoremap <silent><buffer><expr> v
    \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
    \ defx#do_action('search', fnamemodify(defx#get_candidate().action__path, ':h'))
  nnoremap <silent><buffer><expr> K
    \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
    \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
    \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> S
    \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
    \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
    \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
    \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
    \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
    \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> I
    \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> .
    \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
    \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
    \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
    \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> t
    \ defx#do_action('toggle_select')
  nnoremap <silent><buffer><expr> *
    \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
    \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
    \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
    \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
    \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
    \ defx#do_action('change_vim_cwd')
endfunction

function! layers#filetree#bindings() abort
  let g:leader_key_map.f.o = 'Reveal in filtree'
  if has('python3')
    nnoremap <silent> <F3> :Defx<Cr>
    nnoremap <leader>fo :Defx -no-toggle -search=`expand('%:p')`<CR>
  else
    nnoremap <silent> <F3> :NERDTreeToggle<CR>
    nnoremap <leader>fo :NERDTreeFind<CR>
  endif
endfunction

