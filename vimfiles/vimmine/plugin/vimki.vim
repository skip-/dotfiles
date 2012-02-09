" [[vimki.vim]]
" 
" Use your own tags with vim.
" 
" FUNCTIONS:
" 
"     VimkiTagsfileUpdate(pattern,offsetpre,offsetpost,tagsfile)
" 
" Scan the current file for occurrences of pattern, remove offsetpre
" characters from the start, and offsetpost characters from the end of 
" the hits, and add the resulting 'tags' to the tagsfile.
" 
" MAPS:
" 
"   For now, these maps apply to the tagsfile d:/me/vimki_tags, to tags of 
"   the form [[The tag]], and to links of the form |The tag|.
" 
"   ,ut                    Update tagsfile for current file.
"   ,uT                    Update tagsfile for all currently loaded files.
"   ,et                    Edit tagsfile.
"   ,j or <2-LeftMouse>    Jump to tag under cursor.
" 
" EXAMPLE: put a destination in your file:
" 
"   [[My tag]]
" 
" hit ,ut. Now when you put 
" 
"   |My tag|
" 
" in another file, and double-click it (or hit ,j), you jump to [[My tag]]
"
"
"
"
" This was originally "tags.vim" by Jos van Riswick
" (http://www.xs4all.nl/~josvanr/). I basically changed the function names, the
" criteria for what was a valid tag (from **tag** to [[tag]]) so the tag would
" appear more like a wiki tag. Also changed
"
" -----------------------------------------------------------------------------
map ,ut :call VimkiTagsfileUpdate("\\[\\[.*\\]\\]",2,2,"c:/documents and settings/bhunt/my documents/saved/Today/tags")<cr>
"map ,ut :call VimkiTagsfileUpdate("\([A-Z][a-z]\+\.\)\?\([A-Z][A-Z0-9]*[a-z0-9]\+\)\{2,}",0,0,expand("~/.")."vimki_tags")<cr>
map ,uT :call VimkiTagsfileUpdateAll()<cr>
map ,et :execute "e! 'c:/documents and settings/bhunt/my documents/saved/Today/tags'"<cr>gg
map ,j  :call VimkiTagsfileJump()<cr>
map ,nt :call VimkiNewFile()<cr>
" ----------------------------------------------------------------------------- 
if !exists("_tags_vim_sourced")
let _tags_vim_sourced=1
" ----------------------------------------------------------------------------- 
set tags+=~/vimfiles/vimki_tags,c:/documents\ and\ settings/bhunt/my\ documents/saved/Today/tags
set notagbsearch

function! VimkiTagsfileJump()
  update
  execute "normal ?\|\rlv/\|\rh\"zy"
  execute "tag ".@z
  normal zt
endfunction

function! VimkiTagsfileUpdateAll()
  let bl=bufnr("$")
  let i=1
  while i<=bl
    if bufexists(i)
      execute "b!".i
      normal ,ut
    endif
    let i=i+1
  endwhile
  echo system("ctags -f tags --sort=yes --format=2 --excmd=pattern --language-force=Twiki *.vimki")
endfunction

function! VimkiNewFile()
    let name=input("New Vimki Page Name_ ")
    if "" == name
      return
    endif
    let pagename=substitute(name,' ','','g')
    let tidx=strridx(simplify(bufname("%")),"/") + 1
    let tpidx=strridx(simplify(bufname("%")),".")
    let curname=strpart(simplify(bufname("%")), tidx, tpidx-tidx)
    echomsg "Will create new file '".pagename."'"
    "let pagename = "Page_".name
    let header="---+ ".name
      let template="Vimki Page: [[".pagename."]]\n\n|Home|\n\n".header
    let this="|".pagename."|"
    " i this;
    execute "normal a ".this
    "execute "normal:w!\<CR>"
    update
    let file=pagename.".vimki"
    " If the file doesn't exist
    if -1 == getfsize(file)
      echomsg "Creating new file '".pagename."'"
      let cmd ="echo \"".template."\" >> ".file
      echo system(cmd)
    endif
    echomsg "Attempting to edit file '".pagename."'"
    execute "normal:edit ".file."\<CR>"
    " Now append the back link to the top list of links if it doesn't exist yet.
    normal gg
    let lineno=search("^|Home|",'W')
    " If we found it, append the back link
    if 0 != lineno
      let linkline=getline(lineno)
      let tidx=match(linkline, "|".curname."|")
      "execute "normal A [DEBUG::lineno ".lineno." tidx ".tidx."]"
      " If the link isn't there
      if -1 == tidx
        execute "normal A |".curname."|"
      endif
    endif
    " Save our (potential) change
    update
"    normal ,ut
"    " Instead of editing it, let's take advantage of the
"    " tagstack and jump to the new tag.
"    execute "normal :bdelete\<CR>"
"    execute "normal :tag ".pagename."\<CR>"
endfunction

" Update tagfile for targets in current file
" p="\\[\\[.*\\]\\]"    find all occurrences of [[A target]]
" offsetpre=2              remove the first two chars: A target]]
" offsetpost=2             remove the last two chars: A target
" let a=TagsfileUpdate("\\[\\[.*\\]\\]",2,2,"d:/me/vimki_tags")                     
function! VimkiTagsfileUpdate(p,offsetpre,offsetpost,tagsfile)
  let oldch=&ch|set ch=5|let fn=expand("%:p")|let out=""
  let i=1|let n=line("$")
  while i<=n
    let l=matchstr(getline(i),a:p)
    if l!=""
      let t=strpart(l,a:offsetpre,strlen(l)-a:offsetpre-a:offsetpost)
      let out=out.t."\t".fn."\t/".l."\n"
    endif
    let i=i+1
  endwhile
  let bn=bufnr("%")
  execute "sp! ".a:tagsfile
  let fn=fnamemodify(fn,":gs?\\?\\\\\\?")
  let i=1|let n=line("$")
  while i<=n
    execute i
    if match(getline("."),fn)>0
      execute "normal dd"
    else
      let i=i+1
    endif
  endwhile
  let @a=out
  execute "normal gg\"aP"
  execute "w!|bd|b".bn
  let &ch=oldch
endfunction

" ----------------------------------------------------------------------------- 
endif
" ----------------------------------------------------------------------------- 
