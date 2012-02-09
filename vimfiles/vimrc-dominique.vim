" Maintainer:  Dominique Pelle <dominique.pelle at gmail.com>
" Last Change: 08 Aug 2010
" URL:         http://dominique.pelle.free.fr/.vimrc
"              http://dominique.pelle.free.fr/.vimrc.html
"
" Plugins used:
" - CSApprox or guicolorscheme (to get proper colors in terminal).
" - taglist (to print function name in statusline)

" Unlet g:color_names to avoid loading color scheme several times
" when sourcing ~/.virmc a second time. Several commands would trigger
" sourcing color scheme :syntax on and :set t_Co=256 and of course
" command :colorscheme itself.
if has('eval') | unlet! g:colors_name | endif

if has('multi_byte')
  scriptencoding utf-8
  set enc=utf-8
  set fileencodings=ucs-bom,utf-8,latin1
  if version >= 700
    set lcs=tab:»·,trail:·,eol:¶,extends:>,precedes:<,nbsp:×
  else
    set lcs=tab:»·,trail:·,eol:¶,extends:>,precedes:<
  endif
endif

if has('syntax') | syntax on | endif
if has('autocmd')
  filetype on
  filetype plugin on
endif

if has('gui_running')
  if has("win16") || has("win32") || has("win95") || has("win64")
    set guifont=Lucida\ Console:h10
  else
    set guifont=Monospace\ 9
  endif
  if exists('+toolbar') | set tb=icons  | endif
  if exists('tbis')     | set tbis=tiny | endif
else
  if has('eval') | let Tlist_Inc_Winwidth=0 | endif
endif

" I don't want to use synch too often on a laptop.
if exists('+fsync') | set nofsync | endif

" Don't wait 1s when pressing <esc>
set timeout timeoutlen=3000 ttimeoutlen=100

set nocompatible
set history=400
set textwidth=0
set backup
if has('persistent_undo')
  set undodir=~/UNDO
  set undofile
endif
if exists('+undoreload')  | set undoreload=100000    | endif
if exists('+cryptmethod') | set cryptmethod=blowfish | endif

" I don't like 'set mouse=a' behavior because it changes the position of
" the cursor when clicking in a window to give it focus.  I prefer
" 'set mouse=vic'.
if has('mouse') | set mouse=vic | endif

set wildmode=longest,list
set wildmenu

set splitbelow
set hidden
set nostartofline
set cpoptions=ces$
set backspace=indent,eol,start
set whichwrap+=<,>,[,]
set wrap
set showbreak=:
set laststatus=2
set shiftwidth=2
set shiftround
set softtabstop=2
set autoindent
set smartindent
set expandtab
set ignorecase
set infercase
set smartcase
set cino:0
set comments=sr:/*,mb:*,ex:*/
set formatoptions=tcqor
" set showfulltag
if exists('+autochdir') | set autochdir | endif
set visualbell
if has('cmdline_info')
  set ruler
  set showcmd
endif
set nonumber
set showmatch
if has('extra_search')
  set hlsearch
  set incsearch
endif
set nolist
set matchpairs+=<:>
set virtualedit=block
set display=lastline,uhex

set tags=tags,~/tags,~/stl-tags
set thesaurus=~/thesaurus/mthesaur.txt

if has('cscope')
  if filereadable(expand("$HOME/cscope.out"))
    cs kill -1
    cs add ~/cscope.out
  endif
  set cscopeverbose

  " Put output of cscope in quickfix window (use :copen)
  set cscopequickfix=s-,c-,d-,i-,t-,e-,g-
endif

set makeprg=make\ VERBOSE=\ DEBUG=yes

if has('eval')
  let g:lex_uses_cpp=1
  let g:yacc_uses_cpp=1
  let g:load_doxygen_syntax=1
  let g:is_posix=1
  let g:c_gnu=1
  let g:netrw_special_syntax=1
  let g:netrw_liststyle=3
  let g:netrw_browse_split=4
  let g:vimsyntax_noerror=1

  " Required to see the current function name in the status bar.
  let Tlist_Process_File_Always = 1

  " Configure HTML output with :TOhtml
  " let html_number_lines=1
  let html_use_css=1
  let html_use_xhtml=1
  let html_dynamic_folds=1

  " Set up for the CSApprox.vim plugin.
  let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
