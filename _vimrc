:set encoding=utf-8
:set fileencodings=utf-8

runtime! autoload/pathogen.vim
if exists("g:loaded_pathogen")
    call pathogen#infect()
endif

filetype plugin indent on

behave xterm

if has("gui_running")
	"remove highlight on escape
	nmap <Esc> :noh<CR>
else
	set mouse=
endif

if !exists("syntax_on")
	syntax on
endif

"set comments to visible colour on linux
hi comment ctermfg=cyan
"set cursorline
set number

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
set completeopt=longest,menuone,preview

let g:ctrlp_custom_ignore = 'v[/].(git|hg|svn)$'
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co | grep -E "\.(cs|ts|less|config|cshtml)$"']

let g:vim_json_syntax_conceal = 0

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

let mapleader = " "
"nmap <C-J> :%s/
"cmap <C-Y> <C-R>

" Put cursor at end of chunk after pasting
noremap p gp
noremap P gP
" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x
" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
" CTRL-V and SHIFT-Insert are Paste
map <C-V>		"+p
map <S-Insert>		"+p
imap <C-V>		<C-R>+
imap <S-Insert>	<C-R>+
cmap <C-V>		<C-R>+
cmap <S-Insert>		<C-R>+
" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>
" Also CTRL-B to do what CTRL-V used to do (for visual studio)
noremap <C-B> <C-V>
" minus to work as command (for dvorak)
nnoremap - :
vnoremap - :
"select all
nmap <C-A> ggVG
"find and replace
nmap <C-H> :%s/
vmap <C-H> :s/
"find current selection
vmap * y/<C-R>"<CR>
vmap // y/<C-R>"<CR>
"map C-Backspace to delete previous word
imap <C-BS> <C-W>
"run macro
nmap <S-Z> @a
"switch buffer
map <C-Tab> :b#<CR>
"map <C-Tab> :CtrlPMRU<CR>
map <C-K> :CtrlPMRU<CR>
"save vimrc
nmap <leader>s :source ~/tools/vimrc/_vimrc<CR>
"open vimrc
nmap <leader>v :vsplit ~/tools/vimrc/_vimrc<CR>
"do diff
nmap <leader>d :windo diffthis<CR>
"open split
nmap <leader>n :vnew<CR>
"open history of file
nmap <leader>h :!start "C:\Program Files (x86)\GitExtensions\gitex.cmd" filehistory %:p<CR>
"paste timestamp
nmap <leader>ts "=strftime("%c")<CR>p
"set directory to current file
nmap <leader>cd :cd %:p:h<CR>

"show whitespace
nmap <C-E> :%s/\t/--->/<CR>:%s/ /./<CR><C-O>
"format json/xml
nmap <F4> :%! formatter.bat<CR>
"sytax xml (after pasting)
nmap <silent> <F5> :call RotateSyntax()<CR>
nmap <silent> <S-F5> :call ReverseRotateSyntax()<CR>
"enable horizontal scrollbar
nmap <F6> :set guioptions+=b<CR>

"home
map <S-H> ^
"end
map <S-L> $
"page up
map <S-K> 4k
"page down
map <S-J> 4j
"join line
nnoremap <Backspace> J
"join line for visual studio
nnoremap gJ J
"indent/outdent
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv 
nmap <Tab> V>
nmap <S-Tab> V<
"ctrl click - select word
noremap <C-LeftMouse> <LeftMouse>viw
"middle mouse - repeat last action
noremap <MiddleMouse> <LeftMouse>.

"Navigate around windows
map <Left> <C-w>h
map <Down> <C-w>j
map <Up> <C-w>k
map <Right> <C-w>l
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l
"Resize windows
map <C-Left> 10<C-w><
map <C-Down> 2<C-w>-
map <C-Up> 2<C-w>+
map <C-Right> 10<C-w>>

set foldmethod=syntax
set foldlevel=99 "open files unfolded by default

let javaScript_fold=1         " JavaScript
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

function! RotateSyntax()
	if &syntax == ""
		set syntax=xml
		echo "xml"
	elseif &syntax == "text"
		set syntax=xml
		echo "xml"
	elseif &syntax == "xml"
		set syntax=json
		echo "json"
	elseif &syntax == "json"
		set syntax=cs
		echo "cs"
	elseif &syntax == "cs"
		set syntax=ts
		echo "ts"
	elseif &syntax == "ts"
		set syntax=xml
		echo "xml"
	endif
endfunction

function! ReverseRotateSyntax()
	if &syntax == ""
		set syntax=xml
		echo "xml"
	elseif &syntax == "text"
		set syntax=xml
		echo "xml"
	elseif &syntax == "xml"
		set syntax=ts
		echo "ts"
	elseif &syntax == "json"
		set syntax=xml
		echo "xml"
	elseif &syntax == "cs"
		set syntax=json
		echo "json"
	elseif &syntax == "ts"
		set syntax=cs
		echo "cs"
	endif
endfunction
