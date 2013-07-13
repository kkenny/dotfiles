" vim: set foldmarker={,} foldlevel=0 foldmethod=marker
set nocompatible               " Disable backwards compatibility with vi

" remap leaderchar to comma
let mapleader = ','

" Vundle setup {
"filetype off                   " required by Vundle (Maybe not for newer version of vim, https://github.com/gmarik/vundle/issues/176
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" }

" Enable pathogen
call pathogen#infect()

" Copied from spf13
function! InitializeDirectories()
    let separator = "."
    let parent = $HOME
    let prefix = '.vim'
    let dir_list = {
                \ 'backup': 'backupdir',
                \ 'views': 'viewdir',
                \ 'swap': 'directory' }
    if has('persistent_undo')
        let dir_list['undo'] = 'undodir'
    endif

    for [dirname, settingname] in items(dir_list)
        let directory = parent . '/' . prefix . dirname . "/"
        if exists("*mkdir")
            if !isdirectory(directory)
                call mkdir(directory)
            endif
        endif
        if !isdirectory(directory)
            echo "Warning: Unable to create backup directory: " . directory
            echo "Try: mkdir -p " . directory
        else
            let directory = substitute(directory, " ", "\\\\ ", "g")
            exec "set " . settingname . "=" . directory
        endif
    endfor
endfunction
call InitializeDirectories()

" tabs {
set tabstop=4
set shiftwidth=4
" INDENT WITH TABS - ALIGN WITH SPACES
" http://lea.verou.me/2012/01/why-tabs-are-clearly-superior/
"set shiftwidth=4
"set softtabstop=4
"set expandtab
"set smart
" }

" listchars
"set listchars=tab:\┃\ ,eol:¬
set listchars=tab:\┃\ ,eol:¬
"set listchars=tab:\|\ ,eol:¬
"set listchars=tab:\￨\ ,eol:¬
set list
nmap <leader>l :set list!<CR>

" enable syntax
syntax on


" enable my colorscheme
colorscheme aaron

" Wrapped lines goes down/up to next row, rather than next line in file.
nnoremap j gj
nnoremap k gk

" Fix common typos
command! -bang -nargs=* -complete=file E e<bang> <args>
command! -bang -nargs=* -complete=file W w<bang> <args>
command! -bang -nargs=* -complete=file Wq wq<bang> <args>
command! -bang -nargs=* -complete=file WQ wq<bang> <args>
command! -bang Wa wa<bang>
command! -bang WA wa<bang>
command! -bang Q q<bang>
command! -bang QA qa<bang>
command! -bang Qa qa<bang>

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Code folding options
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

"clearing highlighted search
nmap <silent> <leader>/ :nohlsearch<CR>

" Disable auto-indent
filetype indent off

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv

" For when you forget to sudo.. Really Write the file.
cmap w!! w !sudo tee % >/dev/null

" TODO not sure all the repercussions of this
scriptencoding utf-8
set encoding=utf-8

" TODO not sure about this block yet 20121024
set shortmess+=filmnrxoOtT      " abbrev. of messages (avoids 'hit enter')
set viewoptions=folds,options,cursor,unix,slash " better unix / windows compatibility
set history=1000                " Store a ton of history (default is 20)
" set spell                       " spell checking on
set hidden                      " allow buffer switching without saving
" TODO not sure about this block yet 20121024

" Show matching parenthesis/braces
set showmatch

" Search {
set hlsearch      " highlight search terms
set incsearch     " find as you search
set ignorecase    " search case insensitive by default
set smartcase     " honor case in search if we use it
" }

" TODO Vim tab complete on ex commands 20121024 not terribly useful, doesn't hurt anything?
set wildmenu                    " show list instead of just completing
set wildmode=list:longest,full  " command <Tab> completion, list matches, then longest common part, then all.

set scrolloff=7                 " minimum lines to keep above and below cursor
set foldenable                  " auto fold code

" TODO TODO ....
" Setting up the directories {¬
set backup                      " backups are nice ...
if has('persistent_undo')
    set undofile                "so is persistent undo ...
    set undolevels=1000         "maximum number of changes that can be undone
    set undoreload=10000        "maximum number lines to save for undo on a buffer reload
endif

au BufWinLeave *.* silent! mkview  "make vim save view (state) (folds, cursor, etc)
au BufWinEnter *.* silent! loadview "make vim load view (state) (folds, cursor, etc)

" Home/End key bindings on Mac
map ^[[F $
imap ^[[F ^O$
map ^[[H g0
imap ^[[H ^Og0

" Plugins {
	
	Bundle 'gmarik/vundle'
	
	" vim-fugitive - git integration {
		Bundle "tpope/vim-fugitive"	
	" }
	
	" Git Gutter {
		Bundle 'airblade/vim-gitgutter'	
	" }
	
	" OmniComplete {
		if has("autocmd") && exists("+omnifunc")
			autocmd Filetype *
				\if &omnifunc == "" |
				\setlocal omnifunc=syntaxcomplete#Complete |
				\endif
		endif
		
		hi Pmenu       guifg=#000000 guibg=#F8F8F8 ctermfg=black     ctermbg=Lightgray
		hi PmenuSbar   guifg=#8A95A7 guibg=#F8F8F8 ctermfg=darkcyan  ctermbg=lightgray  cterm=NONE gui=NONE
		hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 ctermfg=lightgray ctermbg=darkcyan   cterm=NONE gui=NONE
		
		" some convenient mappings
		inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
		inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
		inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
		inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
		inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
		inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
		
		" automatically open and close the popup menu / preview window
		au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
		set completeopt=menu,preview,longest
	" }
	"
	" numbers.vim -- line numbering that changes context depending on mode {
		Bundle "myusuf3/numbers.vim"
		" Toggle between relative and absolute numbers
		nnoremap <F3> :NumbersToggle<CR>
		" Toggle numbers display and list for copy
		nnoremap <F4> :NumbersToggle<CR>:set nonumber!<CR>:set list!<CR>
		" toggle paste mode (is there any point to this with auto-indent off?)
		set pastetoggle=<F5>
	" }
	
	" vim-less -- colors for .less files {
		Bundle "groenewege/vim-less.git"
		nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><s pace>
	"}
	
	" vim-powerline -- improved status line {
		Bundle "Lokaltog/powerline", {'rtp': '/Users/aabelard/.vim/bundle/powerline/powerline/bindings/vim' }
		set rtp+=/Users/aabelard/.vim/bundle/powerline/powerline/bindings/vim
		set laststatus=2
		set statusline=%<%f\    " Filename
		set statusline+=%w%h%m%r " Options
		set statusline+=%{fugitive#statusline()} "  Git Hotness
		set statusline+=\ [%{&ff}/%Y]            " filetype
		set statusline+=\ [%{getcwd()}]          " current dir
		set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
		" Run this if things aren't right :PowerlineClearCache
	" }
	
filetype plugin indent on       " Vundle Required -- presumably after Bundles are loaded?
" } end plugins
