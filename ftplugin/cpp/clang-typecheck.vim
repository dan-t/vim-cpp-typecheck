if exists('b:did_ftplugin_clang_typecheck') && b:did_ftplugin_clang_typecheck
   finish
endif

let b:did_ftplugin_clang_typecheck = 1

if !exists('s:has_clang_typecheck')
   let s:has_clang_typecheck = 0
   if !executable('clang-typecheck')
      call clang_typecheck#print_error('clang-typecheck is not executable!')
      finish
   endif
   let s:has_clang_typecheck = 1
endif

if !s:has_clang_typecheck
   finish
endif

if exists('b:undo_ftplugin')
   let b:undo_ftplugin .= ' | '
else
   let b:undo_ftplugin = ''
endif

command! -nargs=* -complete=file ClangTypecheckFile call clang_typecheck#exec(<f-args>)

let b:undo_ftplugin .= join(map([
   \ 'ClangTypecheckFile',
   \ ], '"delcommand " . v:val'), ' | ')

let b:undo_ftplugin .= ' | unlet b:did_ftplugin_clang_typecheck'
