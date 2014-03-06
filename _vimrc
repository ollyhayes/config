source $VIMRUNTIME/mswin.vim

behave xterm

if !exists("syntax_on")
	syntax on
endif

set number
set nowrap
set diffexpr = ""
set backspace=indent,eol,start
set ts=4
set gdefault

set incsearch
set hlsearch

set ignorecase smartcase

set clipboard=unnamed
set directory=~\vimfiles\swapfiles

nmap <c-a> ggVG
nmap <c-h> :%s/
nmap ,s :source ~\projects\vimrc\_vimrc<CR>
nmap ,v :vsplit ~\projects\vimrc\_vimrc<CR>
nmap <F4> :%! formatter.bat<CR>
nmap <F5> :set syntax=xml<CR>
vnoremap < <gv
vnoremap > >gv 
noremap <C-LeftMouse> <LeftMouse>viw

set foldmethod=syntax
set foldlevel=99

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
