let g:plugged_home = '~/.local/share/nvim/plugged'
let g:python3_host_prog='~/Development/anaconda3/envs/pynvim/bin/python'

call plug#begin(g:plugged_home)
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'google/yapf'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
call plug#end()

filetype plugin indent on

let mapleader = ','

if has('termguicolors')
	set termguicolors
endif

colorscheme nord
set number
set noshowmode
set noswapfile
set title

set splitbelow
set splitright

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

au BufWritePre *.py 0,$!yapf

au FileType python setl sw=4 sts=4 ts=4
au FileType yaml setl sw=2 sts=2 ts=2

nmap <Leader>b :buffers<CR>:buffer

nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>
nmap <C-h> <C-w><C-h>
imap <C-j> <C-\><C-n><C-w><C-j>
imap <C-k> <C-\><C-n><C-w><C-k>
imap <C-l> <C-\><C-n><C-w><C-l>
imap <C-h> <C-\><C-n><C-w><C-h>
tmap <C-j> <C-\><C-n><C-w><C-j>
tmap <C-k> <C-\><C-n><C-w><C-k>
tmap <C-l> <C-\><C-n><C-w><C-l>
tmap <C-h> <C-\><C-n><C-w><C-h>

nmap <M-j> 3<C-w>-
nmap <M-k> 3<C-w>+
nmap <M-l> 3<C-w>>
nmap <M-h> 3<C-w><

tmap <Esc> <C-\><C-n>  

let g:lightline = {
	\ 'colorscheme': 'nord',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'cocstatus': 'coc#status'
    \ },
    \ }

let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}

let g:deoplete#enable_at_startup = 1