endif

" This mapping allows to stay in visual mode when indenting with < and >
vnoremap > >gv
vnoremap < <gv

noremap <c-]> g<c-]>
noremap <c-g> g<c-g>

" These mappings are useful in long wrapped lines when pressing <down> or <up>
" Use j or k to get the default behavior.
noremap <down> gj
noremap <up>   gk

 map <F2>      :set paste!<CR>:set paste?<CR>
imap <F2> <C-O>:set paste<CR>:set paste?<CR>
 map <F3>      :set number!<CR>:set number?<CR>
imap <F3> <C-O>:set number!<CR><C-O>:set number?<CR>
 map <F4>      :set hlsearch!<CR>:set hlsearch?<CR>
imap <F4> <C-O>:set hlsearch!<CR><C-O>:set hlsearch?<CR>
 map <F5>      :set list!<CR>:set list?<CR>
imap <F5> <C-O>:set list!<CR><C-O>:set list?<CR>
nnoremap <silent> <F6> :TlistToggle<CR>

if has('spell')
  set spell

  if has('eval')
    " Rotate through languages of spelling checker.
    let g:myLangIdx = 0
    let g:myLangCodes = [ "en_us", "eo", "fr", "it", "br" ]
    let g:myLangs = [ "language:", "lingvo:", "langue :", "lingua:", "yezh:" ]
    function! MySpellLang()
      let g:myLangIdx = g:myLangIdx + 1
      if g:myLangIdx >= len(g:myLangs) | let g:myLangIdx = 0 | endif

      if g:myLangIdx == 0 | setlocal spell spelllang=en_us | endif
      if g:myLangIdx == 1 | setlocal spell spelllang=eo    | endif
      if g:myLangIdx == 2 | setlocal spell spelllang=fr    | endif
      if g:myLangIdx == 3 | setlocal spell spelllang=it    | endif
      if g:myLangIdx == 4 | setlocal spell spelllang=br    | endif

      echo g:myLangs[g:myLangIdx] g:myLangCodes[g:myLangIdx]
    endf

    map  <F7>      :call MySpellLang()<CR>
    imap <F7> <C-o>:call MySpellLang()<CR>
  endif
  map  <F8> :set spell!<CR>
endif

" Tip #750: http://vim.wikia.com/wiki/VimTip750
" Underline the current line.
nnoremap <F9> yyp<c-v>$r-
inoremap <F9> <esc>yyp<c-v>$r-A

" Tip #99: display syntax group under the cursor.
map  <F10> :echo "hi<"
\ . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name")
\ . ">"<CR>

map  <F12> :!ctags -R --c++-kinds=+p --fields=+iaSn --extra=+q .<CR>

" Following mappings allow to cut undo to reduce granularity of
" undos. See also:
"   http://vim.wikia.com/wiki/Modified_undo_behavior
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>
inoremap <bs>  <c-g>u<bs>
inoremap <del> <c-g>u<del>
inoremap <tab> <tab><c-g>u
"imap     <space> <space><c-g>u
if version >= 700 && has('autocmd')
  " Undo break if I don't press a key in insert mode for a few seconds.
  au! CursorHoldI * call feedkeys("\<C-G>u", "nt")
endif

" Increase undolevel because of above mappings and because of persistent-undo.
set undolevels=4000

" Function used to display syntax group.
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

" Function used to display utf-8 sequence.
fun! ShowUtf8Sequence()
  try
    let p = getpos('.')
    redir => utfseq
    sil normal! g8
    redir End
    call setpos('.', p)
    return substitute(matchstr(utfseq, '\x\+ .*\x'), '\<\x', '0x&', 'g')
  catch
    return '?'
  endtry
endfunction

