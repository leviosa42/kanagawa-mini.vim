" Name:        Kanagawa-mini
" Description: A minimal color scheme ported from rebelot's kanagawa.nvim for Vim.
"              See also: https://github.com/rebelot/kanagawa.nvim
" Author:      leviosa42
" WebSite:     https://github.com/leviosa42/kanagawa-mini.vim
" License:     MIT license

let g:colors_name = expand('<sfile>:t:r')

set bg=dark
hi clear

if exists("syntax_on")
    syntax reset
endif

if !exists('kanagawa_mini')
    let g:kanagawa_mini = {}
endif

let s:config = {}
let s:config.undercurl = get(g:kanagawa_mini, 'undercurl', v:true)
let s:config.commentStyle = get(g:kanagawa_mini, 'commentStyle', 'italic')
let s:config.functionStyle = get(g:kanagawa_mini, 'functionStyle', 'NONE')
let s:config.keywordStyle = get(g:kanagawa_mini, 'keywordStyle', 'italic')
let s:config.statementStyle = get(g:kanagawa_mini, 'statementStyle', 'bold')
let s:config.typeStyle = get(g:kanagawa_mini, 'typeStyle', 'NONE')
" NOTE: The 'variablebuiltinStyle' option was originally for nvim-treesitter's '@variable.built-in'
"       and is therefore not supported.
let s:config.specialReturn = get(g:kanagawa_mini, 'specialReturn', v:true)
let s:config.specialExeption = get(g:kanagawa_mini, 'specialExeption', v:true)
let s:config.transparent = get(g:kanagawa_mini, 'transparent', v:false)
let s:config.dimInactive = get(g:kanagawa_mini, 'dimInactive', v:false)
" NOTE: It is unsupported because it is used to adjust the highlighting of the
"       window separator with laststatus=3.
let s:config.terminalColors = get(g:kanagawa_mini, 'terminalColors', v:true)
" NOTE: The 'colors' option is not yet implemented.
"let s:config.colors = get(g:kanagawa_mini, 'colors', {})
" NOTE: The 'overrides' option is not yet implemented.
"let s:config.overrides = get(g:kanagawa_mini, 'overrides', {})
let s:config.theme = get(g:kanagawa_mini, 'theme', 'default')

function! s:get_palette(theme) abort
    let l:palettes  = {
        \ 'default': {
            \ 'sumiInk0'      : '#16161D',
            \ 'sumiInk1b'     : '#181820',
            \ 'sumiInk1c'     : '#1a1a22',
            \ 'sumiInk1'      : '#1F1F28',
            \ 'sumiInk2'      : '#2A2A37',
            \ 'sumiInk3'      : '#363646',
            \ 'sumiInk4'      : '#54546D',
            \ 'waveBlue1'     : '#223249',
            \ 'waveBlue2'     : '#2D4F67',
            \ 'winterGreen'   : '#2B3328',
            \ 'winterYellow'  : '#49443C',
            \ 'winterRed'     : '#43242B',
            \ 'winterBlue'    : '#252535',
            \ 'autumnGreen'   : '#76946A',
            \ 'autumnRed'     : '#C34043',
            \ 'autumnYellow'  : '#DCA561',
            \ 'samuraiRed'    : '#E82424',
            \ 'roninYellow'   : '#FF9E3B',
            \ 'waveAqua1'     : '#6A9589',
            \ 'dragonBlue'    : '#658594',
            \ 'oldWhite'      : '#C8C093',
            \ 'fujiWhite'     : '#DCD7BA',
            \ 'fujiGray'      : '#727169',
            \ 'springViolet1' : '#938AA9',
            \ 'oniViolet'     : '#957FB8',
            \ 'crystalBlue'   : '#7E9CD8',
            \ 'springViolet2' : '#9CABCA',
            \ 'springBlue'    : '#7FB4CA',
            \ 'lightBlue'     : '#A3D4D5',
            \ 'waveAqua2'     : '#7AA89F',
            \ 'springGreen'   : '#98BB6C',
            \ 'boatYellow1'   : '#938056',
            \ 'boatYellow2'   : '#C0A36E',
            \ 'carpYellow'    : '#E6C384',
            \ 'sakuraPink'    : '#D27E99',
            \ 'waveRed'       : '#E46876',
            \ 'peachRed'      : '#FF5D62',
            \ 'surimiOrange'  : '#FFA066',
            \ 'katanaGray'    : '#717C7C'
            \ }
        \ }
    return l:palettes[a:theme]
