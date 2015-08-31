" vim plug section
call plug#begin('~/.vim/plugged')

" plugins from github repos:
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'

" add plugins to runtime path
call plug#end()

" plugin specific config
" NERDTree
let NERDTreeShowHidden=1

" colorscheme
set t_Co=256
set background=dark
colorscheme OceanicNext

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
