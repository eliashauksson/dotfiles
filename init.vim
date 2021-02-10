let g:plugged_home = '~/.local/share/nvim/plugged'

call plug#begin(g:plugged_home)
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'w0rp/ale'
Plug 'sbdchd/neoformat'
Plug 'vim-python/python-syntax'
Plug 'Olical/conjure'
Plug 'luochen1990/rainbow'
Plug 'guns/vim-clojure-highlight'
Plug 'guns/vim-clojure-static'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
call plug#end()

filetype plugin indent on

let mapleader = ','
let maplocalleader = ','

set number
set noshowmode
set noswapfile

set splitbelow
set splitright

colorscheme nord

let g:lightline = {
\	'colorscheme': 'nord',
\}

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

let g:limelight_conceal_ctermfg = 240

let g:vim_markdown_folding_disabled = 1

let g:mkdp_auto_close = 0

let g:deoplete#enable_at_startup = 1

let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {
\	'python': ['flake8'],
\	'clojure': ['clj-kondo'],
\}

au BufWritePre *.py Neoformat

let g:python_highlight_all = 1

let g:rainbow_active = 0

set sw=4 sts=4 ts=4
au FileType python,vim,markdown setl sw=4 sts=4 ts=4
au FileType yaml,tex setl sw=2 sts=2 ts=2

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

nmap <Leader>bf :buffers<CR>:buffer
nmap <Leader>r :RainbowToggle<CR>

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

nmap <S-j> 3<C-w>-
nmap <S-k> 3<C-w>+
nmap <S-l> 3<C-w>>
nmap <S-h> 3<C-w><
