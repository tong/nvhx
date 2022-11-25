if exists("b:current_syntax")
    finish
end

let b:current_syntax = "hxml"

syntax match hxmlComment "#.*$" contains=hxmlTodo

" Target
syntax match hxmlType "--\?js"
syntax match hxmlType "--\?lua"
syntax match hxmlType "--\?swf"
syntax match hxmlType "--\?neko"
syntax match hxmlType "--\?php"
syntax match hxmlType "--\?cpp"
syntax match hxmlType "--\?cppia"
syntax match hxmlType "--\?cs"
syntax match hxmlType "--\?java"
syntax match hxmlType "--\?jvm"
syntax match hxmlType "--\?python"
syntax match hxmlType "--\?hl"
syntax match hxmlType "--\?interp"
syntax match hxmlType "--\?run"

" Compilation
syntax match hxmlType "-p"
syntax match hxmlType "--class-path"
syntax match hxmlType "-m"
syntax match hxmlType "--\?main"
syntax match hxmlType "-L"
syntax match hxmlType "--library"
syntax match hxmlType "-D"
syntax match hxmlType "--define"
syntax match hxmlType "-r"
syntax match hxmlType "-resource"
syntax match hxmlType "--\?cmd"
syntax match hxmlType "--\?remap"
syntax match hxmlType "--\?macro"
syntax match hxmlType "-C"
syntax match hxmlType "---cwd"
syntax match hxmlType "--\?haxelib-global"

" Optimization
syntax match hxmlType "--\?dce"
syntax match hxmlType "--\?no-traces"
syntax match hxmlType "--\?no-output"
syntax match hxmlType "--\?no-inline"
syntax match hxmlType "--\?no-opt"

" Debug
syntax match hxmlType "-v"
syntax match hxmlType "--verbose"
syntax match hxmlType "--\?debug"
syntax match hxmlType "--prompt"
syntax match hxmlType "--times"

" Batch
syntax match hxmlType "--next" 
syntax match hxmlType "--each"

" Services
syntax match hxmlType "--display"
syntax match hxmlType "--xml"
syntax match hxmlType "--json"

" Compilation Server
syntax match hxmlType "--server-listen"
syntax match hxmlType "--server-connect"
syntax match hxmlType "--connect"

" Target-specific
syntax match hxmlType "--swf-version"
syntax match hxmlType "--swf-header"
syntax match hxmlType "--flash-strict"
syntax match hxmlType "--swf-lib"
syntax match hxmlType "--swf-lib-extern"
syntax match hxmlType "--java-lib"
syntax match hxmlType "--java-lib-extern"
syntax match hxmlType "--net-std"
syntax match hxmlType "--c-arg"

" Miscellaneous
syntax match hxmlType "--version"
syntax match hxmlType "-h"
syntax match hxmlType "--help"
syntax match hxmlType "--help-defines"
syntax match hxmlType "--help-metas"

highlight link hxmlType Type
highlight link hxmlStatement Statement
highlight link hxmlComment Comment

