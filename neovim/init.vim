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
" Don't hide the conceal features in markdownt
set conceallevel=0
set nocompatible
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
let g:ale_disable_lsp = 1

" ==============================================
" PLUGINS
call plug#begin()

" Tooling
" sensible defaults
Plug 'tpope/vim-sensible'
" Git on steroids
Plug 'tpope/vim-fugitive'
" Sorrounding everything with quotes etc
Plug 'tpope/vim-surround'                         "
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

" AESTHETICS
" Molokai colorscheme (alternative)
" Plug 'fatih/molokai'
Plug 'tomasiser/vim-code-dark'
" Lines of Indentation (LOI) :P
Plug 'Yggdroot/indentLine'
" The colored file icons
Plug 'kyazdani42/nvim-web-devicons'
" Improved bufferline, using barbar until it works
" Plug 'akinsho/nvim-bufferline.lua'
Plug 'romgrk/barbar.nvim'
" Telescope for the intuitive UI of file finding etc.
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" neovim-treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" LANGUAGE TOOLING
" Amazing Neovim LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
" Ale to run linters on code and fix
Plug 'dense-analysis/ale'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Language Packs
Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ekalinin/Dockerfile.vim'
Plug 'othree/html5.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'cespare/vim-toml'
call plug#end()

" ==============================================
" COLORS
set termguicolors           " nice 24 bit colors
syntax on                   " really needed
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=dark
let g:one_allow_italics = 1
colorscheme codedark
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

"===============================================
:command WQ wq
:command Wq wq
:command W w
:command Q q
nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j
" ==============================================
" USEFUL MAPPINGS

" FZF Settings
" nnoremap <Leader>p :FZF<CR>
nnoremap <C-P> :GFiles<CR>
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
map <M-Down> :BufferClose<CR>
" Re-order to previous/next
nnoremap <silent> <Leader>, :BufferMovePrevious<CR>
nnoremap <silent> <Leader>. :BufferMoveNext<CR>


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

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
      \ 'separator': { 'left': '‚ÆÄ', 'right': '‚ÆÇ' },
      \ 'subseparator': { 'left': '‚ÆÅ', 'right': '‚ÆÉ' }
      \ }

function! LightlineFilename()
  return expand('%')
endfunction

let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#show_number = 2
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

" =============================================
" Move easily to the next error
nnoremap <leader>l :lnext<CR>
nnoremap <leader>h :lprevious<CR>

" =============================================
" Language tooling
"
" Ale config =================================
let g:ale_linters_explicit = 1
let g:ale_sign_error = '‚ùå'
let g:ale_sign_warning = '‚ö†Ô∏è'
let g:ale_fix_on_save = 1
let g:ale_linters = {'javascript': ['eslint'], 'typescript': ['eslint'],'make': ['checkmake']}
let g:ale_fixers = { 'javascript': ['prettier', 'eslint'],  'typescript': ['prettier', 'eslint'], 'go':['gofmt'], 'json': ['prettier'], 'rust': ['rustfmt'], 'html': ['prettier'], 'yaml': ['prettier'], 'vue': ['prettier'], 'markdown': ['prettier']}
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)
" ==============================================

" vim-javascript setting
let g:javascript_plugin_flow = 1

" vim-json setting
let g:vim_json_syntax_conceal = 0

" " Tree-sitter config
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF

" =============================================
" Neovim LSP and its completion configs
lua << EOF
require'lspconfig'.gopls.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.cssls.setup{}
require'lspconfig'.vuels.setup{}
require'lspconfig'.yamlls.setup{}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}
require'lspconfig'.jsonls.setup {
    commands = {
      Format = {
        function()
          vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
        end
      }
    }
}
EOF

autocmd BufEnter * lua require'completion'.on_attach()

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

autocmd Filetype * setlocal omnifunc=v:lua.vim.lsp.omnifunc

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> H     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>
let g:completion_enable_snippet = 'UltiSnips'
