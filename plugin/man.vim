" Man page plugin
" Language:	man
" Maintainer:	SungHyun Nam <goweol@gmail.com>
" Last Change:	2013 Jul 17

if exists('loaded_man') || &cp
    finish
endif
let loaded_man = 1

if !exists("no_plugin_maps") && !exists("no_man_maps")
  nnoremap <Leader>K :call man#PreGetPage(0)<CR>
endif

com -nargs=+ Man call man#GetPage(<f-args>)

" vim: set et sw=2 ts=2:
