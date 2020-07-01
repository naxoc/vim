set nocompatible

" minpac
packadd minpac
call minpac#init()
" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Add other plugins here.
call minpac#add('ctrlpvim/ctrlp.vim.git')
call minpac#add('tpope/vim-surround')

" ctrlp
" Map the buffer switcher from the Ctrlp plugin.
map <leader>b :CtrlPBuffer<cr>
" Map the recent files.
map <leader>r :CtrlPMRUFiles<cr>
" Map find-tag-in-buffer.
map <leader>t :CtrlPBufTag<cr>
" Map find-tag-in-all-buffers.
map <leader>ta :CtrlPBufTagAll<cr>
" Enable these extensions. Cycle through them with ctrl-f and ctrl-b when the
" CtrlP window is open.
let g:ctrlp_extensions = ['tag', 'buffertag']

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
