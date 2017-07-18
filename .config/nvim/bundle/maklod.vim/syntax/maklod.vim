syn match varInput "\$[a-zA-Z0-9_]\+"
syn match varOutput "@[a-zA-Z0-9_]\+"
syn match varBool "?[a-zA-Z0-9_]\+"
syn match varOther "^[a-zA-Z0-9_]\+"
syn match varSpecial "\$[\$%]"
syn match functionName "[a-zA-Z0-9_]\+" nextgroup=parenStart contained
syn match arrayFunc "[\[\]*]"
syn match arrayApply "<="
syn match parenStart "("
syn match comment "#.*$"
syn match operator "[=:`]" nextgroup=arrayFunc,varInput,varOutput
syn keyword ruleDef rule nextgroup=functionName skipwhite
syn keyword whenCondition when
syn keyword someKeywords on if fi else elsif done do
"nextgroup=ruleName skipwhite
syn region string start=/"/ skip=/\\./ end=/"/ contains=varInput,varOutput,varBool
syn region functionCall matchgroup=functionCallOuter start="[a-zA-Z0-9_]\+(" end=")" contains=varInput,varOutput,varBool,varSpecial,arrayFunc,arrayApply,operator transparent

hi link varInput Identifier
hi link varOutput Special
hi link varBool Boolean
hi link varOther Float
hi link varSpecial Special
hi link comment Comment
hi link whenCondition Conditional
hi link someKeywords Conditional
hi link operator Operator
hi link ruleDef Keyword
hi link functionName Function
hi link arrayFunc Repeat
hi link arrayApply Repeat
hi link string String
hi link functionCallOuter Statement
