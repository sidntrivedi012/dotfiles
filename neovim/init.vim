source ~/.config/nvim/conf-coc.vim

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

" Some indentation
set smartindent
set smarttab
set shiftround

" My Beloved Packages
call plug#begin()

" Tooling
Plug 'tpope/vim-sensible'                         " sensible defaults
" Print function signatures in echo area
Plug 'Shougo/echodoc.vim'
" Plug 'tpope/vim-fugitive'                       " for git (not needed now)
Plug 'tpope/vim-surround'                         " 
Plug 'airblade/vim-gitgutter'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier']
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'dense-analysis/ale'
Plug 'edkolev/tmuxline.vim'
" AESTHETICS
Plug 'morhetz/gruvbox'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
" LANGUAGE
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-git'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'wakatime/vim-wakatime'
call plug#end()

" Colors, schemes
set termguicolors           " nice 24 bit colors
syntax on                   " really needed
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
colorscheme gruvbox
" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
syntax on
set splitbelow
set splitright

" disabling arrow keys ( God help me! )
map <left> <nop>
map <right> <nop>
map <up> <nop>
map <down> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" disappear the highlight when done searching
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Buffer switching and closing
map <M-Left> :bp<CR>
map <M-Right> :bn<CR>
map <M-w> :bd<CR>

" tmuxline
let g:tmuxline_preset = 'full'
nnoremap <C-p> :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

let g:ale_linters = {'python': ['flake8'], 'javascript': ['eslint']}
let g:ale_fixers = {'python': ['black'], 'javascript': ['prettier', 'eslint'], 'json': ['prettier'], 'rust': 'rustfmt'}
let g:ale_fix_on_save = 1
let g:ale_rust_cargo_use_clippy = 1
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
let g:ale_sign_error = '‚ùå'
let g:ale_sign_warning = '‚ö†Ô∏è'
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
nmap <c-h> <c-w>h<c-w><Bar>
nmap <c-l> <c-w>l<c-w><Bar>


" Nerd tree
map <C-x> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

