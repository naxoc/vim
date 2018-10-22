set nocompatible

call pathogen#infect()

syntax on
filetype plugin indent on

" Disable cursor keys in normal mode. A royal PITA, but that will learn me.
"map <Left> :echo "no!"<cr>
"map <Right> :echo "no!"<cr>
"map <Up> :echo "no!"<cr>
"map <Down> :echo "no!"<cr>

set hidden
"set number
set encoding=utf-8
set showcmd                     " display incomplete commands
set wildmode=list:longest
set backupdir=~/.vim/_backup " where to put backup files.
set directory=~/.vim/_temp " where to put swap files.

" Change mapleader to ,
let mapleader = ","

" Whitespace
set expandtab                   " use spaces, not tabs (optional)
set tabstop=2 shiftwidth=2
set backspace=indent,eol,start  " backspace through everything in insert mode

" Autosave files when focus is lost.
":au FocusLost * :wa

" Fold function.
map <leader>zf $zf%

" Life is too short to prefix everything all the time.
nnoremap / /\v
vnoremap / /\v

" I hit wq all the time when I just want to save. Disable that.
" I never type jj, so make that esc now that we are stealing keys anyway.
imap jj <Esc>

" Create directional shortcuts for moving between splits
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-l> <C-W>l
nmap <C-h> <C-W>h

set scrolloff=5

set laststatus=2

:set pastetoggle=<F3>

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
" Toogle tagbar
map <leader>/ :TagbarToggle<cr>
map <leader>n :NERDTreeToggle<cr>

" Gundo.
nnoremap <leader>g :GundoToggle<CR>

" Close buffer but not window.
map <leader>d :Kwbd<cr>
" Go to next buffer
map <leader>. :bn<cr>
" Go to previous buffer
map <leader>m :bp<cr>

" Remove trailing whitespace.
map <leader>s :%s/\s\+$//e<cr>

let NERDTreeShowHidden=1

" CTAGS - use an explicit path or the Mac one will be used.
" map <F8> :!/usr/local/bin/ctags -R --tag-relative=yes --langmap=php:.profile.engine.inc.module.theme.php --php-kinds=+icdf --languages=php --recurse<CR>

" Check php files for errors
"set makeprg=php\ -l\ %
"set errorformat=%m\ in\ %f\ on\ line\ %l

" Bubble single lines. Killer feature called 'Line up/down' in Textmate.
nmap <C-Up> ddkP
nmap <C-Down> ddp
" Bubble multiple lines
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set wrapscan                    " Let search wrap around.

"autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}
"Sourced from vim tip: http://vim.wikia.com/wiki/Keep_folds_closed_while_inserting_text
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
" Get json syntax highlighting for free like this.
autocmd BufNewFile,BufRead *.json set ft=javascript

"let g:syntastic_error_symbol='✗'
"let g:syntastic_warning_symbol='⚠'
let g:syntastic_auto_jump=0 " Dont jump to the first line with a problem

" Using the default color theme in the terminal, I find the yellow line
" numbers obnoxious. Make them grey.
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE
highlight Visual cterm=none ctermfg=DarkGrey ctermbg=LightYellow
set background=light

let g:airline_powerline_fonts = 1
