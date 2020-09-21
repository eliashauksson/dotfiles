call plug#begin('~/.local/share/nvim/plugged')
Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
call plug#end()

filetype plugin indent on
set encoding=utf-8
set fileformat=unix
set number

syntax on
colorscheme nord

let g:lightline = {
	\ 'colorscheme': 'nord',
	\ }

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set autoindent

set splitright
set splitbelow

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:deoplete#enable_at_startup = 1

nnoremap <F5> <Esc>:w<CR>:!clear;python3 %<CR>
