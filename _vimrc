source $VIMRUNTIME/mswin.vim

behave xterm

if !exists("syntax_on")
	syntax on
endif

set number
set nowrap
set linebreak "if we do wrap, wrap on words not characters
set diffexpr = ""
set backspace=indent,eol,start
set ts=4
set gdefault

set incsearch
set hlsearch

set ignorecase smartcase

set clipboard=unnamed "always yank to system clipboard
set directory=~\vimfiles\swapfiles "stop temp files appearing everywhere

"select all
nmap <c-a> ggVG
"find and replace
nmap <c-h> :%s/
"save vimrc
nmap ,s :source ~\projects\vimrc\_vimrc<CR>
"open vimrc
nmap ,v :vsplit ~\projects\vimrc\_vimrc<CR>
"format json/xml
nmap <F4> :%! formatter.bat<CR>
"sytax xml (after pasting)
nmap <F5> :set syntax=xml<CR>
"enable horizontal scrollbar
nmap <F6> :set guioptions+=b<CR>
"home
nmap <S-H> ^
"end
nmap <S-L> $
"indent/outdent
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv 
"ctrl click - select word
noremap <C-LeftMouse> <LeftMouse>viw

set foldmethod=syntax
set foldlevel=99 "open files unfolded by default

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
