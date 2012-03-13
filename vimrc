set nocompatible

filetype off " force reloading after pathogen is loaded

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
runtime bundle/pathogen/autoload/pathogen.vim
call pathogen#runtime_append_all_bundles()

if has('gui_running')
  color desert
  set background=dark
  " Remove toolbar.
  set guioptions-=T
else
  color default
  set background=dark
endif


syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

" List chars
set listchars=""                " Reset the listchars
set listchars=tab:\ \ " a tab should display as " ", trailing whitespace as "."
set listchars+=trail:.          " show trailing spaces as dots
set listchars+=extends:>        " The character to show in the last column when wrap is
                                " off and the line continues beyond the right of the screen
set listchars+=precedes:<       " The character to show in the last column when wrap is
                                " off and the line continues beyond the right of the screen

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

" Change mapleader to ,
let mapleader = ","

" Customizations for plugins:
" Command-t in current dir
nmap <leader>T :CommandT %:h<cr>
" Command-t list buffers
nmap <leader>b :CommandTBuffer<cr>

" I hate line numbers!
set nonumber

" Kill current buffer
map <leader>d :bd<cr>
" Go to next buffer
map <leader>. :bn<cr>
" Go to previous buffer
map <leader>m :bp<cr>

" easier navigation between split windows
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Drupal
if has("autocmd")
" Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
endif

set wildmode=list:longest

" CTAGS
map <F8> :!/usr/local/bin/ctags -R --tag-relative=yes --langmap=php:.profile.engine.inc.module.theme.php --php-kinds=+f --languages=php --recurse<CR>
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"

" disable cursor keys in normal mode
map <Left> :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up> :echo "no!"<cr>
map <Down> :echo "no!"<cr>

" cd to the directory containing the file in the buffer
nmap <silent> <leader>cd :lcd %:h<CR>
" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

set backupdir=~/.vim/_backup " where to put backup files.
set directory=~/.vim/_temp " where to put swap files.

if has("statusline") && !&cp
  set laststatus=2 " always show the status bar

" Start the status line
  set statusline=%f\ %m\ %r

" Finish the statusline
  set statusline+=Line:%l/%L[%p%%]
  set statusline+=Col:%v
  set statusline+=Buf:#%n
  set statusline+=[%b][0x%B]
endif

if has("gui_macvim") && has("gui_running")
" Map command-[ and command-] to indenting or outdenting
" while keeping the original selection in visual mode
  vmap <D-]> >gv
  vmap <D-[> <gv

  nmap <D-]> >>
  nmap <D-[> <<

  omap <D-]> >>
  omap <D-[> <<

  imap <D-]> <Esc>>>i
  imap <D-[> <Esc><<i

" Bubble single lines
  nmap <D-Up> [e
  nmap <D-Down> ]e
  nmap <D-k> [e
  nmap <D-j> ]e

" Bubble multiple lines
  vmap <D-Up> [egv
  vmap <D-Down> ]egv
  vmap <D-k> [egv
  vmap <D-j> ]egv

" Map Command-# to switch tabs
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
