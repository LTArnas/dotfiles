" Vundle config:
set nocompatible	" be iMproved, required
filetype off		" required
" set the runtime path to include Vundle and initialize.
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Let Vundle manage Vundle, required.
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()	" required
filetype plugin indent on " required

" Other config/my own stuff...
"
" Pretty...
syntax enable
set background=dark
colorscheme solarized
" Tabs are spaces!...
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
" line numbers... (the two options interact)
" both set means show absolute on current line, relative for the rest.
set number          " absolute numbers
set relativenumber  " relative numbers
" Coding tidbits...
set autoindent
set textwidth=80

" Finding feature... 

" Search down into subfolders
" Provides tab-completion for all file-related tasks.
set path+=**
" Display all matching files when we tab complete.
set wildmenu

" File Browsing feature... (netrw, the built-in plugin)
" Tweaks
"let g:netrw_banner=0        " disable the banner thing.
let g:netrw_browse_split=4  " open file window behaviour (prior window)
let g:netrw_altv=1          " open file split behaviour (horizontal)
let g:netrw_liststyle=3     " tree view!
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

