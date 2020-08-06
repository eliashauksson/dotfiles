call plug#begin(expand('~/.vim/plugged'))
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/syntastic'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()

filetype plugin indent on
set encoding=utf-8
set fileformat=unix
set number
set nowrap
set scrolloff=5

colorscheme nord
syntax on

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-G> :Goyo<CR>:Limelight!!<CR>

autocmd FileType vim,sh,py set tabstop=4 softtabstop=4 shiftwidth=4

autocmd FileType markdown set cursorline

set noshowmode
set laststatus=2
let g:lightline={
	\ 'colorscheme': 'nord',
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '', 'right': '' },
	\ }

let g:kite_auto_complete=1
let g:kite_tab_complete=1

let g:limelight_conceal_ctermfg='gray'
let g:limelight_default_coefficient=0.7

let g:vim_markdown_folding_disabled=1
set conceallevel=2
