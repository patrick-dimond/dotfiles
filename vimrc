" Plugins
call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-system-copy'
Plug 'christoomey/vim-tmux-navigator'
Plug 'edkolev/tmuxline.vim'
Plug 'joshdick/onedark.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-user'
Plug 'michaeljsmith/vim-indent-object'
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline'
Plug '~/.fzf'

call plug#end()

" Normal stuff
set autoindent
set expandtab
set incsearch
set number relativenumber
set ruler
set shiftwidth=2
set softtabstop=2
set tabstop=2
set wrap
syntax on

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Colours!
colorscheme onedark
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_theme='onedark'

" FZF and rg
" ctrl f to ripgrep find
nnoremap <C-F> :Rg<Enter>


" NERDTree config
" exit vim if NERDTree last thing open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Open NERDTree automatically if vim is opened on a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Show current file location in tree
"
" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFocus
    normal P
    normal X
    wincmd p
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" GitGutter
" increase update time
set updatetime=100
" no keymappings
let g:gitgutter_map_keys = 0

" Rust
let g:rustfmt_autosave = 1
