" ==============================================
" Generic configs
set number            " set numbers
set hidden
set nowrap            " no wrapping please
set mouse=a           " ain't a Vimmer yet
set relativenumber
set ignorecase
set showcmd
set showmatch
filetype plugin on
filetype indent on
set showtabline=2
set foldmethod=indent	" read them up
set nofoldenable  		" same as above
set encoding=UTF-8
set autoread
set hlsearch
" Don't hide the conceal features in markdownt
set conceallevel=0
set nocompatible
set clipboard=unnamedplus
let mapleader = ","              " set leader to comma
let maplocalleader = "," 	" set local leader to ,
" Scrolling
set scrolloff=10
set sidescrolloff=15
set sidescroll=1
set noswapfile
set splitbelow
set splitright

let g:session_autosave = 'yes'
let g:session_utoload = 'yes'
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

au BufNewFile,BufRead *.js,*.vue,*.html,*.css,*.yml,*.json
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

" add yaml stuffs
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" ==============================================
" PLUGINS

call plug#begin()
" sensible defaults
Plug 'tpope/vim-sensible'
" Git on steroids
Plug 'tpope/vim-fugitive'
" Sorrounding everything with quotes etc
Plug 'tpope/vim-surround'                         "
Plug 'tpope/vim-repeat'
"Automatic pairing brackets etc.
Plug 'jiangmiao/auto-pairs'
" Track changes in files and show diff
Plug 'airblade/vim-gitgutter'
" The file explorer
" Commenting for nerds
Plug 'preservim/nerdcommenter'
" The blue line visible downwards :/
Plug 'itchyny/lightline.vim'
" FZF - The powerful file finder
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Directory tree
Plug 'kyazdani42/nvim-tree.lua'
Plug 'lukas-reineke/indent-blankline.nvim'

" AESTHETICS
Plug 'gruvbox-community/gruvbox'
" The colored file icons
Plug 'kyazdani42/nvim-web-devicons'
" Improved bufferline, using barbar until it works
Plug 'romgrk/barbar.nvim'
" Telescope for the intuitive UI of file finding etc.
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'f-person/git-blame.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LANGUAGE TOOLING
" Amazing Neovim LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'onsails/lspkind-nvim'

Plug 'golang/vscode-go'
Plug 'psf/black', { 'branch': 'stable' }
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'dense-analysis/ale'
" Language Packs
Plug 'ekalinin/Dockerfile.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
call plug#end()

" ==============================================
" ALE (Just for Black and isort)
let g:ale_disable_lsp = 1
let g:ale_fixers = ['black', 'isort']
let g:ale_fix_on_save = 1

" ==============================================
" COLORS
set termguicolors           " nice 24 bit colors
syntax on                   " really needed
set background=dark
colorscheme gruvbox
hi LineNr ctermbg=NONE guibg=NONE
syntax on
let g:indent_blankline_show_trailing_blankline_indent = "false"

" ==============================================
" USEFUL MAPPINGS

" Disabling arrow keys ( God help me! )
map <left> <nop>
map <right> <nop>
map <up> <nop>
map <down> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" Mapping :WQ to :wq and :W to :w (typing mistakes)
:command WQ wq
:command Wq wq
:command W w
:command Q q
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j
tnoremap <Esc> <C-\><C-n>

" Use ,vt and ,st for vertical and horizontal terminals
nnoremap <leader>vt :vsplit term://zsh<CR>
nnoremap <leader>st :split term://zsh<CR>

" Disappear the highlight when done searching
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
map <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nmap <Left> :BufferPrevious<cr>
nmap <Right> :BufferNext<cr>
nmap <Down> :BufferClose<cr>

" FZF Settings
let $FZF_DEFAULT_COMMAND = 'rg --files --ignore-vcs --hidden'
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
nnoremap <Leader>p :Files<CR>
" Tags based searching
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>

" Disable git-blame by default
let g:gitblame_enabled  = 0

" ==============================================
" NERDCommenter
let g:NERDSpaceDelims = 1         " add spaces after comment delimiters
let g:NERDCompactSexyComs = 1     " use compact syntax for prettified multi-line comments
let g:NERDDefaultAlign = 'left'   " align line-wise comment delimiters flush left instead of following code indentation


" =============================================
" Language tooling
let g:prettier#autoformat = 1

" ==============================================
" LIGHTLINE Settings

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename','modified' ] ],
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
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename',
      \ },
      \ }

function! LightlineFilename()
  return expand('%')
endfunction

" Source LSP completion, Tree sitter and core LSP config
source ~/.config/nvim/cmp.vim
source ~/.config/nvim/lsp.vim
source ~/.config/nvim/treesitter.vim
