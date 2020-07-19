call plug#begin(expand('~/.vim/plugged'))
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'yggdroot/indentline'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'valloric/youcompleteme'
Plug 'mattn/emmet-vim'
call plug#end()

filetype plugin indent on
set encoding=utf-8
set fileformat=unix
set number

colorscheme nord
syntax on

set noshowmode
set laststatus=2
let g:lightline = {
	\ 'colorscheme': 'nord',
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '', 'right': '' },
	\ }

set splitright
set splitbelow

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <C-W>+ :resize +5<CR>
nnoremap <C-W>- :resize -5<CR>
nnoremap <C-W>< :vertical:resize -5<CR>
nnoremap <C-W>> :vertical:resize +5<CR>

let g:user_emmet_leader_key=','
let g:user_emmet_install_global=0
autocmd FileType html,css,javascript EmmetInstall

autocmd FileType javascript set tabstop=2 softtabstop=2 shiftwidth=2
autocmd FileType vim set tabstop=4 softtabstop=4 shiftwidth=4

autocmd FileType python nnoremap <F5> <Esc>:w<CR>:!clear;python3 %<CR>
