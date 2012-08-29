set nocompatible

""""""""""""
" PATHOGEN "
""""""""""""
filetype off " force reloading after pathogen is loaded
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#infect('~/.vim/bundle')
filetype plugin indent on       " load file type plugins + indentation

" I really really think line numbers are ugly. They are in my status line
" anyway.
set nonumber
set wrap
set hidden
" Yank text even from commandline.
set clipboard=unnamed

" Change mapleader to ,
let mapleader = ","
" I hit wq all the time when I just want to save. Disable that.
cmap wq w
" Hitting uppercase w is also a classic.
cmap W w
" I also hit f1 when scrambling for esc, so just remap that while we are at
" it.
map! <f1> <esc>
" I never type jj, so make that esc now that we are stealing keys anyway.
imap jj <Esc>


" Create directional shortcuts for moving between splits
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
nmap <C-h> <C-W>h

" Stolen from:
" http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
set statusline=%t\       "tail of the filename
set statusline+=%m\      "modified flag
set statusline+=%y\      "filetype
set statusline+=b%-3.3n\  "buffer number
set statusline+=%r      "read only flag
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file

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
" See if there is an index file that we can set as working dir.
let g:ctrlp_root_markers = ['index.php']

" Show in tree.
map <leader>N :NERDTreeFind<cr>

" Close buffer but not window.
map <leader>d :Kwbd<cr>
" Go to next buffer
map <leader>. :bn<cr>
" Go to previous buffer
map <leader>m :bp<cr>

" Remove trailing whitespace.
map <leader>s :%s/\s\+$//e<cr>

" CTAGS - use an explicit path or the Mac one will be used.
map <F8> :!/usr/local/bin/ctags -R --tag-relative=yes --langmap=php:.profile.engine.inc.module.theme.php --php-kinds=+f --languages=php --recurse<CR>
