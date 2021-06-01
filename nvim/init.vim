call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
Plug 'lervag/vimtex'
Plug 'SirVer/ultisnips'
call plug#end()

filetype plugin indent on

let mapleader = ','

set number
set noshowmode
set noswapfile

set splitbelow
set splitright

" Colorscheme
colorscheme gruvbox
let g:lightline = {
	\ 'colorscheme': 'gruvbox',
	\}

" Autocompletion
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
au InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
call deoplete#custom#var('omni', 'input_patterns', {
	\ 'tex': g:vimtex#re#deoplete
	\})

" Python
au BufWritePre *.py Neoformat
let g:neomake_python_enabled_makers = ['flake8']
call neomake#configure#automake('nrwi', 500)

" Latex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0
set conceallevel=1
let g:tex_conceal = 'abdmg'
au BufWritePre *.tex call vimtex#toc#refresh()

" Snippets
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Indentation
set sw=4 sts=4 ts=4
au FileType yaml,tex,html,css,javascript,json setl sw=2 sts=2 ts=2

" Navigation
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>
nmap <C-h> <C-w><C-h>
