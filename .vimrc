call plug#begin(expand('~/.vim/plugged'))
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/syntastic'
Plug 'mattn/emmet-vim'
Plug 'Yggdroot/indentLine'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
call plug#end()

filetype plugin indent on
set encoding=utf-8
set fileformat=unix
set number
set nowrap
set scrolloff=5
set expandtab
set colorcolumn=80
colorscheme nord
syntax on

set splitright
set splitbelow

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-G> :Goyo<CR>:Limelight!!<CR>

autocmd FileType vim,sh,py set tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType html,css set tabstop=2 softtabstop=2 shiftwidth=2

set noshowmode
set laststatus=2
let g:lightline={
	\ 'colorscheme': 'nord',
	\ 'separator': { 'left': '', 'right': '' },
	\ 'subseparator': { 'left': '', 'right': '' },
	\ }

let g:kite_auto_complete=1
let g:kite_tab_complete=1

let g:user_emmet_leader_key=','
let g:user_emmet_install_global=0
autocmd FileType html,css EmmetInstall

let g:limelight_conceal_ctermfg='gray'
