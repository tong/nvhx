if exists("b:did_indent")
   finish
endif
let b:did_indent = 1
setlocal cindent
setlocal cinoptions+=j1,J1
setlocal indentkeys=0{,0},0),0],!^F,o,O,e
let b:undo_indent = "setl cin<"
