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
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'mattn/emmet-vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()

" Turn on Filetype 
filetype plugin indent on

" visual
set number
set noshowmode

" Splits
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

" Terminal
function! OpenTerminal()
  split term://bash
  resize 10
endfunction

nnoremap <c-n> :call OpenTerminal()<CR>

"Emmet
let g:user_emmet_leader_key=','
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1

autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Keybindings
let mapleader = ','
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <M-j> 3<C-w>-
nnoremap <M-k> 3<C-w>+
nnoremap <M-h> 3<C-w><
nnoremap <M-l> 3<C-w>>
tnoremap <Esc> <C-\><C-n>
nnoremap <C-b> :NERDTreeToggle<CR>
