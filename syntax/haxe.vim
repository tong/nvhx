if exists("b:current_syntax")
    finish
endif

command! -nargs=+ HaxeHiLink hi def link <args>

" characters that cannot be in a haxe program (outside a string)
syn match haxeError "[\\`]"

" keywords
" --------
syn keyword haxeTypedef typedef extends implements
syn keyword haxeTypeDecl class enum abstract interface import using package from to
syn keyword haxeStorageClass static inline public private macro dynamic extern override final

syn match   haxeTypedef		"\.\s*\<class\>"ms=s+1
syn match   haxeTypeDecl       "^class\>"
syn match   haxeTypeDecl       "[^.]\s*\<class\>"ms=s+1

syn keyword haxeException try catch throw
syn keyword haxeRepeat for do while in
syn keyword haxeLabel case
syn keyword haxeConditional switch
syn match haxeConditional "\<\#\@<!\(if\|else\)\>"
syn keyword haxeConstant null never super this default get set
syn keyword haxeFunction function __dollar__new new
syn match haxeFunction "\<__[^_]\+__\>"
syn keyword haxeKeyword untyped cast continue break return trace var final
syn match haxeKeyword "\$type"

syn match haxeError "\<#\@<!elseif\>"

" type identifiers
" ----------------
syn match haxeType "\<[A-Z][a-zA-Z_0-9]*\>"

" operators
" ---------
" put ,; in seperate highlight group to .: to avoid mistakes.
syn match haxeOperator "[:?]"
syn match haxeOperator2 "[;,]"

" match . and ... as operators, and .. and more than 4 . as errors
syn match haxeOperator "\.\@<!\(\.\|\.\.\.\)\.\@!"
syn match haxeError "\.\@<!\.\.\.\@!"
syn match haxeError "\.\{4,\}"

" match <,>,<<,>>,>>> as operators
syn match haxeOperator ">\@<!\(>\|>>\|>>>\)>\@!"
syn match haxeOperator "<\@<!\(<\|<<\)<\@!"

" match &| in 1 or 2 as operator, and more than 2 as error
" match &&= and ||= as errors
syn match haxeOperator "&\@<!&&\?&\@!"
syn match haxeOperator "|\@<!||\?|\@!"
syn match haxeError "&\{3,\}\||\{3,}\|&&=\|||="

" match = in 1 or 2 as operator, and more than 2 as error
" match !== as an error
syn match haxeOperator "=\@<!==\?=\@!"
syn match haxeError "=\{3,\}\|!=="

" match (+-*/%&!<>)=? as operators
" have to match &!<> seperate to avoid highlighting things like &&= &&& <<< as okay
syn match haxeOperator "[+\-*/%^!]=\?=\@!"
syn match haxeOperator "<\@<!<=\?[=<]\@!"
syn match haxeOperator ">\@<![>]=\?[=>]\@!"
syn match haxeOperator "&\@<!&=\?[=&]\@!"
syn match haxeOperator "|\@<!|=\?[=|]\@!"

" string literals
" ---------------
syn match haxeErrorCharacter contained "\\\(x.\{0,2}\|u.\{0,4\}\|[^"'\\/nrt]\)"
syn match haxeSpecialCharacter contained "\\\(x[a-fA-F0-9]\{2\}\|[0-7]\{3\}\|["'\\/nrt]\)"
syn match haxeIntSpecialChar contained "\$\@<!\(\$\$\)\+\(\(\$\$\)\+\)\@!"
syn match haxeInterpolatedIdent contained "\((\$\$)\+\)\@<!\$[a-zA-Z_][a-zA-Z_0-9]*"
syn region haxeInterpolated contained start=+\(\$\(\$\$\)\+\)\@<!${+ end=+}+ contains=@Spell
syn region haxeDString start=+"+ end=+"+ contains=haxeSpecialCharacter,haxeErrorCharacter,@Spell
syn region haxeSString start=+'+ end=+'+ contains=haxeSpecialCharacter,haxeErrorCharacter,haxeIntSpecialChar,haxeInterpolatedIdent,haxeInterpolated,@Spell

" int/float/bool literal
" ----------------------
syn match haxeInt "\<\([0-9]\+\|0x[0-9a-fA-F]\+\)\>"
syn match haxeFloat "\<\([\-+]\?[0-9]*\.\?[0-9]\+([eE][\-+]\?[0-9]\+)\?\)\>"
syn keyword haxeBool true false

" comments
" --------
syn keyword haxeTODO contained TODO FIXME XXX
syn match haxeComment "//.*" contains=haxeTODO,@Spell
syn region haxeComment2 start=+/\*+ end=+\*/+ contains=haxeTODO,@Spell

" preprocessing
" -------------
syn match haxePre "\(#if\|#elseif\|#else\|#error\|#end\)"
syn match haxePreError "#error"

" regex
" -----
syn region haxeRegex start=+\~\/+ end=+\/+ contains=haxeRegexEscape,haxeRegexError,@Spell

syn match haxeRegexError contained "\\[^0-9bdnrstwxBDSW(){}\[\]\\$^*\-+|./?]"
syn match haxeRegexEscape contained "\\[0-9bdnrstwxBDSW(){}\[\]\\$^*\-+|./?]"

