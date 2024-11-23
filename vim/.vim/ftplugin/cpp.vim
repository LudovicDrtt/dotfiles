command! -buffer -range=% Format let myview = winsaveview() |
  \ execute <line1> . "," . <line2> . "!clang-format" |
  \ call winrestview(myview)

map <F2> :Format <enter> 

" Omnicompletion
" configure tags - add additional tags here or comment out not-used ones
set tags+=~/.vim/tags/cpp

" build tags of your own project with Ctrl-F12
map <F3> :!ctags -R --sort=yes --c++-kinds=+pl --fields=+iaS --extra=+q --languages=c++ . <CR> <CR>

