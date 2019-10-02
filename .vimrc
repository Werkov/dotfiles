" -- moving & indentation --
set autoindent           " always set autoindenting on
set smartindent          " use smart indent if there is no indent file
set mouse=a
set fo+=cro              " continue comments on new line (in various insertions)
set showcmd

" cut my hands off
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>


" -- syntax highlight --
set bg=dark
syntax on
set modeline
filetype on
filetype plugin indent on    " enable loading indent file for filetype

" -- cursor highlight --
hi CursorLine   cterm=none ctermbg=darkblue
augroup CursorLine
	au!
	au VimEnter,WinEnter,BufWinEnter * set cursorline
	au WinLeave * set nocursorline
augroup END

" -- text width highlight --
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
let s:activatedtw = 2
function! ToggleTW()
	if s:activatedtw == 0
		let s:activatedtw = 1
		match ErrorMsg '\%>80v.\+'
	elseif s:activatedtw == 1
		let s:activatedtw = 0
		match none
	else
		let s:activatedtw = 0
		call matchdelete(w:m2)
	endif
endfunction

nmap <c-k> :call ToggleTW()<cr>


" -- whitespace
nmap <c-l> :set list! list?<cr> " show whitespace
autocmd FileType c,cc,h,hpp,cpp,php,tex autocmd BufWritePre <buffer> :%s/\([^ \t\r\n]\+\)\s\+$/\1/e

" -- folding
" set foldmethod=syntax
nnoremap <F9> za
nnoremap <F10> zi

" -- TODO file
" done
nnoremap <F5> ma :/^[^ ]/<cr> :noh<cr> mb :'a,'b-1d<cr>Gp'b
" done & repeat
nnoremap <S-F5> ma :/^[^ ]/<cr> :noh<cr> mb :'a,'b-1d<cr>Gp'b}P'b
" cancelled
nnoremap <C-F5> ma :/^[^ ]/<cr> :noh<cr> mb :'a,'b-1d<cr>GpIx <esc>'b

" -- searching and patterns --
set ignorecase              " Default to using case insensitive searches,
set smartcase               " unless uppercase letters are used in the regex.
set hlsearch                " Highlight searches by default.
nnoremap <space> :nohlsearch<cr> " Hide search matches
set incsearch               " Incrementally search while typing a /regex

" -- quickfix errors
map - :cprev<CR>
map + :cnext<CR>

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