endfunction

let s:p = s:get_palette(s:config.theme)

if s:config.terminalColors
    let g:terminal_ansi_colors = [
        \ '#090618',
        \ s:p.autumnRed,
        \ s:p.autumnGreen,
        \ s:p.boatYellow2,
        \ s:p.crystalBlue,
        \ s:p.oniViolet,
        \ s:p.waveAqua1,
        \ s:p.oldWhite,
        \ s:p.fujiGray,
        \ s:p.samuraiRed,
        \ s:p.springGreen,
        \ s:p.carpYellow,
        \ s:p.springBlue,
        \ s:p.springViolet1,
        \ s:p.waveAqua2,
        \ s:p.fujiWhite,
        \ ]
endif

let s:colors = {
    \ 'bg' : s:p.sumiInk1,
    \ 'bg_dim' : s:p.sumiInk1b,
    \ 'bg_dark' : s:p.sumiInk0,
    \ 'bg_light0' : s:p.sumiInk2,
    \ 'bg_light1' : s:p.sumiInk3,
    \ 'bg_light2' : s:p.sumiInk4,
    \ 'bg_light3' : s:p.springViolet1,
    \ 'bg_menu' : s:p.waveBlue1,
    \ 'bg_menu_sel' : s:p.waveBlue2,
    \ 'bg_status' : s:p.sumiInk0,
    \ 'bg_visual' : s:p.waveBlue1,
    \ 'bg_search' : s:p.waveBlue2,
    \ 'fg_border' : s:p.sumiInk4,
    \ 'fg_dark' : s:p.oldWhite,
    \ 'fg_reverse' : s:p.waveBlue1,
    \ 'fg_comment' : s:p.fujiGray,
    \ 'fg' : s:p.fujiWhite,
    \ 'fg_menu' : s:p.fujiWhite,
    \ 'co' : s:p.surimiOrange,
    \ 'st' : s:p.springGreen,
    \ 'nu' : s:p.sakuraPink,
    \ 'id' : s:p.carpYellow,
    \ 'fn' : s:p.crystalBlue,
    \ 'sm' : s:p.oniViolet,
    \ 'kw' : s:p.oniViolet,
    \ 'op' : s:p.boatYellow2,
    \ 'pp' : s:p.surimiOrange,
    \ 'ty' : s:p.waveAqua2,
    \ 'sp' : s:p.springBlue,
    \ 'sp2' : s:p.waveRed,
    \ 'sp3' : s:p.peachRed,
    \ 'br' : s:p.springViolet2,
    \ 're' : s:p.boatYellow2,
    \ 'dep' : s:p.katanaGray,
    \ 'diag' : {
        \ 'error' : s:p.samuraiRed,
        \ 'warning' : s:p.roninYellow,
        \ 'info' : s:p.dragonBlue,
        \ 'hint' : s:p.waveAqua1,
        \ },
    \ 'diff' : {
        \ 'add' : s:p.winterGreen,
        \ 'delete' : s:p.winterRed,
        \ 'change' : s:p.winterBlue,
        \ 'text' : s:p.winterYellow,
        \ },
    \ 'git' : {
        \ 'added' : s:p.autumnGreen,
        \ 'removed' : s:p.autumnRed,
        \ 'changed' : s:p.autumnYellow,
        \ },
    \ }

function! s:h(group, style) abort
    if empty(a:style)
        return
    endif
    if has_key(a:style, 'link')
        execute 'hi' 'link' a:group a:style.link
        return
    endif
    execute 'hi' a:group
    \ 'guibg=' . (has_key(a:style, 'bg')  ? a:style.bg  : 'NONE')
    \ 'guifg=' . (has_key(a:style, 'fg')  ? a:style.fg  : 'NONE')
    \ 'guisp=' . (has_key(a:style, 'sp')  ? a:style.sp  : 'NONE')
    \ 'gui='   . (has_key(a:style, 'gui') ? a:style.gui : 'NONE')
