set nocompatible

""""""""""""
" PATHOGEN "
""""""""""""
filetype off " force reloading after pathogen is loaded
" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()
filetype plugin indent on       " load file type plugins + indentation

"""""""""""""
" THE LOOKS "
"""""""""""""
set background=dark
" I hate line numbers!
set nonumber
" Color schemes. Keep it simple.
if has('gui_running')
  color desert
  " Remove toolbar.
  set guioptions-=T
else
  " Desert looks horrible in my terminal.
  color default
endif

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

""""""""""""
" MAPPINGS "
""""""""""""
" Change mapleader to ,
let mapleader = ","

" Kill current buffer
map <leader>d :bd<cr>
" Go to next buffer
map <leader>. :bn<cr>
" Go to previous buffer
map <leader>m :bp<cr>

" Easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>
" Set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" Bubble single lines. Killer feature called 'Line up/down' in Textmate.
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Custom mappings for plugins:
" Command-t in current dir
nmap <leader>T :CommandT %:h<cr>
" Command-t list buffers - this is even better than Buffergator.
nmap <leader>b :CommandTBuffer<cr>


""""""""""
" Drupal "
""""""""""
if has("autocmd")
" Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
endif


" CTAGS - use an explicit path or the Mac one will be used.
map <F8> :!/usr/local/bin/ctags -R --tag-relative=yes --langmap=php:.profile.engine.inc.module.theme.php --php-kinds=+f --languages=php --recurse<CR>

""""""""
" MISC "
""""""""
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set wildmode=list:longest
set backupdir=~/.vim/_backup " where to put backup files.
set directory=~/.vim/_temp " where to put swap files.

"""""""""""""""""""""""""""""""""""
" Textmate => Vim training wheels "
"""""""""""""""""""""""""""""""""""
" Disable cursor keys in normal mode. A royal PITA, but that will learn me.
map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>

if has("gui_macvim") && has("gui_running")
" Map Command-# to switch tabs just like Firefox or Textmate has it.
  map <D-0> 0gt
  imap <D-0> <Esc>0gt
  map <D-1> 1gt
  imap <D-1> <Esc>1gt
  map <D-2> 2gt
  imap <D-2> <Esc>2gt
  map <D-3> 3gt
  imap <D-3> <Esc>3gt
  map <D-4> 4gt
  imap <D-4> <Esc>4gt
  map <D-5> 5gt
  imap <D-5> <Esc>5gt
  map <D-6> 6gt
  imap <D-6> <Esc>6gt
  map <D-7> 7gt
  imap <D-7> <Esc>7gt
  map <D-8> 8gt
  imap <D-8> <Esc>8gt
  map <D-9> 9gt
  imap <D-9> <Esc>9gt
endif
