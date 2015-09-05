" vim plug section
call plug#begin('~/.vim/plugged')

" plugins from github repos:
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Yggdroot/indentLine'
Plug 'Daetalus/atom-one-dark'
Plug 'yosiat/oceanic-next-vim'
"Plug 'nathanaelkane/vim-indent-guides'

" add plugins to runtime path
call plug#end()

" plugin specific config
" NERDTree
let NERDTreeShowHidden=1
" CTRLP
let g:ctrlp_show_hidden=1
" indetLine
let g:indentLine_char = '︙'
let g:indentLine_color_term = 236

" colorscheme
set t_Co=256
set background=dark
colorscheme default

set nocompatible

" use os clipboard by default
set clipboard=unnamed

" disable backups
set nobackup
set nowritebackup
set noswapfile 

" set encoding to utf-8
set encoding=utf-8

" make backspace behave in a sane manner
set backspace=indent,eol,start

" set tabsize to 2 (softtabs)
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" enable syntax highlighting
syntax on

" allow mouse in all modes
set mouse=a

" show cursor position (line number, etc.)
set ruler

" show filename in window bar
set title

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on

" Show line numbers
set number

" Allow hidden buffers, don't limit to 1 file per window/split
set hidden
