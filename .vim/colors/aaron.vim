"%% SiSU Vim color file
" modified from Slate
:set background=dark
":highlight clear
:set guifont=monaco
if version > 580
 hi clear
 if exists("syntax_on")
 syntax reset
 endif
endif
let colors_name = "aaron"
:hi Normal       guibg=black        guifg=white        ctermfg=255
:hi Cursor       guibg=slategrey    guifg=slategrey
:hi VertSplit    guibg=#c2bfa5      guifg=grey40                                              gui=none   cterm=reverse
:hi Folded       guibg=black        guifg=grey40       ctermfg=grey         ctermbg=darkgrey
:hi FoldColumn   guibg=black        guifg=grey20       ctermfg=4            ctermbg=7
:hi IncSearch    guibg=black        guifg=green        ctermfg=yellow       ctermbg=green
:hi ModeMsg      guibg=black        guifg=goldenrod    ctermfg=brown                                     cterm=none
:hi MoreMsg      guibg=SeaGreen                        ctermfg=darkgreen
:hi NonText      guibg=RoyalBlue    guifg=grey15                            ctermfg=blue                  cterm=bold
:hi Question     guibg=springgreen                     ctermfg=green
:hi Search       guibg=peru         guifg=wheat        ctermfg=grey         ctermbg=blue cterm=none
:hi SpecialKey   guibg=yellowgreen                     ctermfg=darkgreen
:hi StatusLine   guibg=#333333      guifg=red                                                 gui=none   cterm=bold,reverse
:hi StatusLineNC guibg=#333333      guifg=red                                                 gui=none   cterm=reverse
:hi Title        guibg=black        guifg=gold         ctermfg=yellow       ctermbg=black     gui=bold   cterm=bold
:hi Statement    guibg=black        guifg=blue         ctermfg=lightblue
:hi Visual       guibg=olivedrab    guifg=khaki                                               gui=none   cterm=reverse
:hi WarningMsg   guibg=red          guifg=salmon       ctermfg=1
:hi String       guibg=black        guifg=SkyBlue      ctermfg=cyan
:hi Comment      guibg=black        guifg=blue         ctermfg=8
:hi Constant     guibg=black        guifg=#ffa0a0      ctermfg=yellow
:hi Special      guibg=black        guifg=darkkhaki    ctermfg=5
:hi Identifier   guibg=black        guifg=salmon       ctermfg=160
:hi Include      guibg=black        guifg=red          ctermfg=red
:hi PreProc      guibg=white        guifg=red          ctermfg=red
:hi Operator     guibg=black        guifg=Red          ctermfg=red
:hi Define       guibg=black        guifg=gold         ctermfg=yellow                        gui=bold
:hi Type         guibg=black        guifg=blue         ctermfg=2
:hi Function     guibg=black        guifg=white        ctermfg=27
:hi Structure    guibg=black        guifg=green        ctermfg=green
:hi LineNr       guibg=black        guifg=grey50       ctermfg=232          ctermbg=235
:hi Ignore       guibg=black        guifg=grey40       ctermfg=7                                          cterm=bold
:hi Todo         guibg=yellow2      guifg=orangered
:hi Directory                                          ctermfg=darkcyan
:hi ErrorMsg     guibg=red          guifg=white        ctermfg=7            ctermbg=1                     cterm=bold
:hi VisualNOS    guibg=black        guifg=white                                                           cterm=bold,underline
:hi WildMenu     guibg=black        guifg=white        ctermfg=0            ctermbg=3
:hi DiffAdd      guibg=black        guifg=white                             ctermbg=4
:hi DiffChange   guibg=black        guifg=white                             ctermbg=5
:hi DiffDelete   guibg=black        guifg=white        ctermfg=4            ctermbg=6                     cterm=bold
:hi DiffText     guibg=black        guifg=white                             ctermbg=1                     cterm=bold
:hi Underlined                                         ctermfg=5                                          cterm=underline
:hi Error        guibg=red          guifg=white        ctermfg=7            ctermbg=1                     cterm=bold
:hi SpellErrors  guibg=red          guifg=white        ctermfg=7            ctermbg=1                     cterm=bold
:hi NonText      guibg=black        guifg=#333333      ctermfg=235
:hi SpecialKey   guibg=black        guifg=#333333      ctermfg=235
