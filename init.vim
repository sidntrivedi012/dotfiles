set number
set nowrap
highlight LineNr ctermfg=white
set ignorecase
filetype plugin on

" Switch buffers using Alt+Arrow keys
nnoremap <M-Right> 	:bnext<CR>
nnoremap <M-Left> 	:bprevious<CR>

" Indentation
autocmd Filetype html,css,javascript,ruby,eruby setl sw=2 sts=2 et	" 2 spaces for HTML, CSS, Javascript, Ruby
autocmd Filetype python setl sw=4 sts=4 et				" 4 spaces for Python

"Easier split navigation
nnoremap <C-Left>	<C-W><Left><CR>
nnoremap <C-Right>	<C-W><Right><CR>
nnoremap <C-Up>		<C-W><Up><CR>
nnoremap <C-Down>	<C-W><Down><CR>

" Plugins

call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-rails'
Plug 'fatih/vim-go'

call plug#end()

" ----------------------
" NERDTree Configuration

" Start NERDTree if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Start NERDTree on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Control+N keybinding
map <C-n> :NERDTreeToggle<CR>

" Close vim if the only window open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" ----------------------

" Airline Configuration
set laststatus=2				" Set laststatus so that airline appears all the time
let g:airline_powerline_fonts = 1		" Use powerline symbols
let g:airline#extensions#tabline#enabled = 1	" Enable tabline for tabs/buffers

" Miscellaneous
let g:deoplete#enable_at_startup = 1		" Enable Deoplete on startup
let g:gitgutter_sign_column_always = 1		" Always show gitgutter column
let g:ale_sign_column_always = 1		" Always show ale column
let g:airline#extensions#ale#enabled = 1	" Enable ale airline integration