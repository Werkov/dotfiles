" -- moving --
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set mouse=a


" -- syntax highlight --
set bg=dark
syntax on
set modeline
filetype on
filetype plugin indent on    " enable loading indent file for filetype

" -- whitespace
nmap <c-l> :set list! list?<cr> " show whitespace
autocmd FileType c,cc,h,hpp,cpp,php autocmd BufWritePre <buffer> :%s/\([^ \t\r\n]\+\)\s\+$/\1/e

" see
" http://vimrc-dissection.blogspot.cz/2006/09/vim-7-re-turn-off-parenparenthesiswhat.html
" let loaded_matchparen = 1

hi CursorLine   cterm=none ctermbg=darkblue
augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * set cursorline
	au WinLeave * set nocursorline
augroup END

au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

" -- searching and patterns --
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
nnoremap <space> :nohlsearch<cr> " Hide search matches
set incsearch               " Incrementally search while typing a /regex

" -- find & replace
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" -- cscope initialization --
function! LoadCscope()
	let db = findfile("cscope.out", ".;")
	if (!empty(db))
		let path = strpart(db, 0, match(db, "/cscope.out$"))
		set nocscopeverbose " suppress 'duplicate connection' error
		exe "cs add " . db . " " . path
		set cscopeverbose
	endif
endfunction
au BufEnter /* call LoadCscope()

nmap <2-LeftMouse> :cs find g <C-R>=expand("<cword>")<CR><CR>	

" -- per project settings
set exrc
set secure

" -- splits
set splitright

" -- GUI
if has("gui_running")
	colorscheme desert

	au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
	au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
	au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
endif
