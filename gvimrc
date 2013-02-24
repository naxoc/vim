if has("gui_running")
  set guifont=Monaco:h14

  " Remove toolbar, left scrollbar and right scrollbar
  set guioptions=aAce
  set guioptions-=T
  set guioptions-=l
  set guioptions-=L
  set guioptions-=r
  set guioptions-=R
endif
color desert
highlight LineNr guifg=DarkGrey guibg=NONE
set undodir=~/.vimundodir
set undofile
