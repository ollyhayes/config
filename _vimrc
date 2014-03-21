behave xterm

if !exists("syntax_on")
	syntax on
endif

"use relative numbers in normal mode, normal elsewhere
set relativenumber
autocmd FocusLost * :set nu | :set nornu
autocmd FocusGained * :set nonu | :set rnu
autocmd InsertEnter * :set nu | :set nornu
autocmd InsertLeave * :set nonu | :set rnu

set nowrap
set linebreak "if we do wrap, wrap on words not characters
set diffexpr = ""
set backspace=indent,eol,start
set gdefault "global replace as default

set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set autoindent

set incsearch
set hlsearch

set ignorecase smartcase

set directory=~/vimfiles/swapfiles "stop temp files appearing everywhere

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
nmap <c-a> ggVG
"find and replace
nmap <c-h> :%s/
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
"page up (centering cursor in screen)
map <S-K> <C-b>M
"page down (centering cursor in screen)
map <S-J> <C-f>M
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
