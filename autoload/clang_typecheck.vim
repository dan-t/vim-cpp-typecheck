function! clang_typecheck#exec(...)
   let l:old_makeprg = &makeprg

   let l:cmd = 'clang-typecheck ' . join(a:000)
   let &makeprg = l:cmd
   lmake

   let &makeprg = l:old_makeprg
endfunction

function! clang_typecheck#print_error(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl None
endfunction

