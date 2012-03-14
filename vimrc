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
" I hate line numbers! I can see them in the status bar just fine.
set nonumber

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2

" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
" Highlight trailing whitespace.
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set wrapscan                    " Let search wrap around.

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

" Upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" Custom mappings for plugins:
" Command-t in current dir
nmap <leader>T :CommandT %:h<cr>
" Command-t list buffers - this is even better than Buffergator.
nmap <leader>b :CommandTBuffer<cr>

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

"""""""""""""
" FUNCTIONS "
"""""""""""""
" Creates a session in the sessions dir in .vim. The dir you are in is used
" for creating the path to the session file.
function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

" Map ctrl s to the session save.
noremap <C-S> :call MakeSession()<cr>

" Loads a sesssion from your .vim/sessions dir if there is one. The dir you
" are currently in is used for the path/filename for the sessoin file.
function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction
" Map ctrl l to load session.
map <C-L> :call LoadSession()<cr>
