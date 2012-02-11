" mine
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=[%{&ff}]\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}%-16(\ %l,%c-%v\ %)%P
"[13] vimfiles/statusline-examples.vim [+][vim]                            [dos] [Git(master)] 4,18-18        33%
hi User1 ctermbg=blue ctermfg=gray guibg=blue guifg=gray
hi User2 ctermbg=blue ctermfg=yellow guibg=blue guifg=yellow
hi User3 ctermbg=gray ctermfg=black guibg=gray guifg=black
hi User4 ctermbg=gray ctermfg=black guibg=gray guifg=black
set statusline=%4(%m%r%)\ %<%.99f\ %h%w%#User1#[%{&ff}]%*%=%#User1#%y%*\ %#User2#%{exists('g:loaded_fugitive')?fugitive#statusline():''}%*%-16(\ %l,%c%V\ %)%P
" Use different colors for statusline in current and non-current windows
    let g:Active_statusline=&g:statusline
    let g:NCstatusline=substitute(
      \                substitute(g:Active_statusline,
      \                'User1', 'User3', 'g'),
      \                'User2', 'User4', 'g')
" my statusline breakdown {{{1
set statusline=[%n]                    " [buffer number]
set statusline+=\                      " space
set statusline+=%<                     " truncation point
set statusline+=%.99f                  " relative path to file, allow 99 chars
set statusline+=\                      " space
set statusline+=%h                     " indicator:help
set statusline+=%w                     " indicator:
set statusline+=%m                     " indicator:modified
set statusline+=%r                     " indicator:read-only
set statusline+=%{exists('*CapsLockStatusline')?CapsLockStatusline():''}
set statusline+=%y                     " filetype
set statusline+=%=                     " left/right separator
set statusline+=[%{&ff}]               " fileformat
set statusline+=\                      " space
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=%-16(\ %l,%c-%v\ %)    " left justify, 16 spaces
                                       " space
                                       " current line
                                       " column
                                       " virtual column
                                       " space
set statusline+=%P                     " Top|% of file|Bot
"}}}

" scrooloose
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P
"statusline-examples.vim[none,dos][+][vim]                                                          13,73/166 33%
"{{{1
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
"}}}


" wincent statusline
" cf the default: set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"vimfiles/statusline-examples.vim [+]                                                            73,13       33%
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
" 13:vimfiles/statusline-examples.vim [+][vim]                                     line: 73 of 209, col: 13 (22%)
"{{{1
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer
"   %) end of width specification
"}}}


" spiiph's
"set statusline=%<\ %2*[%n%H%M%R%W]%*\ %-40f\ %=%1*%y%*%*\ %10((%l,%c)%)\ %P
" [13,+] vimfiles/statusline-examples.vim                                                    [vim]    (73,13) 33%
" [13,+] and [vim] are gray on black
"{{{1
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
set statusline+=%-40f\                    " path
set statusline+=%=%1*%y%*%*\              " file type
set statusline+=%10((%l,%c)%)\            " line and column
set statusline+=%P                        " percentage of file
"}}}


" jamessan's
"set statusline=%-3.3n\ %f\ %h%m%r%w[%{strlen(&ft)?&ft:'none'},%{strlen(&fenc)?&fenc:&enc}, %{&fileformat}]%=%{synIDattr(synID(line('.'),col('.'),1),'name')}\ %b,0x%-8B\ %-14.(%l,%c%V%)\ %<%P
"13  vimfiles/statusline-examples.vim [+][vim,latin1,dos]                             0,0x0      73,13        33%
"{{{1
set statusline=   " clear the statusline for when vimrc is reloaded
set statusline+=%-3.3n\                      " buffer number
set statusline+=%f\                          " file name
set statusline+=%h%m%r%w                     " flags
set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline+=%{&fileformat}]              " file format
set statusline+=%=                           " right align
set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
set statusline+=%b,0x%-8B\                   " current char
set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
"}}}

