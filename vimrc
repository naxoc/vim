set nocompatible

" Common config stuff
syntax on
filetype plugin indent on
set hidden
set encoding=utf-8
set showcmd  
set tabstop=2 shiftwidth=2

" minpac
packadd minpac
source ~/.vim/packages.vim

" Change mapleader to ,
let mapleader= ","

" Go to next buffer
map <leader>. :bn<cr>
" Go to previous buffer
map <leader>m :bp<cr>

" Show in tree.
map <leader>N :NERDTreeFind<cr>
" Toggle tree
map <leader>n :NERDTreeToggle<cr>

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
" Airline plugin appearance
let g:airline_powerline_fonts = 1
let g:airline_theme='light'
