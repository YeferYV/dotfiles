set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='leet'

"--  leet
hi   Boolean                               guifg=#1cff1c  guibg=none     gui=none
hi   Character                             guifg=#ff4400  guibg=none     gui=none
hi   ColorColumn                           guifg=none     guibg=none     gui=none
hi   Comment                               guifg=#555555  guibg=none     gui=none
hi   Conceal                               guifg=none     guibg=none     gui=none
hi   Conditional                           guifg=#5555ff  guibg=none     gui=none
hi   Constant                              guifg=#bbbb00  guibg=none     gui=none
hi   Cursor                                guifg=#5555ff  guibg=none     gui=none
hi   CursorColumn                          guifg=none     guibg=none     gui=none
hi   CursorLine                            guifg=none     guibg=#080808  gui=none
hi   CursorLineFold                        guifg=none     guibg=#080811  gui=none
hi   CursorLineNr                          guifg=#cccccc  guibg=none     gui=none
hi   CursorLineSign                        guifg=none     guibg=none     gui=none
hi   Debug                                 guifg=#ff4400  guibg=none     gui=none
hi   Define                                guifg=#1c1cff  guibg=none     gui=none
hi   Delimiter                             guifg=#7574a5  guibg=none     gui=none
hi   Directory                             guifg=#555555  guibg=none     gui=bold
hi   Error                                 guifg=#ff0000  guibg=none     gui=none
hi   ErrorMsg                              guifg=#ff0000  guibg=none     gui=none
hi   Exception                             guifg=#bb0000  guibg=none     gui=none
hi   ExtraWhitespace                       guifg=none     guibg=#ff0000  gui=none
hi   Float                                 guifg=#008888  guibg=none     gui=none
hi   FloatBorder                           guifg=none     guibg=none     gui=none
hi   FoldColumn                            guifg=none     guibg=none     gui=none
hi   Folded                                guifg=none     guibg=#0000ff  gui=none
hi   Function                              guifg=#008800  guibg=none     gui=none
hi   Identifier                            guifg=#5e81ac  guibg=none     gui=none
hi   Ignore                                guifg=none     guibg=none     gui=bold
hi   Include                               guifg=#4141ad  guibg=none     gui=bold
hi   IncSearch                             guifg=#ffff00  guibg=#5555ff  gui=none
hi   Keyword                               guifg=#5555ff  guibg=none     gui=bold
hi   Label                                 guifg=#5e81ac  guibg=none     gui=none
hi   LineNr                                guifg=#555555  guibg=none     gui=none
hi   Macro                                 guifg=#1c1cff  guibg=none     gui=none
hi   MatchParen                            guifg=#ff0000  guibg=#ffff00  gui=none
hi   NonText                               guifg=#000000  guibg=none     gui=none
hi   Normal                                guifg=none     guibg=none     gui=none
hi   Number                                guifg=#1cff1c  guibg=none     gui=none
hi   Operator                              guifg=#5555ff  guibg=none     gui=none
hi   Pmenu                                 guifg=#888888  guibg=none     gui=none
hi   PmenuSbar                             guifg=#ff0000  guibg=none     gui=none
hi   PmenuSel                              guifg=none     guibg=#1c1c1c  gui=none
hi   PmenuThumb                            guifg=none     guibg=#555555  gui=none
hi   PreProc                               guifg=#1c1cff  guibg=none     gui=none
hi   Question                              guifg=#00ff00  guibg=none     gui=none
hi   QuickFixLine                          guifg=#00ff00  guibg=none     gui=none
hi   Repeat                                guifg=#5555ff  guibg=none     gui=none
hi   Search                                guifg=#5555ff  guibg=#ffff00  gui=none
hi   SignColumn                            guifg=none     guibg=none     gui=none
hi   Special                               guifg=#7574a5  guibg=none     gui=none
hi   SpecialChar                           guifg=#7574a5  guibg=none     gui=none
hi   SpecialKey                            guifg=#008888  guibg=none     gui=none
hi   SpecialComment                        guifg=#555555  guibg=#5555ff  gui=none
hi   Statement                             guifg=#5555ff  guibg=none     gui=bold
hi   StatusLine                            guifg=#1c1cff  guibg=none     gui=bold
hi   StatusLineNC                          guifg=#1c1cff  guibg=none     gui=none
hi   StorageClass                          guifg=#880088  guibg=none     gui=none
hi   String                                guifg=#ffff00  guibg=none     gui=none
hi   Structure                             guifg=#880088  guibg=none     gui=none
hi   Substitute                            guifg=#5555ff  guibg=#ffff00  gui=none
hi   Tag                                   guifg=#81b38c  guibg=none     gui=none
hi   Title                                 guifg=#5555ff  guibg=none     gui=bold
hi   Todo                                  guifg=#ff4400  guibg=none     gui=none
hi   Type                                  guifg=#880088  guibg=none     gui=none
hi   Typedef                               guifg=#5e81ac  guibg=none     gui=none
hi   Underlined                            guifg=none     guibg=none     gui=underline
hi   VertSplit                             guifg=#555555  guibg=none     gui=none
hi   visual                                guifg=none     guibg=#1c1c1c  gui=none
hi   WarningMsg                            guifg=#ff0000  guibg=none     gui=none
hi   WildMenu                              guifg=#ff0000  guibg=none     gui=none

