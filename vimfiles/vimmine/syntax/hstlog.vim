" $Id: $
" Vim syntax file
" Language:    HST log files
" Maintainer:  -orphan-
" Last Change: $Date: $
" Original Author: Brett Hunt
" Remark:      Add some color to log files (tprog|health|thermal*.log)
"              This file is basically a rework of Bob Hiestand's syslog.vim
"              originally found here:
"              http://www.vim.org/scripts/script.php?script_id=419

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Order is important - the last matching pattern is used.
" So we match most specific at the end and then gradually come back up
" to non-specific matches
" 6. Match substrins of the message
syn match hstlogErrStr /\c\(error\|\<failed\>\|\<failure\>\|\<fail\>\)/ contained
" 5. Match the message so we can color it
"    hs=s+6 -> highlight start, start of match + 6 chars (skip over log level)
syn match hstlogDebugMsg /.*/ contained contains=hstlogErrStr
syn match	hstlogTextMsg /.*/ contained contains=hstlogErrStr
syn match	hstlogNoticeMsg /.*/ contained contains=hstlogErrStr
syn match	hstlogWarningMsg /.*/ contained
syn match	hstlogErrorMsg /.*/ contained
syn match	hstlogCriticalMsg /.*/ contained
" 3. Match the level and message
syn region	hstlogMessage	start=+\[+ end=+$+ contains=hstlogCritical,hstlogError,hstlogWarning,hstlogNotice,hstlogText,hstlogDebug
" 4. Match the log level
syn match	hstlogDebug	/\[\d,\(7\|8\)\]\s/ contained skipwhite nextgroup=hstlogDebugMsg transparent
syn match	hstlogText	/\[\d,\(4\|6\)\]\s/ contained skipwhite nextgroup=hstlogTextMsg transparent
syn match	hstlogNotice	/\[\d,5\]\s/ contained skipwhite nextgroup=hstlogNoticeMsg transparent
syn match	hstlogWarning	/\[\d,3\]\s/ contained skipwhite nextgroup=hstlogWarningMsg transparent
syn match	hstlogError	/\[\d,2\]\s/ contained skipwhite nextgroup=hstlogErrorMsg transparent
syn match	hstlogCritical	/\[\d,1\]\s/ contained skipwhite nextgroup=hstlogCriticalMsg
" 2. Match name of module sending message to log
syn match	hstlogFacility	/\[\S\{-1,}\]/ nextgroup=hstlogMessage skipwhite
" 1. Match start of log line
syn match	hstlogDate	/^\(\d\{4}-\d\d-\d\d\s\d\d:\d\d:\d\d\)*/ nextgroup=hstlogFacility skipwhite


if !exists("did_hstlog_syntax_inits")
  let did_hstlog_syntax_inits = 1
  hi link hstlogDate	Normal
  hi link hstlogFacility	Keyword
  hi link hstlogCriticalMsg	Error
  hi link hstlogErrorMsg	Error
  hi link hstlogWarningMsg	Todo
  hi link hstlogNoticeMsg	Identifier
  hi link hstlogTextMsg	Normal
  hi link hstlogDebugMsg	Comment
  hi link hstlogErrStr String
endif

let b:current_syntax="hstlog"

" vim: ts=2 sw=2 sts=2 expandtab autoindent smartindent