endfunction

let s:has_nvim = has('nvim')

call s:h('ColorColumn', { 'bg': s:colors.bg_light0 })
call s:h('Conceal', { 'fg': s:colors.bg_light3, 'gui': 'bold' })
call s:h('Cursor', { 'fg': s:colors.bg, 'bg': s:colors.fg })
call s:h('lCursor', { 'link': 'Cursor' })
call s:h('CursorIM', { 'link': 'Cursor' })
call s:h('CursorLine', { 'bg': s:colors.bg_light1 })
call s:h('Directory', { 'fg': s:colors.fn })
call s:h('DiffAdd', { 'bg': s:colors.diff.add })
call s:h('DiffChange', { 'bg': s:colors.diff.change })
call s:h('DiffDelete', { 'fg': s:colors.git.removed, 'bg': s:colors.diff.delete })
call s:h('DiffText', { 'bg': s:colors.diff.text })
call s:h('EndOfBuffer', { 'fg': s:colors.bg })
"if s:has_nvim | call s:h('TermCursor', {}) | endif
"if s:has_nvim | call s:h('TermCursor', {}) | endif
call s:h('ErrorMsg', { 'fg': s:colors.diag.error })
" NOTE:
" https://github.com/rebelot/kanagawa.nvim/blob/4c8d48726621a7f3998c7ed35b2c2535abc22def/lua/kanagawa/hlgroups.lua#L50
call s:h('VertSplit', { 'fg': s:colors.bg_dark, 'bg': s:config.dimInactive ? s:colors.bg_dark : 'NONE' })
call s:h('Folded', { 'fg': s:colors.bg_light3, 'bg': s:colors.bg_light0 })
call s:h('FoldColumn', { 'fg': s:colors.bg_light2 })
call s:h('SignColumn', { 'fg': s:colors.bg_light2 })
" TODO: I couldn't find any docs on this highlight group...
" call s:h('SignColumnSB', { 'link': 'SignColumn' })
if s:has_nvim | call s:h('Substitute', { 'fg': s:colors.fg, 'bg': s:colors.git.removed }) | endif
call s:h('LineNr', { 'fg': s:colors.bg_light2 })
call s:h('CursorLineNr', { 'fg': s:colors.diag.warning, 'gui': 'bold' })
call s:h('MatchParen', { 'fg': s:colors.diag.warning, 'gui': 'bold' })
call s:h('ModeMsg', { 'fg': s:colors.diag.warning, 'gui': 'bold'})
if s:has_nvim | call s:h('MsgArea', { 'fg': s:colors.fg_dark }) | endif
" nvim:MsgSeparator
call s:h('MoreMsg', { 'fg': s:colors.diag.info, 'bg': s:colors.bg })
call s:h('NonText', { 'fg': s:colors.bg_light2 })
call s:h('Normal', { 'fg': s:colors.fg, 'bg': !s:config.transparent ? s:colors.bg : 'NONE' })
if s:has_nvim | call s:h('NormalNC', s:config.dimInactive ? { 'fg': s:colors.fg_dark, 'bg': s:colors.bg_dim } : { 'link': 'Normal' }) | endif
if s:has_nvim | call s:h('NormalSB', { 'link': 'Normal' }) | endif
if s:has_nvim | call s:h('NormalFloat', { 'fg': s:colors.fg_dark, 'bg': s:colors.bg_dark }) | endif
if s:has_nvim | call s:h('FloatBorder', { 'fg': s:colors.fg_border, 'bg': s:colors.bg_dark }) | endif
if s:has_nvim | call s:h('FloatTitle', { 'fg': s:colors.bg_light3, 'bg': s:colors.bg_dark, 'gui': 'bold' }) | endif
call s:h('Pmenu', { 'fg': s:colors.fg_menu, 'bg': s:colors.bg_menu })
call s:h('PmenuSel', { 'fg': 'NONE', 'bg': s:colors.bg_menu_sel })
call s:h('PmenuSbar', { 'link': 'Pmenu' })
call s:h('PmenuThumb', { 'bg': s:colors.bg_search })
call s:h('Question', { 'link': 'MoreMsg' })
call s:h('QuickFixLine', { 'link': 'CursorLine' })
call s:h('Search', { 'fg': s:colors.fg, 'bg': s:colors.bg_search })
if s:has_nvim | call s:h('CurSearch', { 'link': 'Search' }) | endif
call s:h('IncSearch', { 'fg': s:colors.bg_visual, 'bg': s:colors.diag.warning })
call s:h('SpecialKey', { 'link': 'NonText' })
call s:h('SpellBad', { 'sp': s:colors.diag.error, 'gui': 'undercurl' })
call s:h('SpellCap', { 'sp': s:colors.diag.warning, 'gui': 'undercurl' })
call s:h('SpellLocal', { 'sp': s:colors.diag.warning, 'gui': 'undercurl' })
call s:h('SpellRare', { 'sp': s:colors.diag.warning, 'gui': 'undercurl' })
call s:h('StatusLine', { 'fg': s:colors.fg_dark, 'bg': s:colors.bg_status })
call s:h('StatusLineNC', { 'fg': s:colors.fg_comment, 'bg': s:colors.bg_status })
if s:has_nvim | call s:h('Winbar', { 'fg': s:colors.fg_dark, 'bg': 'NONE' }) | endif
if s:has_nvim | call s:h('WinbarNC', { 'fg': s:colors.fg_dark, 'bg': s:config.dimInactive ? s:colors.bg_dim : 'NONE' }) | endif
call s:h('TabLine', { 'bg': s:colors.bg_dark, 'fg': s:colors.bg_light3 })
call s:h('TabLineFill', { 'bg': s:colors.bg })
call s:h('TabLineSel', { 'fg': s:colors.fg_dark, 'bg': s:colors.bg_light1 })
call s:h('Title', { 'fg': s:colors.fn, 'gui': 'bold' })
call s:h('Visual', { 'bg': s:colors.bg_visual })
call s:h('VisualNOS', { 'link': 'Visual' })
call s:h('WarningMsg', { 'fg': s:colors.diag.warning })
if s:has_nvim | call s:h('Whitespace', { 'fg': s:colors.bg_light2 }) | endif
call s:h('WildMenu', { 'link': 'Pmenu' })

