call plug#begin('~/.local/share/nvim/plugged')
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-clang'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'lervag/vimtex'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'mattn/emmet-vim'
Plug 'yggdroot/indentLine'
Plug 'godlygeek/tabular'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
call plug#end()

filetype plugin indent on

let mapleader = ','

set number
set noshowmode
set noswapfile
set expandtab

set splitbelow
set splitright

colorscheme gruvbox

" Lightline
set showtabline=2
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
let g:lightline.tabline = {'left': [['buffers']], 'right': [[]]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type = {'buffers': 'tabsel'}
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#unnamed = '[No Name]'

" Autocompletion
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#jedi#show_docstring = 1
au InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
call deoplete#custom#var('omni', 'input_patterns', {
	\ 'tex': g:vimtex#re#deoplete
	\ })

" Linting
let g:ale_linters = {
    \ 'python': ['flake8'],
    \ 'vim': ['vint'],
    \ 'cpp': ['clang'],
    \ 'c': ['clang']
    \ }

" C++
let g:neoformat_cpp_clangformat = {
    \ 'exe': 'clang-format',
    \ 'args': ['--style="{IndentWidth: 4}"']
    \ }
let g:neoformat_enabled_cpp = ['clangformat']
let g:neoformat_enabled_c = ['clangformat']

" Python
au BufWritePre *.py Neoformat
let g:neomake_python_enabled_makers = ['flake8']
let g:python3_host_prog = '/usr/bin/python3'

" Latex
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_mode = 0
set conceallevel=1
let g:tex_conceal = 'abdmg'
au BufWritePre *.tex call vimtex#toc#refresh()

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_frontmatter = 0
let g:vim_markdown_toml_frontmatter = 0
let g:vim_markdown_json_frontmatter = 0
let g:mkdp_auto_close = 0

" html & css
let g:user_emmet_leader_key = ','
let g:user_emmet_install_global = 0
au FileType html,htmldjango,css EmmetInstall
au BufWritePre *.html Neoformat jsbeautify

" Snippets
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Indentation
set sw=4 sts=4 ts=4
au FileType yaml,tex,html,htmldjango,css,javascript,json setl sw=2 sts=2 ts=2

" Navigation
nmap <C-j> <C-w><C-j>
nmap <C-k> <C-w><C-k>
nmap <C-l> <C-w><C-l>
nmap <C-h> <C-w><C-h>

tnoremap <Esc> <C-\><C-n>