"--  Treesitter
hi   link @boolean                         Boolean
hi   link @character                       Character
hi   link @character.special               SpecialChar
hi   link @comment                         Comment
hi   link @conditional                     Conditional
hi   link @constant                        Constant
hi   link @constant.builtin                TSConstBuiltin              " Special
hi   link @constant.macro                  TSConstMacro                " Define
hi   link @constructor                     TSConstructor               " Special
hi   link @debug                           Debug
hi   link @define                          Define
hi   link @exception                       Exception
hi   link @field                           TSField                     " Identifier
hi   link @float                           Float
hi   link @function                        Function
hi   link @function.builtin                TSFuncBuiltin               " Special
hi   link @function.macro                  TSFuncMacro                 " Macro
hi   link @include                         Include
hi   link @keyword                         Keyword
hi   link @keyword.function                TSKeywordFunction
hi   link @keyword.operator                TSKeywordOperator
hi   link @keyword.return                  TSKeywordReturn
hi   link @label                           Label
hi   link @macro                           Macro
hi   link @method                          TSMethod                    " Function
hi   link @namespace                       TSNamespace                 " Identifier
hi   link @number                          Number
hi   link @operator                        Operator
hi   link @parameter                       TSParameter                 " Identifier
hi   link @parameter.reference             TSParameterReference
hi   link @preproc                         Preproc
hi   link @property                        TSProperty                  " Identifier
hi   link @punctuation                     TSPunc                      " Delimiter
hi   link @punctuation.bracket             TSPunctBracket
hi   link @punctuation.delimiter           TSPunctDelimiter
hi   link @punctuation.special             TSPunctSpecial
hi   link @repeat                          Repeat
hi   link @storageclass                    StorageClass
hi   link @string                          String
hi   link @string.escape                   TSStringEscape              " SpecialChar
hi   link @string.special                  TSStringRegex               " SpecialChar
hi   link @structure                       Structure
hi   link @tag                             Tag
hi   link @tag.attribute                   TSAttribute
hi   link @tag.delimiter                   TSTagDelimiter
hi   link @text.literal                    TSLiteral                   " Comment
hi   link @text.reference                  TSTextReference             " Identifier
hi   link @text.title                      Title
hi   link @text.todo                       Todo
hi   link @text.underline                  Underlined
hi   link @text.uri                        TSURI                       " Underined
hi   link @type                            Type
hi   link @type.builtin                    TSTypeBuiltin
hi   link @type.definition                 Typedef
hi   link @variable                        TSVariable                  " Identifier
hi   link @variable.builtin                TSVariableBuiltin

