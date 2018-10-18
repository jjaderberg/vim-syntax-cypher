" Vim syntax file
" Language:         cypher
" Maintainer:       Jonatan Jäderberg
" Last Change:      2015-08-13
" Filenames:        *.cypher
" Version:          0.01

" Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax clear

syn case ignore

syn match       cypherComment       "\s*\/\/.*$"

syn keyword     cypherExternal      profile explain
syn keyword     cypherBoolean       true false
syn keyword     cypherClauseKeyword create match merge where with contained
" syn keyword     cypherClauseMatch   match contained
" syn keyword     cypherClauseMerge   merge contained
syn match       cypherClause        +\(CREATE\|MATCH\|MERGE\|WHERE\|WITH\).*+ contains=cypherClauseKeyword,cypherKeyword,cypherFunction,cypherLabel,cypherProperties,cypherRelationship transparent

" syn region      cypherMatch         start=+match+

syn keyword     cypherFunction      abs acos allShortestPaths asin atan atan2 avg ceil coalesce collect cos cot count degrees e endnode exp extract filter floor haversin head id keys labels last left length log log10 lower ltrim max min node nodes percentileCont percentileDisc pi radians rand range reduce rel relationship relationships replace right round rtrim shortestPath sign sin split sqrt startnode stdev stdevp str substring sum tail tan timestamp toFloat toInt trim type upper
syn keyword     cypherPredicate     all any has none single
syn keyword     cypherKeyword       as asc ascending assert by case commit constraint csv desc descending distinct drop else end fieldterminator from headers in index is limit load null on optional order periodic remove return scan set skip start then union unique unwind using when
" syn keyword     cypherClause        create cypher delete foreach match merge 

syn match       cypherOperator      /[*+\-<>=&|~%^]\|IN/
syn keyword     cypherOperator      and or xor not in

syn match       cypherString        /"[^"]*[^\\]"/hs=s+1,he=e-1
syn match       cypherString        /'[^']*[^\\]'/hs=s+1,he=e-1

syn match       cypherRelationshipType ":[A-Z_]\+"
syn match       cypherRelationship  /\(<-\[\|-\[\).\{-}\(\]->\|\]-\)/   contains=cypherProperties,cypherRelationshipType transparent
" syn match       cypherRelationship  /<\?-\[.\{-}\]->\?/


syn match       cypherLabel         /:\w\+/
" syn match       cypherAtom          /\w\+:\?\w\+/

syn match       cypherNumber        "-\=\<\d\+\>"               " contained display
syn match       cypherNumber        "\<0x\x\{1,8}\>"            " contained display
syn match       cypherNumber        "\<0b[01]\+\>"              " contained display
syn match       cypherNumber        "\(-\=\<\d+\|-\=\)\.\d\+\>" " contained display

syn match       cypherProperties    "{[^}]*}"                   contains=cypherPropertyName,cypherString,cypherNumber

syn match       cypherPropertyName  "\w\+\ze:"                  contained display
syn match       cypherPropertyName  "\w\+\.\w\+"                contained display


hi link cypherClauseKeyword     cypherKeyword

hi link cypherComment           Comment

hi link cypherFunction          Function
hi link cypherPredicate         PreProc
hi link cypherKeyword           Keyword

hi link cypherOperator          Operator

hi link cypherString            String
hi link cypherLabel             Label
" hi link cypherRelationship      Special
hi link cypherRelationshipType  Label
hi link cypherNumber            Number

" hi link cypherProperties        Special
hi link cypherProperties        SpecialChar
" hi link cypherProperties        Type
hi link cypherPropertyName      Normal

hi link cypherExternal          PreProc
hi link cypherBoolean           Boolean

" highlight cypherObject guifg=brown

let b:current_syntax = "cypher"
