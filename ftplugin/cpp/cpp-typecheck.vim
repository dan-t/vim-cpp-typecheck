if exists('b:did_ftplugin_cpp_typecheck') && b:did_ftplugin_cpp_typecheck
   finish
endif

let b:did_ftplugin_cpp_typecheck = 1

if !exists('s:has_cpp_typecheck')
   let s:has_cpp_typecheck = 0
   if !executable('cpp-typecheck')
      call cpp_typecheck#print_error('cpp-typecheck is not executable!')
      finish
   endif
   let s:has_cpp_typecheck = 1
endif

if !s:has_cpp_typecheck
   finish
endif

if exists('b:undo_ftplugin')
   let b:undo_ftplugin .= ' | '
else
   let b:undo_ftplugin = ''
endif

command! -nargs=* -complete=file CppTypecheckFile call cpp_typecheck#exec(<f-args>)

let b:undo_ftplugin .= join(map([
   \ 'CppTypecheckFile',
   \ ], '"delcommand " . v:val'), ' | ')

let b:undo_ftplugin .= ' | unlet b:did_ftplugin_cpp_typecheck'
