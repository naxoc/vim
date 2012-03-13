" I am on a mac. And if I have a gui - it will be Macvim.
if has("gui_macvim") && has("gui_running")
  " This is a standard Vim colorscheme and I really like it in Macvim. In my
  " terminal it looks absoultely horrible though.
  color desert
  " Remove toolbar. What is the point of looking flashy with Vim if I have to
  " click icons?
  set guioptions-=T

  " I like Monaco. And I like it rather large. Must be old age and the fact
  " that it looks a bit like Comic Sans. Keeping my editor classy.
  set guifont=Monaco:h13

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
