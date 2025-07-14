" Modern Vim Configuration
" ======================

" Use Vim settings, rather than Vi settings
set nocompatible

" Enable file type detection and plugins
filetype plugin indent on
syntax on

" Basic Settings
" ==============
set mouse=a                    " Enable mouse support
set backspace=indent,eol,start " Make backspace work as expected
set history=1000               " Increase command history
set wildmode=list:longest      " Better command completion
set ignorecase                 " Case insensitive search
set smartcase                  " Case sensitive when uppercase present
set incsearch                  " Incremental search
set hlsearch                   " Highlight search results
set number                     " Show line numbers
set ruler                      " Show cursor position
set laststatus=2              " Always show status line
set t_Co=256                  " Enable 256 colors

" Indentation Settings
" ===================
set expandtab                  " Use spaces instead of tabs
set tabstop=4                  " Tab width
set shiftwidth=4               " Indentation width
set softtabstop=4             " Soft tab width
set autoindent                " Copy indent from current line
set smartindent               " Smart autoindenting

" Visual Settings
" ==============
set wrap                      " Wrap long lines
set linebreak                 " Break at word boundaries
set background=dark           " Dark background
colorscheme desert            " Use a standard colorscheme

" Show invisible characters
set listchars=tab:▸\ ,eol:¬,trail:·,extends:❯,precedes:❮
set showbreak=↪\ 

" Cursor line highlighting
set cursorline
highlight CursorLine cterm=NONE ctermbg=darkblue ctermfg=NONE

" Key Mappings
" ============
let mapleader = ","

" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Window resizing
nnoremap <leader>= <C-w>+
nnoremap <leader>- <C-w>-

" Tab navigation
nnoremap tk :tabnext<CR>
nnoremap tj :tabprevious<CR>
nnoremap tl :tablast<CR>
nnoremap th :tabfirst<CR>
nnoremap <C-t> :tabnew<CR>

" Toggle settings
nnoremap <leader>l :set list!<CR>
nnoremap <leader>s :set spell!<CR>
nnoremap <leader>n :set number!<CR>
nnoremap <leader>c :set cursorline! cursorcolumn!<CR>

" Quick edit/reload vimrc
nnoremap <leader>v :tabedit $MYVIMRC<CR>
nnoremap <leader>r :source $MYVIMRC<CR>

" Clear search highlighting
nnoremap <leader>/ :nohlsearch<CR>

" Better movement on wrapped lines
nnoremap j gj
nnoremap k gk

" Language-Specific Settings
" =========================

" Python
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

" JavaScript/TypeScript
autocmd FileType javascript,typescript setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" HTML/CSS
autocmd FileType html,css setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" HTML with template syntax
autocmd FileType html setlocal syntax=htmljinja
autocmd FileType htmldjango setlocal syntax=htmljinja

" JSON
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" YAML
autocmd FileType yaml setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2

" Markdown
autocmd FileType markdown setlocal wrap linebreak textwidth=0

" Functions
" =========

" Show syntax highlighting groups for word under cursor
nnoremap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" Strip trailing whitespace
function! StripTrailingWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfunction
nnoremap <leader>w :call StripTrailingWhitespace()<CR>

" Plugin Settings
" ===============

" Airline (if installed)
if exists(':AirlineToggle')
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
endif

" Automatically install vim-plug if not present
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Performance Settings
" ===================
set lazyredraw                " Don't redraw during macros
set synmaxcol=200            " Limit syntax highlighting for long lines
set updatetime=250           " Faster completion
