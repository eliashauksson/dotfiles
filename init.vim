let g:plugged_home = '~/.local/share/nvim/plugged'
let g:python3_host_prog='~/Development/anaconda3/envs/pynvim/bin/python'

call plug#begin(g:plugged_home)
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'

Plug 'sbdchd/neoformat'
Plug 'w0rp/ale'

Plug 'jiangmiao/auto-pairs'

Plug 'scrooloose/nerdcommenter'

Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-clojure-static'
Plug 'luochen1990/rainbow'
Plug 'Olical/conjure'
call plug#end()

filetype plugin indent on

let mapleader = ','
let maplocalleader = ','

set number
set noshowmode
set noswapfile
set title

set splitbelow
set splitright

colorscheme nord
let g:lightline = {
	\ 'colorscheme': 'nord',
	\ }
let g:rainbow_active = 1
let g:rainbow_conf = {
\	'separately': {
\		'*': 0,
\		'clojure': {}
\	}
\ }

nmap <Leader>bf :buffers<CR>:buffer

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

au FileType python,vim setl sw=4 sts=4 ts=4

let g:deoplete#enable_at_startup = 1

au BufWritePre *.py Neoformat

let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
	\ 'python': ['flake8'],
	\ 'clojure': ['clj-kondo', 'joker']
	\ }
