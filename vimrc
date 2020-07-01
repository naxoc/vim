set nocompatible

" minpac
" Plugins are not loaded until you call either :PackUpdate or :PackClean
source ~/.vim/packages.vim

" Common config stuff
syntax on
filetype plugin indent on
set hidden
set encoding=utf-8
set showcmd  
set tabstop=2 shiftwidth=2

" Change mapleader to ,
let mapleader = ","

" Get swap and backup files out of the way.
set backupdir=~/.vim/_backup " where to put backup files.
set directory=~/.vim/_temp " where to put swap files.

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set wrapscan                    " Let search wrap around.

" Color
colorscheme morning
set background=light
