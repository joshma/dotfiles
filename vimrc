set nocompatible
filetype off
filetype plugin on

" Indentation
set ts=4
set sts=4
set sw=4
set expandtab

set mouse=a

autocmd FileType html set expandtab
autocmd FileType html set sw=2
autocmd FileType html set ts=2
autocmd FileType html set sts=2
autocmd FileType html set textwidth=0
autocmd FileType html set syntax=htmljinja

autocmd FileType htmldjango set expandtab
autocmd FileType htmldjango set sw=2
autocmd FileType htmldjango set ts=2
autocmd FileType htmldjango set sts=2
autocmd FileType htmldjango set textwidth=0
autocmd FileType htmldjango set syntax=htmljinja

autocmd FileType css set expandtab
autocmd FileType css set sw=4
autocmd FileType css set ts=4
autocmd FileType css set sts=4
autocmd FileType css set textwidth=0
autocmd FileType css set syntax=css

autocmd FileType javascript set expandtab
autocmd FileType javascript set sw=4
autocmd FileType javascript set ts=4
autocmd FileType javascript set sts=4
autocmd FileType javascript set textwidth=0
autocmd FileType javascript set syntax=javascript

autocmd FileType python set expandtab
autocmd FileType python set sw=4
autocmd FileType python set ts=4
autocmd FileType python set sts=4
autocmd FileType python set textwidth=0
autocmd FileType python set syntax=python

set wrap
set linebreak
set backspace=2	" make backspace work like other apps
set ignorecase

syntax on
set autoindent
set background=dark

"Keyboard mappings
let mapleader=","

" Tab navigation
nmap tk :tabnext<CR>
nmap tj :tabprevious<CR>
nmap tl :tablast<CR>
nmap th :tabfirst<CR>
nmap <C-t> :tabnew<CR>

" Window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Window sizing
nmap <leader>= <C-w>+
nmap <leader>- <C-w>-

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Shortcut to toggle spell checking
map <leader>s :set spell!<cr>

" Shortcut to toggle line numbers
map <leader>n :set number!<cr>

" Shortcut to edit vimrc file
map <leader>v :tabedit ~/.vimrc<cr>
" Shortcut to source vimrc
nmap <Leader>s :source $MYVIMRC<cr>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:T\ ,eol:$

" Text bubbling
map <C-Up> ddkp<cr>
map <C-Down> ddp<cr>

" Colors
set t_Co=256 

" Colorscheme
colorscheme Mustang


" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
	if !exists("*synstack")
	  return
	endif
	echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc 

" Functions
function! TclTest()
	r~/.vim/templates/tcltest
endfunc

map <silent> <leader>1 <Esc>:call TclTest()<cr>

set history=1000
set wildmode=list:longest

" Highlight long lines
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%101v.\+/

" Code folding
set number

" For powerline
set laststatus=2
set nowrap

hi CursorLine   cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkred guifg=white
hi CursorColumn cterm=NONE ctermbg=darkblue ctermfg=white guibg=darkred guifg=white
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" Easy split navigatino
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Improve up/down movement on wrapped lines
nnoremap j gj
nnoremap k gk