if has('statusline')
  if version >= 700
    " Fancy status line.
    set statusline =
    set statusline+=%#User1#                       " highlighting
    set statusline+=%n                             " buffer number
    set statusline+=%{'/'.bufnr('$')}\             " buffer count
    set statusline+=%#User2#                       " highlighting
    set statusline+=%f                             " file name
    set statusline+=%#User1#                       " highlighting
    set statusline+=%h%m%r%w\                      " flags
    set statusline+=%{(&key==\"\"?\"\":\"encr,\")} " encrypted?
    set statusline+=%{strlen(&ft)?&ft:'none'},     " file type
    set statusline+=%{(&fenc==\"\"?&enc:&fenc)},   " encoding
    set statusline+=%{((exists(\"+bomb\")\ &&\ &bomb)?\"B,\":\"\")} " BOM
    set statusline+=%{&fileformat},                " file format
    set statusline+=%{&spelllang},                 " spell language
    set statusline+=%(%{Tlist_Get_Tagname_By_Line()}%), " Function name
    set statusline+=%{SyntaxItem()}                " syntax group under cursor
    set statusline+=%=                             " indent right
    set statusline+=%#User2#                       " highlighting
    set statusline+=%{ShowUtf8Sequence()}\         " utf-8 sequence
    set statusline+=%#User1#                       " highlighting
    set statusline+=U+%04B\                        " Unicode char under cursor
    set statusline+=%-6.(%l/%{line('$')},%c%V%)\ %<%P           " position

    " Use different colors for statusline in current and non-current window.
    let g:Active_statusline=&g:statusline
    let g:NCstatusline=substitute(
      \                substitute(g:Active_statusline,
      \                'User1', 'User3', 'g'),
      \                'User2', 'User4', 'g')
  endif
endif

iab 8< --- 8< --- cut here --- 8< --- cut here --- 8< ---
iab fori for (i = 0; i <; i++)<cr>{<cr>}<Esc>kk0f<a
iab forj for (j = 0; j <; j++)<cr>{<cr>}<Esc>kk0f<a

if !exists(':DiffOrig')
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif

" OmniCppComplete
if version >= 700
  if has('insert_expand')
    let OmniCpp_NamespaceSearch   = 1
    let OmniCpp_GlobalScopeSearch = 1
    let OmniCpp_ShowAccess        = 1
    let OmniCpp_MayCompleteDot    = 1
    let OmniCpp_MayCompleteArrow  = 1
    let OmniCpp_MayCompleteScope  = 1
    let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

    if has('autocmd')
      " Automatically open/close the preview window.
      au! CursorMovedI,InsertLeave * if pumvisible() == 0 | sil! pclose | endif
      set completeopt=menuone,longest,preview
    endif
  endif
endif

if has('autocmd')
  " Source .vimrc when I write it.  The nested keyword allows
  " autocommand ColorScheme to fire when sourcing ~/.vimrc.
  au! BufWritePost .vimrc nested source %

  " Change color of cursor in terminal:
  " - red in normal mode.
  " - orange in insert mode.
  " Tip found there:
  "   http://forums.macosxhints.com/archive/index.php/t-49708.html
  " It works at least with: xterm rxvt eterm
  " But do nothing with: gnome-terminal terminator konsole xfce4-terminal
  if version >= 700
    if &term =~ "xterm\\|rxvt"
      ":silent !echo -ne "\033]12;red\007"
      let &t_SI = "\033]12;orange\007"
      let &t_EI = "\033]12;red\007"
      au! VimLeave * :sil !echo -ne "\033]12;red\007"
    endif
  endif

  " vim -b : edit binary using xxd-format
  " See :help hex-editing
  augroup Binary
    au!
    au BufReadPre   *.dat let &bin=1
    au BufReadPost  *.dat if  &bin   | %!xxd
    au BufReadPost  *.dat set ft=xxd | endif
    au BufWritePre  *.dat if  &bin   | %!xxd -r
    au BufWritePre  *.dat endif
    au BufWritePost *.dat if  &bin   | %!xxd
    au BufWritePost *.dat set nomod  | endif
  augroup END

  augroup CursorHighlight
    au!
    au WinEnter * let&l:statusline = g:Active_statusline
    au WinLeave * let&l:statusline = g:NCstatusline
  augroup END
endif

if &term != 'cygwin' && &term != 'linux'
  set t_Co=256
endif


" SmartTag mapping
nmap <C-_><C-_> :call SmartTag#SmartTag("goto")<CR>
nmap <C-_><C-W> :call SmartTag#SmartTag("split")<CR>
nmap <C-_><C-T> :call SmartTag#SmartTag("tab")<CR>
nmap <C-_><C-D> :call SmartTag#SmartTag("debug")<CR>

" rastafari colorscheme available at:
"   http://dominique.pelle.free.fr/rastafari.vim
"   http://dominique.pelle.free.fr/rastafari.vim.html
colorscheme rastafari
