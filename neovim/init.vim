source ~/.config/nvim/conf-coc.vim

" ==============================================
" Generic configs
set number            " set numbers
set nowrap            " no wrapping please
set mouse=a           " ain't a Vimmer yet
set relativenumber
set ignorecase
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
autocmd BufWritePre * :%s/\s\+$//e
if has('persistent_undo')      "check if your vim version supports it
  set undofile                 "turn on the feature
  set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
  endif
" ==============================================

" Indentation
set smartindent
set smarttab
set shiftround

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
" FZF - The powerful file finder
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" All Language packs in one plugin.
Plug 'sheerun/vim-polyglot'
" Linting and checking syntax asynchronously
Plug 'dense-analysis/ale'

" AESTHETICS
" Molokai colorscheme
Plug 'fatih/molokai'
" Lines of Indentation (LOI) :P
Plug 'Yggdroot/indentLine'
" The colored file icons
Plug 'kyazdani42/nvim-web-devicons'
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
" COLORS
set termguicolors           " nice 24 bit colors
syntax on                   " really needed
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
let g:one_allow_italics = 1
colorscheme molokai
syntax on


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
" USEFUL MAPPINGS

" FZF Settings
" nnoremap <Leader>p :FZF<CR>
nnoremap <Leader>p :Files<CR>
" Tags based searching
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>

" disappear the highlight when done searching
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
map <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

" Buffer switching and closing
map <M-Left> :bp<CR>
map <M-Right> :bn<CR>
map <M-w> :bd<CR>

" ==============================================
" ALE Settings
let g:ale_linters = {'python': ['flake8'], 'javascript': ['eslint','tsserver']}
let g:ale_fixers = {'python': ['black'], 'javascript': ['prettier', 'eslint'], 'json': ['prettier'], 'rust': 'rustfmt','html': ['prettier']}
let g:ale_fix_on_save = 1
let g:ale_rust_cargo_use_clippy = 1
nnoremap ]c :ALENextWrap<CR>
nnoremap [c :ALEPreviousWrap<CR>
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:indentLine_fileTypeExclude = ['markdown']

" ==============================================
"Nerd tree
map <Leader>g :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" ==============================================

" LIGHTLINE Settings
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ],
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#show_number = 1
let g:lightline#bufferline#enable_nerdfont = 1
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#filename_modifier = ':t'

" ==============================================

" NERDCommenter
let g:NERDSpaceDelims = 1         " add spaces after comment delimiters
let g:NERDCompactSexyComs = 1     " use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'   " align line-wise comment delimiters flush left instead of following code indentation

" ==============================================
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright
