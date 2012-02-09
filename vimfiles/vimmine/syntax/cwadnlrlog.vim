" Vim syntax file
" Language:		Downloader.NET log file
" Written By:	Brett Hunt <brett@clearwateranalytics.com>
" Created:		2007-08-28
" Maintainer:	Brett Hunt <brett@clearwateranalytics.com>
" Last Change:	August 28, 2007
" Description:	Syntax file for Clearwater Analytics Downloader.NET log files
"				Some of this code was based loosely on the changelog.vim
"				syntax file.
"

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case match
" case match|ignore
syn spell toplevel
" spell toplevel|notoplevel

"syn keyword Identifier	INFO
"syn keyword Todo	WARN
"syn keyword Error	ERROR

syn match INFO excludenl "INFO.*\s-\s.*"
"syn match Error excludenl "ERROR.*\s-\s.*"
syn region Error start="^[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}.*\sERROR" end="^[0-9]\{4\}-[0-9]\{2\}-[0-9]\{2\}"
syn match Todo excludenl "WARN\s*.*\s-\s.*" contains=cwadtypeSecurity,cwadtypeMailer,cwadtypeRepSite,cwadtypeEDS,cwadtypeAccount,cwadtypeScheduler

syn match cwadtypeSecurity contained "\sSecurity\s*-"
syn match cwadtypeMailer contained "\sMAILER\s*-"
syn match cwadtypeRepSite contained "\sReportingSite\s*-"
syn match cwadtypeEDS contained "\s[A-Za-z0-9]*ExtendedDataSet\s*-"
syn match cwadtypeAccount contained "\sAccount\s*-"
syn match cwadtypeScheduler contained "\sScheduler\s*-"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_changelog_syntax_inits")
  if version < 508
    let did_changelog_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  if version >= 600
"    HiLink changelogFuncs	Comment
  endif

  HiLink cwadtypeSecurity   Special
  HiLink cwadtypeMailer		PreProc
  HiLink cwadtypeRepSite	Statement
  HiLink cwadtypeEDS		Statement
  HiLink cwadtypeAccount	Statement
  HiLink cwadtypeScheduler	Type

  delcommand HiLink
endif

let b:current_syntax = "cwadnlrlog"