hi   TSAnnotation                          guifg=#008800  guibg=none     gui=none
hi   TSAttribute                           guifg=#7acaca  guibg=none     gui=none
hi   TSBoolean                             guifg=#1cff1c  guibg=none     gui=none
hi   TSCharacter                           guifg=#ff4400  guibg=none     gui=none
hi   TSComment                             guifg=#555555  guibg=none     gui=none
hi   TSConditional                         guifg=#5555ff  guibg=none     gui=none
hi   TSConstBuiltin                        guifg=#1cff1c  guibg=none     gui=none
hi   TSConstMacro                          guifg=#ff4400  guibg=none     gui=none
hi   TSConstant                            guifg=#bbbb00  guibg=none     gui=none
hi   TSConstructor                         guifg=#515171  guibg=none     gui=none
hi   TSDanger                              guifg=#bb0000  guibg=none     gui=none
hi   TSEmphasis                            guifg=#888888  guibg=none     gui=none
hi   TSError                               guifg=#ff0000  guibg=none     gui=none
hi   TSException                           guifg=#bb0000  guibg=none     gui=none
hi   TSField                               guifg=#5e81ac  guibg=none     gui=none
hi   TSFloat                               guifg=#008888  guibg=none     gui=none
hi   TSFuncBuiltin                         guifg=#5c5cff  guibg=none     gui=bold
hi   TSFuncMacro                           guifg=#1c1cff  guibg=none     gui=none
hi   TSFunction                            guifg=#008800  guibg=none     gui=none
hi   TSInclude                             guifg=#4141ad  guibg=none     gui=bold
hi   TSKeyword                             guifg=#4141ad  guibg=none     gui=none
hi   TSKeywordFunction                     guifg=#5555ff  guibg=none     gui=none
hi   TSKeywordOperator                     guifg=#5555ff  guibg=none     gui=none
hi   TSKeywordReturn                       guifg=#5555ff  guibg=none     gui=none
hi   TSLabel                               guifg=#5e81ac  guibg=none     gui=none
hi   TSLiteral                             guifg=#008800  guibg=none     gui=bold
hi   TSMethod                              guifg=#7574a5  guibg=none     gui=none
hi   TSNamespace                           guifg=#5555ff  guibg=none     gui=none
hi   TSNone                                guifg=#bbbbbb  guibg=none     gui=none
hi   TSNote                                guifg=#ffff00  guibg=none     gui=none
hi   TSNumber                              guifg=#1cff1c  guibg=none     gui=none
hi   TSOperator                            guifg=#5555ff  guibg=none     gui=none
hi   TSParameter                           guifg=#5e81ac  guibg=none     gui=none
hi   TSParameterReference                  guifg=#880088  guibg=none     gui=none
hi   TSProperty                            guifg=#7acaca  guibg=none     gui=none
hi   TSPunc                                guifg=#e8e8e8  guibg=none     gui=none
hi   TSPunctBracket                        guifg=#81b38c  guibg=none     gui=none
hi   TSPunctDelimiter                      guifg=#e8e8e8  guibg=none     gui=none
hi   TSPunctSpecial                        guifg=#81b38c  guibg=none     gui=none
hi   TSRepeat                              guifg=#5555ff  guibg=none     gui=none
hi   TSStrike                              guifg=none     guibg=none     gui=standout
hi   TSString                              guifg=#ffff00  guibg=none     gui=none
hi   TSStringEscape                        guifg=#00ff00  guibg=none     gui=none
hi   TSStringRegex                         guifg=#008800  guibg=none     gui=none
hi   TSSymbol                              guifg=#888888  guibg=none     gui=none
hi   TSTag                                 guifg=#81b38c  guibg=none     gui=none
hi   TSTagDelimiter                        guifg=#81b38c  guibg=none     gui=none
hi   TSText                                guifg=#ff0000  guibg=none     gui=none
hi   TSTextReference                       guifg=#ffffff  guibg=none     gui=none
hi   TSTitle                               guifg=#5555ff  guibg=none     gui=bold
hi   TSType                                guifg=#880088  guibg=none     gui=none
hi   TSTypeBuiltin                         guifg=#5e81ac  guibg=none     gui=none
hi   TSURI                                 guifg=#7acaca  guibg=none     gui=bold
hi   TSUnderline                           guifg=none     guibg=none     gui=underline
hi   TSVariable                            guifg=#cccccc  guibg=none     gui=none
hi   TSVariableBuiltin                     guifg=#515171  guibg=none     gui=none
hi   TSWarning                             guifg=#bbbb00  guibg=none     gui=none

