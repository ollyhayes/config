source $VIMRUNTIME/mswin.vim

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
nmap ,s :source ~\projects\vimrc\_vimrc
nmap ,v :vsplit ~\projects\vimrc\_vimrc
vnoremap < <gv
vnoremap > >gv 
