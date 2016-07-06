:set encoding=utf-8

runtime! autoload/pathogen.vim
if exists("g:loaded_pathogen")
    call pathogen#infect()
endif

filetype plugin indent on

behave xterm
colorscheme desert

"inverted as vsvim errors on gui_running
if !has("gui_running")
	set mouse=
else
	"remove highlight on escape (doesn't work in terminal)
	nmap <Esc> :noh<CR>
endif

if !exists("syntax_on")
	syntax on
endif

"set shell=bash
"set shellxquote=\"
"set shellslash
"set shell=\"C:\Program\ Files\Git\bin\bash.exe\"
"set shellcmdflag=--login\ -c

"set comments to visible colour on linux
"hi comment ctermfg=cyan

"set cursorline
set number

set completeopt=longest,menuone

"let g:ctrlp_custom_ignore = 'v[/].(git|hg|svn)$'
"let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co | grep -E "\.(cs|ts|less|config|cshtml)$"']
let g:ctrlp_custom_ignore = 'node_modules'

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

set listchars=tab:>-
nnoremap <leader>es :set list!<CR>

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x
" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y
" CTRL-V and SHIFT-Insert are Paste
noremap <C-V>		"+p
noremap <S-Insert>		"+p
inoremap <C-V>		<C-R>+
inoremap <S-Insert>	<C-R>+
cnoremap <C-V>		<C-R>+
cnoremap <S-Insert>		<C-R>+
" Use CTRL-Q to do what CTRL-V used to do
noremap <C-Q>		<C-V>
" Also CTRL-B to do what CTRL-V used to do (for visual studio)
noremap <C-B> <C-V>
" minus to work as command (for dvorak)
nnoremap - :
vnoremap - :
"select all
nnoremap <C-A> ggVG
"find and replace
nnoremap <C-H> :%s/
vnoremap <C-H> :s/
"find current selection
vnoremap * y/<C-R>"<CR>
vnoremap // y/<C-R>"<CR>
"map C-Backspace to delete previous word
inoremap <C-BS> <C-W>
"run macro
nnoremap <S-Z> @z
nnoremap <S-X> @x
"switch buffer
noremap <C-Tab> :b#<CR>
"bring up most recently used file in ctrl-p
noremap <C-K> :CtrlPMRU<CR>
"open vimrc
nnoremap <silent> <leader>v :call OpenVimRc()<CR>
"open bashrc
nnoremap <silent> <leader>b :call OpenBashRc()<CR>
"do diff
nnoremap <leader>d :windo diffthis<CR>
"open split
nnoremap <leader>n :vnew<CR>
"open history of file
nnoremap <leader>hi :!start "C:\Program Files (x86)\GitExtensions\gitex.cmd" filehistory "%:p"<CR>
"paste timestamp
nnoremap <leader>ts "=strftime("%c")<CR>p
"set directory to current file
nnoremap <leader>cd :cd %:p:h<CR>

"format json/xml
nnoremap <F4> :%! formatter.bat<CR>
"sytax xml (after pasting)
nnoremap <silent> <F5> :call RotateSyntax()<CR>
nnoremap <silent> <S-F5> :call ReverseRotateSyntax()<CR>
"enable horizontal scrollbar
nnoremap <F6> :set guioptions+=b<CR>

"turn on livedown (markdown) server
nnoremap <F7> :LivedownToggle<CR>

"home
noremap <S-H> ^
"end
noremap <S-L> $
"page up
noremap <S-K> 4k
"page down
noremap <S-J> 4j
"join line
nnoremap <Backspace> J
"join line for visual studio
nnoremap gj J
"indent/outdent
vnoremap <S-Tab> <gv
vnoremap <Tab> >gv 
nnoremap <Tab> V>
nnoremap <S-Tab> V<
"ctrl click - select word
noremap <C-LeftMouse> <LeftMouse>viw
"middle mouse - repeat last action
noremap <MiddleMouse> <LeftMouse>.

"move to mark in center of screen
noremap <expr> ' printf("'%c zz",getchar())
noremap <expr> ` printf("`%c zz",getchar())