"--  LSP
hi   LspReferenceText                      guifg=none     guibg=#111111  gui=none
hi   LspReferenceRead                      guifg=none     guibg=#1c1c1c  gui=none
hi   LspReferenceWrite                     guifg=none     guibg=#222222  gui=none
hi   LspDiagnosticsDefaultError            guifg=#ff0000  guibg=none     gui=none
hi   LspDiagnosticsDefaultWarning          guifg=#ff4400  guibg=none     gui=none
hi   LspDiagnosticsDefaultInformation      guifg=#ff8800  guibg=none     gui=none
hi   LspDiagnosticsDefaultHint             guifg=#bbbb00  guibg=none     gui=none
hi   LspDiagnosticsVirtualTextError        guifg=#ff0000  guibg=none     gui=none
hi   LspDiagnosticsVirtualTextWarning      guifg=#ff4400  guibg=none     gui=none
hi   LspDiagnosticsVirtualTextInformation  guifg=#ff8800  guibg=none     gui=none
hi   LspDiagnosticsVirtualTextHint         guifg=#bbbb00  guibg=none     gui=none
hi   LspDiagnosticsUnderlineError          guifg=#ff0000  guibg=none     gui=none
hi   LspDiagnosticsUnderlineWarning        guifg=#ff4400  guibg=none     gui=none
hi   LspDiagnosticsUnderlineInformation    guifg=#ff8800  guibg=none     gui=none
hi   LspDiagnosticsUnderlineHint           guifg=#bbbb00  guibg=none     gui=none
hi   LspDiagnosticsFloatingError           guifg=#ff0000  guibg=none     gui=none
hi   LspDiagnosticsFloatingWarning         guifg=#ff4400  guibg=none     gui=none
hi   LspDiagnosticsFloatingInformation     guifg=#ff8800  guibg=none     gui=none
hi   LspDiagnosticsFloatingHint            guifg=#bbbb00  guibg=none     gui=none
hi   LspDiagnosticsSignError               guifg=#ff0000  guibg=none     gui=none
hi   LspDiagnosticsSignWarning             guifg=#ff4400  guibg=none     gui=none
hi   LspDiagnosticsSignInformation         guifg=#ff8800  guibg=none     gui=none
hi   LspDiagnosticsSignHint                guifg=#bbbb00  guibg=none     gui=none

"--  Diagnostics
hi   DiagnosticError                       guifg=#ff0000  guibg=none     gui=none
hi   DiagnosticWarn                        guifg=#ff4400  guibg=none     gui=none
hi   DiagnosticHint                        guifg=#ff8800  guibg=none     gui=none
hi   DiagnosticInfo                        guifg=#bbbb00  guibg=none     gui=none
hi   DiagnosticSignError                   guifg=#ff0000  guibg=none     gui=none
hi   DiagnosticSignWarn                    guifg=#ff4400  guibg=none     gui=none
hi   DiagnosticSignHint                    guifg=#ff8800  guibg=none     gui=none
hi   DiagnosticSignInfo                    guifg=#bbbb00  guibg=none     gui=none

"--  Diff
hi   DiffAdd                               guifg=#ffffff  guibg=#0000ff  gui=none
hi   DiffChange                            guifg=#888888  guibg=none     gui=underline
hi   DiffDelete                            guifg=#ffffff  guibg=#ff0000  gui=none
hi   DiffText                              guifg=#ffffff  guibg=#444444  gui=none

