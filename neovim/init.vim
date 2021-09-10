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

" Tooling
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
" Wakatime
" Plug 'wakatime/vim-wakatime'
Plug 'lukas-reineke/indent-blankline.nvim'

" AESTHETICS
" Good old molokai
" Plug 'fatih/molokai'
Plug 'gruvbox-community/gruvbox'
" Plug 'joshdick/onedark.vim'
" Plug 'chriskempson/base16-vim'
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
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
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
" let g:go_gopls_enabled = 0
let g:ale_disable_lsp = 1
" In ~/.vim/after/ftplugin/python.vim (or somewhere like that)
let g:ale_fixers = ['black', 'isort']
let g:ale_fix_on_save = 1
" ==============================================
" COLORS
set termguicolors           " nice 24 bit colors
syntax on                   " really needed
set background=dark
colorscheme gruvbox
" let base16colorspace=256
hi LineNr ctermbg=NONE guibg=NONE
" Brighter comments
" call Base16hi("Comment", g:base16_gui09, "", g:base16_cterm09, "", "", "")
syntax on
let g:indent_blankline_show_trailing_blankline_indent = "false"

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
nnoremap <leader>vt :vsplit term://zsh<CR>
nnoremap <leader>st :split term://zsh<CR>
" ==============================================
" USEFUL MAPPINGS
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]

let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 1,
    \ 'files': 1,
    \ }
" FZF Settings
nnoremap <C-p> :FZF<CR>
nnoremap <Leader>p :GFiles<CR>
" Tags based searching
nnoremap <Leader>t :BTags<CR>
nnoremap <Leader>T :Tags<CR>

" disappear the highlight when done searching
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>
map <Leader>b :Buffers<CR>
nnoremap <Leader>h :History<CR>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Disable git-blame by default
let g:gitblame_enabled  = 0

" WakatimeToday Binding
" nnoremap <Leader>w :WakaTimeToday<CR>

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

" let g:lightline#bufferline#enable_devicons = 1
" let g:lightline#bufferline#show_number = 2
" let g:lightline#bufferline#enable_nerdfont = 1
" let g:lightline#bufferline#unicode_symbols = 1
" let g:lightline#bufferline#filename_modifier = ':t'

" nmap <Leader>1 <Plug>lightline#bufferline#go(1)
" nmap <Leader>2 <Plug>lightline#bufferline#go(2)
" nmap <Leader>3 <Plug>lightline#bufferline#go(3)
" nmap <Leader>4 <Plug>lightline#bufferline#go(4)
" nmap <Leader>5 <Plug>lightline#bufferline#go(5)
" nmap <Leader>6 <Plug>lightline#bufferline#go(6)
" nmap <Leader>7 <Plug>lightline#bufferline#go(7)
" nmap <Leader>8 <Plug>lightline#bufferline#go(8)
" nmap <Leader>9 <Plug>lightline#bufferline#go(9)
" nmap <Leader>0 <Plug>lightline#bufferline#go(10)


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

nmap <Left> :BufferPrevious<cr>
nmap <Right> :BufferNext<cr>
nmap <Down> :BufferClose<cr>

" =============================================
" Language tooling
let g:prettier#autoformat = 1
autocmd BufWritePre *.py execute ':Black'


" Uncomment these lines if need to use completion-nvim in future
" ===================================================================
" autocmd BufEnter * lua require'completion'.on_attach()
" let g:completion_enable_snippet = 'UltiSnips'

" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" ===================================================================


" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

autocmd Filetype * setlocal omnifunc=v:lua.vim.lsp.omnifunc

nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> H     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <Leader>h <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gt   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> <Leader>gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <Leader>d <cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent> [d    <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]d    <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <Leader>q    <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>

nnoremap <silent> <space>wa <cmd>lua vim.lsp.buf.add_workspace_folder()<CR>
nnoremap <silent> <space>wr <cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>
nnoremap <silent> <space>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <space>wl <cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>

" Add highlights )red,orange,yellow, green) to LSP error messages
hi LspDiagnosticsVirtualTextError guifg=red gui=bold,italic,underline
hi LspDiagnosticsVirtualTextWarning guifg=orange gui=bold,italic,underline
hi LspDiagnosticsVirtualTextInformation guifg=yellow gui=bold,italic,underline
hi LspDiagnosticsVirtualTextHint guifg=lightgreen gui=bold,italic,underline

" nvim-compe configuration
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.max_abbr_width = 100
let g:compe.max_kind_width = 100
let g:compe.max_menu_width = 100
let g:compe.documentation = v:true

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.vsnip = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" =============================================
" Neovim LSP and its completion configs
lua << EOF
lspconfig = require "lspconfig"
  lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
  }
require'lspconfig'.tsserver.setup{
cmd = {"/Users/sidntrivedi012/.nvm/versions/node/v14.15.4/bin/typescript-language-server", "--stdio"}
}
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
}
require'lspconfig'.pyright.setup{
cmd = {"/Users/phoenix/.nvm/versions/node/v14.17.4/bin/pyright-langserver","--stdio"}
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
" ===================================================
" Navigate through completion menu using Tab
" ===================================================

lua << EOF
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF

lua <<EOF
  -- ‚àö√¢

  function goimports(timeout_ms)
    local context = { source = { organizeImports = true } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    -- See the implementation of the textDocument/codeAction callback
    -- (lua/vim/lsp/handler.lua) for how to do this properly.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
    -- is a CodeAction, it can have either an edit, a command or both. Edits
    -- should be executed first.
    if action.edit or type(action.command) == "table" then
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit)
      end
      if type(action.command) == "table" then
        vim.lsp.buf.execute_command(action.command)
      end
    else
      vim.lsp.buf.execute_command(action)
    end
  end
EOF

autocmd BufWritePre *.go lua goimports(1000)
autocmd BufWritePost * lua vim.lsp.buf.formatting()
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"go","javascript","toml","python","json","yaml"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}