call s:h('Comment', { 'fg': s:colors.fg_comment })

call s:h('Constant', { 'fg': s:colors.co })
call s:h('String', { 'fg': s:colors.st })
call s:h('Character', { 'link': 'String' })
call s:h('Number', { 'fg': s:colors.nu })
call s:h('Boolean', { 'fg': s:colors.co, 'gui': 'bold' })
call s:h('Float', { 'link': 'Number' })

call s:h('Identifier', { 'fg': s:colors.id })
call s:h('Function', { 'fg': s:colors.fn, 'gui': s:config.functionStyle })

call s:h('Statement', { 'fg': s:colors.sm, 'gui': s:config.statementStyle })
" Conditional
" Repeat
" Label
call s:h('Operator', { 'fg': s:colors.op })
call s:h('Keyword', { 'fg': s:colors.kw, 'gui': s:config.keywordStyle })
call s:h('Exception', { 'fg': s:colors.sp2 })

call s:h('PreProc', { 'fg': s:colors.pp })
" Include
" Define
" Precondit

call s:h('Type', { 'fg': s:colors.ty, 'gui': s:config.typeStyle })
" StorageClass
" Structure
" Typedef

call s:h('Special', { 'fg': s:colors.sp })
" SpecialChar
" Tag
" Delimiter
" SpecialComment
" Debug

call s:h('Underlined', { 'fg': s:colors.sp, 'gui': 'underline' })

call s:h('Ignore', { 'link': 'NonText' })

call s:h('Error', { 'fg': s:colors.diag.error })

call s:h('ToDo', { 'fg': s:colors.fg_reverse, 'bg': s:colors.diag.info, 'gui': 'bold' })

"call s:h('Method', { 'link': 'Function' })
"call s:h('Structure', { 'link': 'Type' })
"call s:h('Bold', { 'gui': 'bold' })
"call s:h('Italic', { 'gui': 'italic' })
"
" vim: fenc=utf-8 ff=unix ft=vim ts=4 sw=4 sts=4 si et :
