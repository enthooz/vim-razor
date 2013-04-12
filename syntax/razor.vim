" Vim syntax file
" Language:     Razor Templates
" Maintainer:   Andrew Ashbacher <aashbacher@sorensonmedia.com>
" Last Change:  7 Feb 2010
" Filenames:    *.cshtml
"
"
" Syntax Groups from C#:
"
""" The default highlighting.
" hi def link csType                    Type
" hi def link csStorage                 StorageClass
" hi def link csRepeat                  Repeat
" hi def link csConditional             Conditional
" hi def link csLabel                   Label
" hi def link csModifier                StorageClass
" hi def link csConstant                Constant
" hi def link csException               Exception
" hi def link csUnspecifiedStatement    Statement
" hi def link csUnsupportedStatement    Statement
" hi def link csUnspecifiedKeyword      Keyword
" hi def link csContextualStatement     Statement
" hi def link csOperatorError           Error
" 
" hi def link csTodo                    Todo
" hi def link csComment                 Comment
" 
" hi def link csSpecialError            Error
" hi def link csSpecialCharError        Error
" hi def link csString                  String
" hi def link csVerbatimString          String
" hi def link csVerbatimSpec            SpecialChar
" hi def link csPreCondit               PreCondit
" hi def link csCharacter               Character
" hi def link csSpecialChar             SpecialChar
" hi def link csNumber                  Number
" hi def link csUnicodeNumber           SpecialChar
" hi def link csUnicodeSpecifier        SpecialChar
"
""" xml markup
" hi def link csXmlCommentLeader        Comment
" hi def link csXmlComment              Comment
" hi def link csXmlTag                  Statement


if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'razor'
endif

syn clear

syn include @csharp syntax/cs.vim
runtime! syntax/html.vim

" razor keywords
syn cluster razorKeywords       contains=razorRepeat,razorConditional,razorLabel,razorSpecialKeywords
syn keyword razorRepeat         break continue do for foreach goto return while
syn keyword razorConditional    else if switch
syn keyword razorLabel          case default

syn keyword razorSpecialKeywords    using model contained

syn match razorIdentifier         /\(\h\+\)/ contained

"syn match razorSpecial          "@model \.*$" contains=razorAtSign,razorVariable,razorMaybeVariable skipwhite


syn match razorAtSign "@" contained
"syn match razorAtSign "@"

"syn region double_bracket start=/{/ end=/}/ contains=double_bracket

" XML nodes
"syn match ins /.*/ contained

" db (double_quotes "...")
syn region dq matchgroup=String start=/"/ end=/"/ contains=dq,razor keepend contained
syn region br matchgroup=String start=/{/ end=/}/ contains=dq,razor keepend contained
syn region razorParan matchgroup=Razor start=/(/ skip=/([^)]*)/ end=/)/ contains=@csharp,razorParan contained


"syn region razor matchgroup=Statement start=/@/ end=/[^<]/ contains=dq
"syn region razor matchgroup=Error start=/@/ end=/$/ contains=dq contained
syn match   razorString     /"\([^"]\+\)"/ contained

"syn region  razorBlock  start=/@\h\+ (.*)\n{/ end=/}/ contains=@razorKeywords,razorIdentifier,razorAtSign,razorString,razorParan,br skipnl skipwhite skipempty

syn match   razor           /@\(\h\+\)\(\.\h\+\)*/ contained contains=dq,razorAtSign,razorIdentifier,dot,razorString,@razorKeywords
syn match   razor           /@\(\h\+\)\(\.\h\+\)*/ contains=dq,razorAtSign,razorIdentifier,dot,razorString,@razorKeywords
syn match  razorStatement  /@\(\h\+\)*\(\.\h\+\)\s*(.*)/ contains=@razorKeywords,razorIdentifier,razorAtSign,razorString,razorParan,br


"syn region razorStatement start=/@using\s*([^)]\+)\s*/ end=/}/ contains=razorAtSign, @csharp
syn region razorComment matchgroup=Comment start=/@\*/ end=/\*@/
"syn region xml_end_tag start=/<\// end=/>/ excludenl
"syn region xml_start_tag start=/<[^\/]/ end=/>/

" cs (C# code)
syn region razorMultiline start=/@{/ skip=/{[^}]*}/ end=/}/ contains=razorAtSign, @csharp

syn region  htmlString   contained start=+"+ end=+"+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc,razorStatement,razor
"syn region  htmlString   contained start=+'+ end=+'+ contains=htmlSpecialChar,javaScriptExpression,@htmlPreproc,razorAtSign,razorVariable,razorMaybeVariable
syn region htmlLink start="<a\>\_[^>]*\<href\>" end="</a>"me=e-4 contains=@Spell,htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,javaScript,@htmlPreproc,razor,razorStatement

syn cluster htmlTop contains=@Spell,htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,htmlLink,javaScript,@htmlPreproc,razorStatement,razor

"syn cluster htmlTop contains=@Spell,htmlTag,htmlEndTag,htmlSpecialChar,htmlPreProc,htmlComment,htmlLink,javaScript,@htmlPreproc,razorAtSign,razor

"syn keyword razorSpecial "@model"

hi def link razorRepeat         Repeat
hi def link razorConditional    Conditional
hi def link razorLabel          Label
hi def link razorSpecial        Keyword
hi def link razorString         String

hi def link razor               Statement
"hi def link razorVariable       Identifier
"hi def link razorMaybeVariable  Identifier
hi def link razorAtSign         Constant
hi def link razorIdentifier     Identifier
hi def link razor               Statement
hi def link razorStatement      PreProc
hi def link razorBlock          PreProc
hi def link dot                 Constant
hi def link razorComment        Comment
hi def link razorSpecialKeywords    Keyword
hi def link razorMultiline      PreProc

"hi def link xml_end_tag Error
"hi def link xml_start_tag Error

let b:current_syntax = "razor"

if main_syntax == 'razor'
  unlet main_syntax
endif
