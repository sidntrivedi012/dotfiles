source ~/.config/nvim/conf-coc.vim

" ==============================================
" Generic configs
set number            " set numbers
set nowrap            " no wrapping please
set mouse=a           " ain't a Vimmer yet
set relativenumber
set ignorecase
set colorcolumn=80	" ship good code
set showcmd
filetype plugin on
filetype indent on
set showtabline=2     
set foldmethod=indent	" read them up
set nofoldenable  		" same as above
set encoding=UTF-8
set autoread
set hlsearch
set clipboard=unnamedplus
let mapleader = "\<Space>"              " set leader to space
let maplocalleader = "\<Space>\<Space>" " set local leader to space-space
" Scrolling
set scrolloff=10
set sidescrolloff=15
set sidescroll=1
set noswapfile
let g:session_autosave = 'yes'
let g:session_autoload = 'yes'
let g:session_default_to_last = 1
au BufNewFile,BufRead *.py
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set expandtab |
			\ set autoindent |
			\ set colorcolumn=80 |
			\ set fileformat=unix

au bufnewfile,bufread *.go
			\ set tabstop=4 |
			\ set shiftwidth=4 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix    

au bufnewfile,bufread *.c
			\ set tabstop=4 |
			\ set softtabstop=4 |
			\ set shiftwidth=4 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix

au BufNewFile,BufRead *.js,*.vue,*.html,*.css,*.yml,*.json,*.yaml
			\ set tabstop=2 |
			\ set softtabstop=2 |
			\ set shiftwidth=2 |
			\ set expandtab |
			\ set autoindent |
			\ set fileformat=unix

au BufRead,BufNewFile *.md setlocal textwidth=80
au BufRead,BufNewFile *.toml setlocal textwidth=80
" ==============================================

" ==============================================
" Indentation 
set smartindent
set smarttab
set shiftround
" ==============================================

" ==============================================
" PLUGINS
call plug#begin()

" Tooling
" sensible defaults
Plug 'tpope/vim-sensible'
" Displays function signatures from completions in the command line.
Plug 'Shougo/echodoc.vim'
" Automatic pairing of braces etc.
Plug 'jiangmiao/auto-pairs'
" Git on steroids
Plug 'tpope/vim-fugitive'
" Sorrounding everything with quotes etc
Plug 'tpope/vim-surround'                         " 
" Track changes in files and show diff
Plug 'airblade/vim-gitgutter'
" The file explorer
Plug 'preservim/nerdtree'
" Commenting for nerds
Plug 'preservim/nerdcommenter'
" The blue line visible downwards :/ 
Plug 'itchyny/lightline.vim'
" Shows the buffers above for each file
Plug 'mengelbrecht/lightline-bufferline'
" COC - The hella of a plugin
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']
" FZF - The powerful file finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" AESTHETICS
" Gruvbox colorscheme
Plug 'morhetz/gruvbox'
" Lines of Indentation (LOI) :P
Plug 'Yggdroot/indentLine'
" The file icons
Plug 'ryanoasis/vim-devicons'
" Show git diff in file explorer too
Plug 'Xuyuanp/nerdtree-git-plugin'

" LANGUAGE TOOLING
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-git'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'cespare/vim-toml'
Plug 'wakatime/vim-wakatime'
call plug#end()
" ==============================================

" ==============================================
" COLORS
set termguicolors           " nice 24 bit colors
syntax on                   " really needed
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme gruvbox
syntax on

" ==============================================

" ==============================================
" Disabling arrow keys ( God help me! )
map <left> <nop>
map <right> <nop>
map <up> <nop>
map <down> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
" ==============================================

" ==============================================
" USEFUL MAPPINGS

" disappear the highlight when done searching
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

" Buffer switching and closing
map <M-Left> :bp<CR>
map <M-Right> :bn<CR>
map <M-w> :bd<CR>
" ==============================================

" ==============================================
" ALE Settings
let g:ale_linters = {'python': ['flake8'], 'javascript': ['eslint']}
let g:ale_fixers = {'python': ['black'], 'javascript': ['prettier', 'eslint'], 'json': ['prettier'], 'rust': 'rustfmt'}
let g:ale_fix_on_save = 1
let g:ale_rust_cargo_use_clippy = 1
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
nmap <c-h> <c-w>h<c-w><Bar>
nmap <c-l> <c-w>l<c-w><Bar>
" ==============================================

" ==============================================
"Nerd tree
map <C-x> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" ==============================================


" ==============================================
" FZF Settings
nnoremap <C-p> :FZF<CR>
" ==============================================


" ==============================================
" LIGHTLINE Settings
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ }
      \ }
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#show_number = 1

" ==============================================


