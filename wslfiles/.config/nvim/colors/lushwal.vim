set background=dark
if exists('g:colors_name')
hi clear
if exists('syntax_on')
syntax reset
endif
endif
let g:colors_name = 'lushwal'
highlight Normal guifg=#C0BFC0 guibg=#090609 guisp=NONE blend=NONE gui=NONE
highlight! link User Normal
highlight Bold guifg=#C0BFC0 guibg=#090609 guisp=NONE blend=NONE gui=bold
highlight Boolean guifg=#3A5E6E guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Character guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight ColorColumn guifg=#585658 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Comment guifg=#828282 guibg=NONE guisp=NONE blend=NONE gui=italic
highlight Conceal guifg=#464446 guibg=#090609 guisp=NONE blend=NONE gui=NONE
highlight! link Whitespace Conceal
highlight Conditional guifg=#B1B3B9 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Constant guifg=#3A5E6E guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Cursor guifg=#090609 guibg=#C0BFC0 guisp=NONE blend=NONE gui=NONE
highlight CursorColumn guifg=#585658 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight CursorLine guifg=#464446 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight CursorLineNr guifg=#828282 guibg=#090609 guisp=NONE blend=NONE gui=NONE
highlight Debug guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Define guifg=#B1B3B9 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Delimiter guifg=#345A6F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight DiagnosticError guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight DiagnosticHint guifg=#8D9385 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight DiagnosticInfo guifg=#73827C guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight DiagnosticUnderlineError guifg=#294E65 guibg=NONE guisp=#294E65 blend=NONE gui=underline
highlight DiagnosticUnderlineHint guifg=#8D9385 guibg=NONE guisp=#8D9385 blend=NONE gui=underline
highlight DiagnosticUnderlineInfo guifg=#73827C guibg=NONE guisp=#73827C blend=NONE gui=underline
highlight DiagnosticUnderlineWarn guifg=#4B6A72 guibg=NONE guisp=#4B6A72 blend=NONE gui=underline
highlight DiagnosticWarn guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight DiffAdd guifg=#3C5A68 guibg=#464446 guisp=NONE blend=NONE gui=bold
highlight! link DiffAdded DiffAdd
highlight DiffChange guifg=#6E6E6E guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight DiffDelete guifg=#294E65 guibg=#464446 guisp=NONE blend=NONE gui=bold
highlight! link DiffRemoved DiffDelete
highlight! link diffRemoved DiffDelete
highlight DiffFile guifg=#294E65 guibg=#090609 guisp=NONE blend=NONE gui=NONE
highlight DiffLine guifg=#73827C guibg=#090609 guisp=NONE blend=NONE gui=NONE
highlight DiffNewFile guifg=#3C5A68 guibg=#090609 guisp=NONE blend=NONE gui=NONE
highlight DiffText guifg=#73827C guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight Directory guifg=#73827C guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight EndOfBuffer guifg=#C0BFC0 guibg=#090609 guisp=NONE blend=NONE gui=NONE
highlight Error guifg=#294E65 guibg=#C0BFC0 guisp=NONE blend=NONE gui=NONE
highlight ErrorMsg guifg=#294E65 guibg=#090609 guisp=NONE blend=NONE gui=NONE
highlight Exception guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Float guifg=#3A5E6E guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight FoldColumn guifg=#73827C guibg=#090609 guisp=NONE blend=NONE gui=NONE
highlight Folded guifg=#828282 guibg=#464446 guisp=NONE blend=NONE gui=italic
highlight Function guifg=#73827C guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Identifier guifg=#8D9385 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight IncSearch guifg=#464446 guibg=#3A5E6E guisp=NONE blend=NONE gui=NONE
highlight Include guifg=#73827C guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Italic guifg=#C0BFC0 guibg=#090609 guisp=NONE blend=NONE gui=italic
highlight Keyword guifg=#B1B3B9 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Label guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight LineNr guifg=#6E6E6E guibg=#090609 guisp=NONE blend=NONE gui=NONE
highlight Macro guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MatchParen guifg=#C0BFC0 guibg=#6E6E6E guisp=NONE blend=NONE gui=NONE
highlight MiniCompletionActiveParameter guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniCursorword guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=underline
highlight! link MiniCursorwordCurrent MiniCursorword
highlight MiniIndentscopePrefix guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=nocombine
highlight MiniIndentscopeSymbol guifg=#464446 guibg=#090609 guisp=NONE blend=NONE gui=NONE
highlight MiniJump guifg=#73827C guibg=NONE guisp=#6E6E6E blend=NONE gui=underline
highlight MiniJump2dSpot guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=undercurl
highlight MiniStarterCurrent guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniStarterFooter guifg=#73827C guibg=NONE guisp=NONE blend=NONE gui=bold
highlight MiniStarterHeader guifg=#73827C guibg=NONE guisp=NONE blend=NONE gui=bold
highlight MiniStarterInactive guifg=#828282 guibg=NONE guisp=NONE blend=NONE gui=italic
highlight MiniStarterItem guifg=#C0BFC0 guibg=#090609 guisp=NONE blend=NONE gui=NONE
highlight MiniStarterItemBullet guifg=#345A6F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniStarterItemPrefix guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniStarterQuery guifg=#3C5A68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniStarterSection guifg=#345A6F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineDevinfo guifg=#828282 guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineFileinfo guifg=#828282 guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineFilename guifg=#4B6A72 guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineInactive guifg=#585658 guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineModeCommand guifg=#090609 guibg=#8D9385 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineModeInsert guifg=#090609 guibg=#73827C guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineModeNormal guifg=#090609 guibg=#3C5A68 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineModeOther guifg=#090609 guibg=#B1B3B9 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineModeReplace guifg=#090609 guibg=#294E65 guisp=NONE blend=NONE gui=NONE
highlight MiniStatuslineModeVisual guifg=#090609 guibg=#3A5E6E guisp=NONE blend=NONE gui=NONE
highlight MiniSurround guifg=#464446 guibg=#3A5E6E guisp=NONE blend=NONE gui=NONE
highlight MiniTablineCurrent guifg=#6E6E6E guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight MiniTablineFill guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MiniTablineHidden guifg=#3C5A68 guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight MiniTablineModifiedCurrent guifg=#828282 guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight MiniTablineModifiedHidden guifg=#585658 guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight MiniTablineModifiedVisible guifg=#828282 guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight MiniTablineVisible guifg=#6E6E6E guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight MiniTestEmphasis guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=bold
highlight MiniTestFail guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=bold
highlight MiniTestPass guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=bold
highlight MiniTrailspace guifg=#294E65 guibg=#C0BFC0 guisp=NONE blend=NONE gui=NONE
highlight ModeMsg guifg=#3C5A68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight MoreMsg guifg=#3C5A68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight NonText guifg=#6E6E6E guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Number guifg=#3A5E6E guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Operator guifg=#C0BFC0 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight PMenu guifg=#828282 guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight PMenuSel guifg=#C0BFC0 guibg=#73827C guisp=NONE blend=NONE gui=NONE
highlight PmenuSbar guifg=#585658 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight PmenuThumb guifg=#C0BFC0 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight PreProc guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Question guifg=#73827C guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Repeat guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Search guifg=#6E6E6E guibg=#4B6A72 guisp=NONE blend=NONE gui=NONE
highlight! link MiniTablineTabpagesection Search
highlight SignColumn guifg=#585658 guibg=#090609 guisp=NONE blend=NONE gui=NONE
highlight Special guifg=#8D9385 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight SpecialChar guifg=#345A6F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight SpecialKey guifg=#6E6E6E guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight SpellBad guifg=#294E65 guibg=NONE guisp=#294E65 blend=NONE gui=underline
highlight SpellCap guifg=#4B6A72 guibg=NONE guisp=#4B6A72 blend=NONE gui=underline
highlight SpellLocal guifg=#8D9385 guibg=NONE guisp=#8D9385 blend=NONE gui=underline
highlight SpellRare guifg=#B1B3B9 guibg=NONE guisp=#B1B3B9 blend=NONE gui=underline
highlight Statement guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight StatusLine guifg=#828282 guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight StatusLineNC guifg=#585658 guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight StatusLineTerm guifg=#50798B guibg=#3C5A68 guisp=NONE blend=NONE gui=NONE
highlight StatusLineTermNC guifg=#65909A guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight StorageClass guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight String guifg=#3C5A68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Structure guifg=#B1B3B9 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight TabLine guifg=#6E6E6E guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight TabLineFill guifg=#6E6E6E guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight TabLineSel guifg=#3C5A68 guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight Tag guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Title guifg=#73827C guibg=NONE guisp=NONE blend=NONE gui=bold
highlight Todo guifg=#4B6A72 guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight TooLong guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Type guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Typedef guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight Underlined guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight VertSplit guifg=#828282 guibg=#090609 guisp=NONE blend=NONE gui=NONE
highlight! link WinSeparator VertSplit
highlight Visual guifg=#090609 guibg=#585658 guisp=NONE blend=NONE gui=NONE
highlight VisualNOS guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight WarningMsg guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight WildMenu guifg=#C0BFC0 guibg=#73827C guisp=NONE blend=NONE gui=NONE
highlight WinBar guifg=#828282 guibg=#090609 guisp=NONE blend=NONE gui=NONE
highlight WinBarNC guifg=#585658 guibg=#090609 guisp=NONE blend=NONE gui=NONE
highlight gitCommitOverflow guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight gitCommitSummary guifg=#3C5A68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight helpCommand guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight helpExample guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @attribute guifg=#73827C guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @boolean guifg=#73827C guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @character guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @character.special guifg=#345A6F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @comment guifg=#828282 guibg=NONE guisp=NONE blend=NONE gui=italic
highlight @conditional guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @constant guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @constant.builtin guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @constant.macro guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @constructor guifg=#C0BFC0 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @debug guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @define guifg=#B1B3B9 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @exception guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @field guifg=#3C5A68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @float guifg=#73827C guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @function guifg=#73827C guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @function.builtin guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @function.macro guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @include guifg=#8D9385 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @keyword guifg=#B1B3B9 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @keyword.function guifg=#8D9385 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @keyword.operator guifg=#B1B3B9 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @label guifg=#8D9385 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @method guifg=#73827C guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @namespace guifg=#73827C guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @none guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @number guifg=#73827C guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @operator guifg=#C0BFC0 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @parameter guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @preproc guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @property guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @punctuation.bracket guifg=#C0BFC0 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @punctuation.delimiter guifg=#C0BFC0 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @punctuation.special guifg=#BEC6B3 guibg=NONE guisp=NONE blend=NONE gui=bold
highlight @repeat guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @storageclass guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @string guifg=#73827C guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @string.escape guifg=#3C5A68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @string.regex guifg=#3C5A68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @string.special guifg=#345A6F guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @symbol guifg=#8D9385 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @tag guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @tag.attribute guifg=#8D9385 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @tag.delimiter guifg=#8D9385 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text guifg=#3C5A68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.bold guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=bold
highlight @text.danger guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.diff.add guifg=#3C5A68 guibg=#464446 guisp=NONE blend=NONE gui=bold
highlight @text.diff.delete guifg=#294E65 guibg=#464446 guisp=NONE blend=NONE gui=bold
highlight @text.emphasis guifg=#B1B3B9 guibg=NONE guisp=NONE blend=NONE gui=italic
highlight @text.environment guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.environment.name guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.literal guifg=#3C5A68 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.math guifg=#8D9385 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.note guifg=#8D9385 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.reference guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @text.strike guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=strikethrough
highlight @text.title guifg=#73827C guibg=NONE guisp=NONE blend=NONE gui=bold
highlight @text.todo guifg=#4B6A72 guibg=#464446 guisp=NONE blend=NONE gui=NONE
highlight @text.underline guifg=NONE guibg=NONE guisp=NONE blend=NONE gui=underline
highlight @text.uri guifg=NONE guibg=#464446 guisp=NONE blend=NONE gui=underline
highlight @type guifg=#73827C guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @type.builtin guifg=#73827C guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @type.definition guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @variable guifg=#4B6A72 guibg=NONE guisp=NONE blend=NONE gui=NONE
highlight @variable.builtin guifg=#294E65 guibg=NONE guisp=NONE blend=NONE gui=NONE