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
  source c:/Users/bhunt/Documents/vimfiles/vimrc
else
  source $HOME/.vim/vimrc
endif

" Turn off modifiable flag, this shouldn't change - vimrc is in vimfiles/ or
" .vim/ dir
" vim: set nomodifiable ts=2 sw=2 sts=2 expandtab:

