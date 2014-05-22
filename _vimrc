execute pathogen#infect()
filetype plugin indent on

behave xterm

if has("win32")
	set directory=$home/vimfiles/swapfiles
	set backupdir=$home/vimfiles/backups
else
	set directory=$home/.vim/swapfiles
	set backupdir=$home/.vim/backups
endif

if !exists("syntax_on")
	syntax on
endif

"set comments to visible colour on linux
hi comment ctermfg=cyan

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
map <C-V>		"+gp
map <S-Insert>		"+gp
imap <C-V>		<C-R>+
imap <S-Insert>	<C-R>+
cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+
" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>
" Also CTRL-B to do what CTRL-V used to do (for visual studio)
noremap <C-B> <C-V>
"select all
nmap <C-A> ggVG
"find and replace
nmap <C-H> :%s/
vmap <C-H> :s/

"save vimrc
nmap ,s :source ~/tools/vimrc/_vimrc<CR>
"open vimrc
nmap ,v :vsplit ~/tools/vimrc/_vimrc<CR>

"show whitespace
nmap <C-E> :%s/\t/--->/<CR>:%s/ /./<CR><C-O>
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
map <S-K> 4k
map <C-K> 20k
"page down
map <S-J> 4j
map <C-J> 20j
"join line
nnoremap <Backspace> J
"remove highlight on escape
nmap <Esc> :noh<CR>
"indent/outdent
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv 
nmap <Tab> V>
nmap <S-Tab> V<
"ctrl click - select word
noremap <C-LeftMouse> <LeftMouse>viw
"middle mouse - repeat last action
noremap <MiddleMouse> <LeftMouse>.

set foldmethod=syntax
set foldlevel=99 "open files unfolded by default

let javaScript_fold=1         " JavaScript
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML
