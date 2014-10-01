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

if !has("gui_running")
	set mouse=
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

let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
set completeopt=longest,menuone
"inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
"inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

let g:ctrlp_custom_ignore = 'v[/].(git|hg|svn)$'
let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co | grep -E "\.(cs|ts|less|config|cshtml)$"']

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
" minus to work as command (for dvorak)
nnoremap - :
vnoremap - :
"select all
nmap <C-A> ggVG
"find and replace
nmap <C-H> :%s/
vmap <C-H> :s/
"run macro
nmap <S-Z> @a
"switch buffer
map <C-Tab> :b#<CR>
"map <C-Tab> :CtrlPMRU<CR>
map <C-K> :CtrlPMRU<CR>
"save vimrc
nmap ,s :source ~/tools/vimrc/_vimrc<CR>
"open vimrc
nmap ,v :vsplit ~/tools/vimrc/_vimrc<CR>
"do diff
nmap ,d :windo diffthis<CR>
"open split
nmap ,n :vnew<CR>
"open history of file
nmap ,h :!start "C:\Program Files (x86)\GitExtensions\gitex.cmd" filehistory %:p<CR>

"show whitespace
nmap <C-E> :%s/\t/--->/<CR>:%s/ /./<CR><C-O>
"format json/xml
nmap <F4> :%! formatter.bat<CR><F5>
"sytax xml (after pasting)
nmap <silent> <F5> :call RotateSyntax()<CR>
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


