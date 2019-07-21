" Dein.vim
" ...deing is not installed currently, so commented out.
" ...but some of these we want to have anyway.
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
"set runtimepath+=/home/arnas/.vim/dein/repos/github.com/Shougo/dein.vim

" Required:
"if dein#load_state('/home/arnas/.vim/dein')
"  call dein#begin('/home/arnas/.vim/dein')

  " Let dein manage dein
  " Required:
"  call dein#add('/home/arnas/.vim/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
"  call dein#add('altercation/vim-colors-solarized')
"  call dein#add('itchyny/lightline.vim')
"  call dein#add('junegunn/limelight.vim')
  " Required:
"  call dein#end()
"  call dein#save_state()
"endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif
" End of Deing.vim ------------------------------------------------------------

" Other config/my own stuff...
"

" Fck the escape key.
:inoremap jj <Esc>

set background=dark
colorscheme default
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