"--  Bufferline
hi   BufferLineFill                        guifg=none     guibg=none     gui=none
hi   BufferLineBackground                  guifg=#616161  guibg=#0b0b0b  gui=none
hi   BufferLineBuffer                      guifg=none     guibg=none     gui=none
hi   BufferLineBufferSelected              guifg=#4141ad  guibg=#111111  gui=none
hi   BufferLineBufferVisible               guifg=#a1a1ad  guibg=#111111  gui=none
hi   BufferLineCloseButton                 guifg=#616161  guibg=#0b0b0b  gui=none
hi   BufferLineCloseButtonSelected         guifg=#4141ad  guibg=#111111  gui=none
hi   BufferLineCloseButtonVisible          guifg=#a1a1ad  guibg=#111111  gui=none
hi   BufferLineTab                         guifg=#616161  guibg=none     gui=none
hi   BufferLineTabClose                    guifg=#616161  guibg=none     gui=none
hi   BufferLineTabSelected                 guifg=#4141ad  guibg=none     gui=none
hi   BufferLineTabSeparator                guifg=#000000  guibg=none     gui=none
hi   BufferLineTabSeparatorSelected        guifg=#000000  guibg=none     gui=none
hi   BufferLineDupllicate                  guifg=#616161  guibg=#0b0b0b  gui=underline
hi   BufferLineDupllicateSelected          guifg=#4141ad  guibg=#111111  gui=underline
hi   BufferLineDupllicateVisible           guifg=#a1a1ad  guibg=#111111  gui=underline
hi   BufferLineModified                    guifg=#616161  guibg=#0b0b0b  gui=none
hi   BufferLineModifiedSelected            guifg=#4141ad  guibg=#111111  gui=none
hi   BufferLineModifiedVisible             guifg=#a1a1ad  guibg=#111111  gui=none
hi   BufferLineSeparator                   guifg=#000000  guibg=none     gui=none
hi   BufferLineSeparatorSelected           guifg=#000000  guibg=none     gui=none
hi   BufferLineSeparatorVisible            guifg=#111111  guibg=#111111  gui=none
hi   BufferLineIndicatorSelected           guifg=#111111  guibg=#111111  gui=none
hi   BufferLineIndicatorVisible            guifg=none     guibg=none     gui=none

"--  Cmp
hi   link CmpItemAbbr                      Pmenu
hi   link CmpItemAbbrMatch                 WildMenu     " guifg=#4141ad
hi   link CmpItemAbbrMatchFuzzyDefault     PmenuSbar
hi   link CmpItemKind                      PmenuSbar    " guifg=#7574a5
hi   link CmpItemMenu                      Comment

"--  git
hi   GitSignsAdd                           guifg=#005500  guibg=none     gui=none
hi   GitSignsChange                        guifg=#1c1cff  guibg=none     gui=none
hi   GitSignsDelete                        guifg=#880000  guibg=none     gui=none

"--  Illuminate
hi   def IlluminatedWordText               guifg=none     guibg=#080811  gui=none
hi   def IlluminatedWordRead               guifg=none     guibg=#080811  gui=none
hi   def IlluminatedWordWrite              guifg=none     guibg=#080811  gui=none

"--  Indentline
hi   IndentBlanklineChar                   guifg=#222222  guibg=none     gui=none
hi   IndentBlanklineSpaceChar              guifg=#b0b0b0  guibg=none     gui=none
hi   IndentBlanklineSpaceCharBlankline     guifg=#0000FF  guibg=none     gui=none
hi   IndentBlanklineContextChar            guifg=#444444  guibg=none     gui=none
hi   IndentBlanklineContextSpaceChar       guifg=#0000FF  guibg=none     gui=none
hi   IndentBlanklineContextStart           guifg=none     guibg=none     gui=none

"--  nvimtree
hi   NvimTreeCursorLine                    guifg=none     guibg=#111111  gui=none
hi   NvimTreeExecFile                      guifg=#00ff00  guibg=none     gui=bold
hi   NvimTreeFolderIcon                    guifg=#727c8c  guibg=none     gui=none
hi   NvimTreeFolderName                    guifg=#727c8c  guibg=none     gui=none
hi   NvimTreeGitNew                        guifg=#495466  guibg=none     gui=none
hi   NvimTreeIndentMarker                  guifg=#495466  guibg=none     gui=none
hi   NvimTreeImageFile                     guifg=#495499  guibg=none     gui=none
hi   NvimTreeRootFolder                    guifg=#495466  guibg=none     gui=bold
hi   NvimTreeSpecialFile                   guifg=#b2b2b2  guibg=none     gui=none
hi   NvimTreeStatusLine                    guifg=none     guibg=none     gui=none
