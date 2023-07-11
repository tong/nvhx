if !exists("main_syn")
    if exists("b:current_syn")
        finish
    end
    let main_syn = 'hxml'
elseif exists("b:current_syn") && b:current_syn == "hxml"
    finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match hxmlComment "#.*$" contains=hxmlCommentTodo

syn match haxeType "\<[A-Z][a-zA-Z_0-9]*\>"
"syn match haxeLibrary "[a-zA-Z][a-zA-Z0-9\_\-]*"
"syn match hxmlDceAttr contained "\<full\|std\|no\>"

" Target
syn match hxmlType "--\?js"
syn match hxmlType "--\?lua"
syn match hxmlType "--\?swf"
syn match hxmlType "--\?neko"
syn match hxmlType "--\?php"
syn match hxmlType "--\?cpp"
syn match hxmlType "--\?cppia"
syn match hxmlType "--\?cs"
syn match hxmlType "--\?java"
syn match hxmlType "--\?jvm"
syn match hxmlType "--\?python"
syn match hxmlType "--\?hl"
syn match hxmlType "--\?interp"
syn match hxmlType "--\?run"

" Compilation
syn match hxmlType "-p"
syn match hxmlType "--class-path"
syn match hxmlType "-m"
syn match hxmlType "--\?main"
syn match hxmlType "-L"
"syn match hxmlType "--library\s[a-zA-Z][a-zA-Z0-9\_\-]*"
"syn match hxmlType "--library\s[a-zA-Z][a-zA-Z0-9_\-\.]*"
"syn match hxmlType start=+--library\s+ end=+[a-zA-Z][a-zA-Z0-9_\-\.]*
"syn match hxmlType "-\-library\s+" nextgroup=haxeLibrary
"syn match hxmlType "-\-library\s\s*[a-zA-Z][a-zA-Z0-9_\-\.]*"
"syn match hxmlType /--library\s*/ nextgroup=haxeLibrary
"syn match hxmlType "--library\s" nextgroup=haxeLibrary
"syn match hxmlType "--FFF\s\s*[a-zA-Z][a-zA-Z0-9\_\-]*"
"syn match hxmlType /--FFF\s\s*/

"syn match hxmlType "-D"
syn match hxmlType "-D\s[a-zA-Z_][a-zA-Z_\=\[\]]*"
syn match hxmlType "--define"
syn match hxmlType "-r"
syn match hxmlType "-resource"
syn match hxmlType "--\?cmd"
syn match hxmlType "--\?remap"
syn match hxmlType "--\?macro"
syn match hxmlType "-C"
syn match hxmlType "---cwd"
syn match hxmlType "--\?haxelib-global"
syn match hxmlType "-w"

" Optimization
syn match hxmlType "--\?dce\s\s*\(full\|std\|none\)"
syn match hxmlType "--\?no-traces"
syn match hxmlType "--\?no-output"
syn match hxmlType "--\?no-inline"
syn match hxmlType "--\?no-opt"

" Debug
syn match hxmlType "-v"
syn match hxmlType "--verbose"
syn match hxmlType "--\?debug"
syn match hxmlType "--prompt"
syn match hxmlType "--times"

" Batch
syn match hxmlType "--next" 
syn match hxmlType "--each"

" Services
syn match hxmlType "--display"
syn match hxmlType "--xml"
syn match hxmlType "--json"

" Compilation Server
syn match hxmlType "--server-listen"
syn match hxmlType "--server-connect"
syn match hxmlType "--connect"

" Target-specific
syn match hxmlType "--swf-version"
syn match hxmlType "--swf-header"
syn match hxmlType "--flash-strict"
syn match hxmlType "--swf-lib"
syn match hxmlType "--swf-lib-extern"
syn match hxmlType "--java-lib"
syn match hxmlType "--java-lib-extern"
syn match hxmlType "--net-std"
syn match hxmlType "--c-arg"

" Miscellaneous
syn match hxmlType "--version"
syn match hxmlType "-h"
syn match hxmlType "--help"
syn match hxmlType "--help-defines"
syn match hxmlType "--help-user-defines"
syn match hxmlType "--help-metas"
syn match hxmlType "--help-user-metas"

hi def link hxmlComment Comment
hi def link hxmlType Type

let b:current_syn = "hxml"
if main_syn == 'javascript'
    unlet main_syn
endif
let &cpo = s:cpo_save
unlet s:cpo_save

" vim: ts=8
