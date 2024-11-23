command! -buffer -range=% Format let myview = winsaveview() |
  \ execute <line1> . "," . <line2> . "!clang-format" |
  \ call winrestview(myview)

map <F2> :Format <enter> 
