" Vim compiler file
" Compiler:     haxe

if exists("current_compiler")
    finish
endif

let current_compiler = "haxe"

let s:save_cpo = &cpo
set cpo&vim

if exists(':CompilerSet') != 2
	command -nargs=* CompilerSet setlocal <args>
endif

let s:save_cpo = &cpo
set cpo-=C

CompilerSet makeprg=haxe\ build.hxml
CompilerSet errorformat=
    \%-G#\ %.%#,
    \%A%f:%l:%c:\ %m,
    \%A%f:%l:\ %m,
    \%C%*\\s%m,
    \%-G%.%#

let &cpo = s:save_cpo
unlet s:save_cpo
