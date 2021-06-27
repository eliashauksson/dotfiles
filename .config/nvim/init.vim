" Plugins
call plug#begin('~/.local/share/nvim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
call plug#end()

" Turn on Filetype 
filetype plugin indent on

" Other stuff
set number
set noshowmode

set splitbelow
set splitright

" Colors
colorscheme nord
let g:lightline = {}
let g:lightline.colorscheme = 'nord'

" Indentation
set expandtab
set sw=4 sts=4 ts=4
au FileType html,htmldjango,css,javascript,tex,yaml,json setl sw=2 sts=2 ts=2

" Code checking
let g:neomake_python_enabled_makers = ['flake8']
call neomake#configure#automake('nrwi', 500)

" Autocompletion
let g:deoplete#enable_at_startup = 1

" Autoformat
au BufWritePre *.py Neoformat yapf

" Keybindings
let mapleader = ','
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>
nmap <C-h> <C-w><C-h>
tnoremap <Esc> <C-\><C-n>