" tpope's
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%{exists('g:loaded_fugitive')?fugitive#statusline():''}%-16(\ %l,%c-%v\ %)%P
"set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
"[13] vimfiles/statusline-examples.vim [+][vim]                              [dos] [Git(master)] 73,13-13     33%

" Daily Vim Devotional
set statusline=%F\ %m\ %{fugitive#statusline()}\ %y%=%l,%c\ %P
" ~/vimfiles/statusline-examples.vim [+] [Git(master)] [vim]                                            73,13 33%

" frogonwheels
set statusline=%f%w%m%h%1*%r%2*%{VarExists('b:devpath','<Rel>')}%3*%{VarExists('b:relpath','<Dev>')}%=%-15(%l,%c%V%)%P
"vimfiles/statusline-examples.vim[+]  <all black after this>                                       73,13      33%
"{{{1
"set statusline=%f%w%m%h%1*%r%2*%{VarExists('b:devpath','<Rel>')}%3*%{VarExists('b:relpath','<Dev>')}%{XLockStat()}%=%-15(%l,%c%V%)%P
function! VarExists( varName, outputStr )
    if exists(a:varName)
        return a:outputStr
    else
        return ""
    endif
endfunction
"}}}

" godlygeek's
let &statusline='%<%f%{&mod?"[+]":""}%r%{&fenc !~ "^$\\|utf-8" || &bomb ? "[".&fenc.(&bomb?"-bom":"")."]" : ""}%=%15.(%l,%c%V %P%)'

" Bill (Bee-16)
set showmode  showcmd  cmdheight=2 
set laststatus=2           " always show statusline 
highlight StatusLine NONE ctermbg=DarkGreen ctermfg=White cterm=NONE 
"01 .vimrc[unix]                                                        [83 x53]         8:6/55 11:105/890 11%- >
"{{{1}
if has("statusline") 
  set statusline =          " clear 
  set statusline+=%02n      " leading zero 2 digit buffer number 
"xset statusline+=\ %<%F    " file full path, truncate 
  set statusline+=\ %t      " file tail 
  set statusline+=[%{&ff}]  " [fileformat] 
  set statusline+=%r        " read only flag '[RO]' 
  set statusline+=%m        " modified flag '[+]' if modifiable 
  set statusline+=%h        " help flag '[Help]' 
  set statusline+=%=        " left/right separation point 
  set statusline+=[%b       " decimal byte 
  set statusline+=\ x%02B]  " hex byte ' \x62' 
  set statusline+=\ %{(line('.')-1)%16} " line 
  set statusline+=:%{(line('.')-1)/16}  " block 
  set statusline+=\/%{line('$')/16}     " max block 
  set statusline+=\ %c      " column number 
  set statusline+=%V        " virtual column '-{n}' 
  set statusline+=:%l/%L    " line/lines 
  set statusline+=\ %p%%    " percent of file 
"xset statusline+=\ %P      " percent of file{4} Top | n% | Bot 
  set statusline+=%{&hlsearch?'+':'-'} 
  set statusline+=%{&paste?'=':'\ '} 
  set statusline+=%{&wrap?'<':'>'} 
endif 
"}}}


" Miscellaneous functions and notes {{{1
" Another way to write godlygeeks:
set statusline=%<%f%m%r%{Fenc()}%=%15.(%l,%c%V\ %P%)
function! Fenc()
    if &fenc !~ "^$\|utf-8" || &bomb
        return "[" . &fenc . (&bomb ? "-bom" : "" ) . "]"
    else
        return ""
    endif
endfunction

" scrooloose function example
set statusline=......%{FileSize()}.....
function! FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return ""
    endif
    if bytes < 1024
        return bytes
    else
        return (bytes / 1024) . "K"
    endif
endfunction

" from scrooloose
" Note that you must define your custom highlight groups after any :colorscheme in your vimrc otherwise your highlight groups will be cleared when :colorscheme is called.
 "1 set statusline=
 "2 set statusline+=%#todo#  "switch to todo highlight
 "3 set statusline+=%F       "full filename
 "4 set statusline+=%#error# "switch to error highlight
 "5 set statusline+=%y       "filetype
 "6 set statusline+=%*       "switch back to normal statusline highlight
 "7 set statusline+=%l       "line number

" 1 "define 3 custom highlight groups
" 2 hi User1 ctermbg=green ctermfg=red   guibg=green guifg=red
" 3 hi User2 ctermbg=red   ctermfg=blue  guibg=red   guifg=blue
" 4 hi User3 ctermbg=blue  ctermfg=green guibg=blue  guifg=green
" 5 
" 6 set statusline=
" 7 set statusline+=%1*  "switch to User1 highlight
" 8 set statusline+=%F   "full filename
" 9 set statusline+=%2*  "switch to User2 highlight
"10 set statusline+=%y   "filetype
"11 set statusline+=%3*  "switch to User3 highlight
"12 set statusline+=%l   "line number
"13 set statusline+=%*   "switch back to statusline highlight
"14 set statusline+=%P   "percentage thru file
 
" from vim.runpaint.org
" \%{strftime(\"\%c\",getftime(expand(\"\%\%\")))}
" Sample output: Fri 01 May 2009 19:26:07 BST
"
"set statusline=%t\ %y\ format:\ %{&ff};\ [%c,%l]
" Sample output: .vimrc [vim] format: unix [2,3]
"
" vim: set ts=2 sw=2 sts=2 expandtab foldmethod=marker:
"}}}
