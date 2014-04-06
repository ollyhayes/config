behave xterm

if !exists("syntax_on")
	syntax on
endif

"set comments to visible colour on linux
hi comment ctermfg=blue

"use relative numbers in normal mode, normal elsewhere
"set relativenumber
"autocmd FocusLost * :set nu | :set nornu
"autocmd FocusGained * :set nonu | :set rnu
"autocmd InsertEnter * :set nu | :set nornu
"autocmd InsertLeave * :set nonu | :set rnu
set number

set nowrap
set linebreak "if we do wrap, wrap on words not characters
set diffexpr = ""
set backspace=indent,eol,start
set gdefault "global replace as default

set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent

set incsearch
set hlsearch

set ignorecase smartcase

"nmap <C-J> :%s/
"cmap <C-Y> <C-R>


" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x
" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+gP
map <S-Insert>		"+gP
cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+
" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>
"select all
nmap <C-A> ggVG
"find and replace
nmap <C-H> :%s/
"save vimrc
nmap ,s :source ~/tools/vimrc/_vimrc<CR>
"open vimrc
nmap ,v :vsplit ~/tools/vimrc/_vimrc<CR>
"format json/xml
nmap <F4> :%! formatter.bat<CR>
"sytax xml (after pasting)
nmap <F5> :set syntax=xml<CR>
"enable horizontal scrollbar
nmap <F6> :set guioptions+=b<CR>
"home
map <S-H> ^
"end
map <S-L> $
"page up
map <S-K> 10k
"page down
map <S-J> 10j
"indent/outdent
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv 
"ctrl click - select word
noremap <C-LeftMouse> <LeftMouse>viw

set foldmethod=syntax
set foldlevel=99 "open files unfolded by default

let javaScript_fold=1         " JavaScript
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