" meta
" ----
syn match haxeMeta "@:\?[a-zA-Z_][a-zA-Z_0-9]*\>"

syn match haxeCompilerMeta "@:\(
    \abi
    \\|abstract
    \\|access
    \\|allow
    \\|analyzer
    \\|annotation
    \\|arrayAccess
    \\|astSource
    \\|autoBuild
    \\|bind
    \\|bitmap
    \\|bridgeProperties
    \\|build
    \\|buildXml
    \\|callable
    \\|classCode
    \\|commutative
    \\|const
    \\|coreApi
    \\|coreType
    \\|cppFileCode
    \\|cppInclude
    \\|cppNamespaceCode
    \\|cs.assemblyMeta
    \\|cs.assemblyStrict
    \\|cs.using
    \\|dce
    \\|debug
    \\|decl
    \\|delegate
    \\|depend
    \\|deprecated
    \\|eager
    \\|enum
    \\|event
    \\|expose
    \\|extern
    \\|file
    \\|fileXml
    \\|final
    \\|fixed
    \\|flash.property
    \\|font
    \\|forward
    \\|forward.new
    \\|forward.variance
    \\|forwardStatics
    \\|from
    \\|functionCode
    \\|functionTailCode
    \\|generic
    \\|genericBuild
    \\|getter
    \\|hack
    \\|headerClassCode
    \\|headerCode
    \\|headerNamespaceCode
    \\|hlNative
    \\|hxGen
    \\|ifFeature
    \\|include
    \\|inheritDoc
    \\|inline
    \\|internal
    \\|isVar
    \\|java.native
    \\|javaCanonical
    \\|jsRequire
    \\|jvm.synthetic
    \\|keep
    \\|keepInit
    \\|keepSub
    \\|luaDotMethod
    \\|luaRequire
    \\|macro
    \\|markup
    \\|mergeBlock
    \\|multiReturn
    \\|multiType
    \\|native
    \\|nativeChildren
    \\|native
    \\|nativeChildren
    \\|nativeGen
    \\|nativeProperty
    \\|nativeStaticExtension
    \\|noClosure
    \\|noCompletion
    \\|noDoc
    \\|noImportGlobal
    \\|noPrivateAccess
    \\|noStack
    \\|noUsing
    \\|noVirtual
    \\|notNull
    \\|nullSafety
    \\|objc
    \\|objcProtocol
    \\|op
    \\|optional
    \\|overload
    \\|persistent
    \\|php.attribute
    \\|phpClassConst
    \\|phpGlobal
    \\|phpMagic
    \\|phpNoConstructor
    \\|pos
    \\|private
    \\|privateAccess
    \\|property
    \\|protected
    \\|publicFields
    \\|pure
    \\|pythonImport
    \\|readOnly
    \\|remove
    \\|require
    \\|resolve
    \\|rtti
    \\|runtimeValue
    \\|scalar
    \\|selfCall
    \\|semantics
    \\|setter
    \\|sound
    \\|sourceFile
    \\|stackOnly
    \\|strict
    \\|struct
    \\|structAccess
    \\|structInit
    \\|suppressWarnings
    \\|templateCall
    \\|throws
    \\|to
    \\|transient
    \\|transitive
    \\|unifyMinDynamic
    \\|unreflective
    \\|unsafe
    \\|using
    \\|void
    \\|volatile
    \\)\>"


syn sync ccomment haxeComment2 minlines=10

HaxeHiLink haxeMeta Macro
HaxeHiLink haxeCompilerMeta Identifier
HaxeHiLink haxeRegex String
HaxeHiLink haxeDString String
HaxeHiLink haxeSString Character
HaxeHiLink haxeSpecialCharacter SpecialChar
HaxeHiLink haxeIntSpecialChar SpecialChar
HaxeHiLink haxeRegexEscape SpecialChar
HaxeHiLink haxeErrorCharacter Error
HaxeHiLink haxeRegexError Error
HaxeHiLink haxeInterpolatedIdent Normal
HaxeHiLink haxeInterpolated Normal
HaxeHiLink haxeError Error
HaxeHiLink haxeOperator Operator
HaxeHiLink haxeOperator2 Identifier
HaxeHiLink haxeSpecial SpecialChar
HaxeHiLink haxeInt Number
HaxeHiLink haxeFloat Float
HaxeHiLink haxeBool Boolean
HaxeHiLink haxeComment Comment
HaxeHiLink haxeComment2 Comment
HaxeHiLink haxeTODO Todo
HaxeHiLink haxePre PreCondit
HaxeHiLink haxePreError PreProc
HaxeHiLink haxeType Type
HaxeHiLink haxeTypedef Typedef
HaxeHiLink haxeTypeDecl Keyword " Structure just gives me same colour as Type and looks bad.
HaxeHiLink haxeStorageClass StorageClass
HaxeHiLink haxeException Exception
HaxeHiLink haxeRepeat Repeat
HaxeHiLink haxeLabel Label
HaxeHiLink haxeConditional Conditional
HaxeHiLink haxeConstant Constant
HaxeHiLink haxeFunction Function
HaxeHiLink haxeKeyword Keyword

delcommand HaxeHiLink

let b:current_syntax = "haxe"
let b:spell_options = "contained"

" vim: ts=8
