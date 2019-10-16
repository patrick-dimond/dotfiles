" Plugins
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'

Plug 'scrooloose/nerdtree'

Plug 'rust-lang/rust.vim'

Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'

Plug 'airblade/vim-gitgutter'

Plug 'sheerun/vim-polyglot'
Plug 'joshdick/onedark.vim'

call plug#end()

" Normal stuff
syntax on
set number relativenumber
set ruler
set wrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

syntax on
colorscheme onedark
let g:airline_theme='onedark'
let g:airline#extensions#tmuxline#enabled = 0

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



" Splits
" Use ctrl- <> instead of ctrl - w and ctrl - <>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Rust
let g:rustfmt_autosave = 1

" Map alt to be escape for vim + tmux

" Plugins to investigate
" tpope surround and commentary
" christomney system-copy
" christomney vim tmux navigator

" Custom text objects to investigate
"  kana/vim-textobj-line
"  michaeljsmith/vim-indent-object
