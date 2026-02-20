set nocompatible              " required
filetype off                  " required

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" --- Instructor's Favorites ---
Plugin 'nanotech/jellybeans.vim'         " Colorscheme
Plugin 'tpope/vim-fugitive'              " Git wrapper
Plugin 'nathanaelkane/vim-indent-guides' " Improvement plugin

call vundle#end()            " required
filetype plugin indent on    " required

" Set colorscheme at the end as requested
syntax enable
colorscheme jellybeans
