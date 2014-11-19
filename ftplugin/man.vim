" man page filetype plugin file
" Language:	man
" Maintainer:	SungHyun Nam <goweol@gmail.com>
" Last Change:	2013 Jul 17

" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" Ensure Vim is not recursively invoked (man-db does this)
" when doing ctrl-[ on a man page reference.
if exists("$MANPAGER")
  let $MANPAGER = ""
endif

" allow dot and dash in manual page name.
setlocal iskeyword+=\.,-

" Add mappings, unless the user didn't want this.
if !exists("no_plugin_maps") && !exists("no_man_maps")
  if !hasmapto('<Plug>ManBS')
    nmap <buffer> <LocalLeader>h <Plug>ManBS
  endif
  nnoremap <buffer> <Plug>ManBS :%s/.\b//g<CR>:setl nomod<CR>''

  nnoremap <buffer> <c-]> :call man#PreGetPage(v:count)<CR>
  nnoremap <buffer> <c-t> :call man#PopPage()<CR>
endif

let b:undo_ftplugin = "setlocal iskeyword<"

" vim: set et sw=2 ts=2:
