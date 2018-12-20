call plug#begin('~/.local/share/nvim/plugged')

Plug 'rust-lang/rust.vim'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug '~/.fzf'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'Valloric/YouCompleteMe'


call plug#end()

filetype plugin indent on

syntax on
set number relativenumber
set ruler
set wrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set background=dark
set t_Co=256

let g:rustfmt_autosave = 1
let g:airline_powerline_fonts = 1

colorscheme gruvbox
"
" NerdTree
"

" No files, open NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Dir, open NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Close if NerdTree is the only remaining window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"
" Fzf
"

let g:fzf_layout = { 'down': '~20%' }

"
" git gutter
"

" Update gutter 100ms
set updatetime=100

"
" Bindings
"

let mapleader = ","

" FZF search from current dir
map <Leader>f :Files<CR>

" Create Splits
nmap <C-i> :vsplit<CR><C-w>l:enew<CR>:Files<CR>
nmap <C-o> :split<CR><C-w>j:enew<CR>:Files<CR>

" Split Navigation
nmap <C-l> <C-w>l
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

" Open new tab
nmap <A-t> :tabedit<CR>:Files<CR>

" Move to new Tab
nmap <A-m> <C-w><S-t>

" Tab Navigation
nmap <A-l> gt
nmap <A-h> gT