"Navigate around windows
noremap <leader>h <C-w>h
noremap <leader>j <C-w>j
noremap <leader>k <C-w>k
noremap <leader>l <C-w>l
"Resize windows
noremap <C-Left> 10<C-w><
noremap <C-Down> 2<C-w>-
noremap <C-Up> 2<C-w>+
noremap <C-Right> 10<C-w>>

noremap <silent> <leader>g :call GitTag()<CR>A


set foldmethod=syntax
set foldlevel=99 "open files unfolded by default
"always show status line
set laststatus=2

set statusline=
set statusline +=%1*\ %n\%*				"buffer number
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%3*\ [%{&ff}]%*        "file format
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*U+%04B\ %*          "character under cursor

let javaScript_fold=1         " JavaScript
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

function! GitTag()
	set shell=/usr/bin/bash
	let a = system('git log -n 1 --pretty=format:%s | sed "s/^\(.*: \).*/\1/"')
	delete
	put! =a
endfunction

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
		set syntax=javascript
		echo "javascript"
	elseif &syntax == "javascript"
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
		set syntax=javascript
		echo "javascript"
	elseif &syntax == "json"
		set syntax=xml
		echo "xml"
	elseif &syntax == "cs"
		set syntax=json
		echo "json"
	elseif &syntax == "ts"
		set syntax=cs
		echo "cs"
	elseif &syntax == "javascript"
		set syntax=ts
		echo "ts"
	endif
endfunction

function! OpenVimRc()
	if filereadable(expand("~/tools/config/vimrc/_vimrc"))
		edit ~/tools/config/vimrc/_vimrc
	else
		edit ~/tools/vimrc/_vimrc
	endif
endfunction

function! OpenBashRc()
	if filereadable(expand("~/tools/config/.bashrc"))
		edit ~/tools/config/.bashrc
	else
		edit ~/.bashrc
	endif
endfunction

hi User1 guifg=#eea040 guibg=#222222 ctermfg=4 ctermbg=0
hi User2 guifg=#dd3333 guibg=#222222 ctermfg=2 ctermbg=0
hi User3 guifg=#ff66ff guibg=#222222 ctermfg=3 ctermbg=0
hi User4 guifg=#a0ee40 guibg=#222222 ctermfg=5 ctermbg=0

"function! RunNode()
"	let stdin = join(getline(1, '$'), "\n")
"	let a = system('node', stdin)
"	put =a
"endfunction
"
"autocmd FileType javascript inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"autocmd FileType javascript nnoremap <leader><F5> :call RunNode()<CR>

if !exists("*SetupExecuteWindow")
	function! SetupExecuteWindow()

		execute "w"

		let filetype_to_command = {
		\	'javascript': 'node',
		\	'python': 'python',
		\	'html': '"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"',
		\	'sh': '"C:\Program Files\Git\bin\sh"',
		\	'bash': '"C:\Program Files\Git\bin\sh"',
		\	'cs': '"C:\Program Files (x86)\MSBuild\14.0\Bin\csi.exe"'
		\ }

		if &filetype == 'vim'
			source %:p
			return
		endif

		let cmd=get(filetype_to_command, &filetype, &filetype)

		"execute "silent !chmod +x %:p"
		execute "silent !" . cmd . " %:p > C:/users/dolivhay/vimfiles/output.txt 2>&1"

		"these wierd commands stop the original window from scrolling: http://stackoverflow.com/questions/3932810/vim-open-preview-window-without-moving-text-in-main-window/3933547#3933547
		normal! Hmx``
		execute "belowright pedit ~/vimfiles/output.txt"
		normal! `xzt``
	endfunction
endif

nnoremap <F8> :call SetupExecuteWindow()<CR>

function! Curl()
	execute "e ~/tools/vimrc/curl-template.sh"
	execute "sav! ~/vimfiles/curl-temp.sh"
	execute "normal! /insert-url-here/\<cr>vi\""
endfunction
command! Curl call Curl()

function! Html()
	execute "e ~/tools/vimrc/html-template.html"
	execute "sav! ~/vimfiles/html-temp.html"
	/insert-content-here/
	execute "normal! /insert-content-here/\<cr>viW"
endfunction
command! Html call Html()
