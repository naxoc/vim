if has("gui_running")
  set guifont=Menlo:h15

  " Remove toolbar, left scrollbar and right scrollbar
  set guioptions=aAce
  set guioptions-=T
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
endif
color github
"hi LineNr guifg=grey50 guibg=grey20

set undodir=~/.vimundodir
set undofile
