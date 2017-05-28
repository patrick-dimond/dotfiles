set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'morhetz/gruvbox'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'edkolev/tmuxline.vim'

call vundle#end()            " required
filetype plugin indent on    " required

syntax on
set termguicolors
set number
set ruler
set wrap
set textwidth=79
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set t_ut=
set backspace=indent,eol,start

set laststatus=2

let g:airline_theme='gruvbox'

colorscheme gruvbox
