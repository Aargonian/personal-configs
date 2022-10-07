" Remap the leader and other keys
let mapleader = ","
nnoremap <Esc>h <C-W><C-h>
nnoremap <Esc>j <C-W><C-j>
nnoremap <Esc>k <C-W><C-k>
nnoremap <Esc>l <C-W><C-l>

" Indentation
set autoindent
set expandtab
set shiftround
set shiftwidth=4
set smarttab
set tabstop=4

" Search
set hlsearch
set incsearch

" Rendering
syntax on
set encoding=utf-8
set linebreak
set scrolloff=5
set wrap

" UI
set laststatus=2
set ruler
set wildmenu
set tabpagemax=50
set cursorline
set number
set noerrorbells
set visualbell
set mouse=a
set title
set background=dark

" Cold Folding
set foldmethod=syntax

" Misc
set lazyredraw
set autoread
set backspace=indent,eol,start
set history=1000
set nomodeline

""""""""""""""""
" VUNDLE
""""""""""""""""
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'                       " Vundle needs to manage itself
Plugin 'bling/vim-bufferline'                       " View the currently opened Buffers in Vim
Plugin 'vim-airline/vim-airline'                    " Status Line for Git
Plugin 'tpope/vim-fugitive'                         " VIM Git Integration
Plugin 'tomtom/tcomment_vim'                        " Easier file comments
Plugin 'severin-lemaignan/vim-minimap'              " Minimap in VIM

" NERDTree Plugins
Plugin 'preservim/nerdtree'                         " File Tree in Git
Plugin 'Xuyuanp/nerdtree-git-plugin'                " Git statuses in NERDTree
Plugin 'ryanoasis/vim-devicons'                     " Development Icons
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'    " Syntax Highlighting in NERDTree
Plugin 'PhilRunninger/nerdtree-visual-selection'    " Visually select files in the tree to open/move/copy/delete them

call vundle#end()

filetype plugin indent on

""""""""""""""""
" END VUNDLE
""""""""""""""""

"""""""""""""""""""""""""""""
" Vim Airline Font Settings "
""""""""""""""""""""""""""""

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

"""""""""""""""""""""
" NERDTree Settings "
"""""""""""""""""""""

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
" autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
"     \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
