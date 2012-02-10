" This is the kicker file - it attempts to detect the OS
" and then sets VIMRUNTIME path for my Windows preferred
" location if needed, finally it sources my actual vimrc
"
" WINDOWS: install as $HOME/_vimrc (c:/users/bhunt/_vimrc)
"    vim config in ~/Documents/vimfiles
" LINUX: install as $HOME/.vimrc (/home/bhunt/.vimrc)
"    vim config in ~/.vim

" Check what kind of OS we have and adjust runtime paths as necessary
if has("win16") || has("win32") || has("win64")
  fun! MySys()
    return "windows"
  endfun

  set runtimepath=C:/Users/bhunt/Documents/vimfiles,$VIM,$VIMRUNTIME,C:/Users/bhunt/Documents/vimfiles/after
  cd c:/Users/bhunt/Documents
  let g:my_vimrc = "c:/Users/bhunt/Documents/vimfiles/vimrc"
else
  let g:my_vimrc = "$HOME/.vim/vimrc"
endif

if filereadable(g:my_vimrc)
  execute "source" g:my_vimrc
else
  " OOPS! Couldn't find my actual vimrc, do some minimal config
  " stuff here to make vim just a little more comfortable while
  " I fix it.
  set nocompatible
  set enc=utf-8
  set laststatus=2
  set backspace=2
  set ignorecase smartcase
  set hlsearch incsearch
  set showmatch
  set ai
  set shiftwidth=4
  set softtabstop=4
  set tabstop=4
  set noexpandtab
  set nosi
  set viminfo='20,<1000,s50,h,rA:,rB:,!,c
    " ' num of files to save info for
    " < num lines to save per register
    " s max # kilobytes of data per item (register)
    " h turn off hisearch
    " r 'removable' ignore files with paths starting with ..., for example a:
    "   or b:
    " ! store data for all caps macros
    " c convert text to current encoding value in viminfo
  set sessionoptions+=options,curdir,buffers,help,blank,resize,winpos
    " :help mksession for more information
    " also see mapping below for F2
    " usage: :mksession ; :so Vimsession
  syntax on
  set background=dark
  "colors torte
  filetype plugin indent on
  set linebreak showbreak=>\  

endif

" Turn off modifiable flag, this shouldn't change - vimrc is in vimfiles/ or
" .vim/ dir
" vim: set nomodifiable ts=2 sw=2 sts=2 expandtab:

