vim-clang-typecheck
===================

This is a plugin for the [vim](http://www.vim.org/) editor for the command [clang-typecheck](https://github.com/dan-t/clang-typecheck).

Installation
------------

The recommended way is to use [pathogen.vim](<https://github.com/tpope/vim-pathogen/>):

    $> cd ~/.vim/bundle
    $> git clone https://github.com/dan-t/vim-clang-typecheck

Configuration
-------------

For type checking the current C++ source file with a database a shortcut like this could be put into `~/.vim/after/ftplugin/cpp.vim`:

    nmap <silent> <F1> :silent update <bar> silent ClangTypecheckFile '%:p' path_to/compile_commands.json<CR>

This will by pressing `F1` write all changed files and call `ClangTypecheckFile` with the absolute path of the
C++ source file of the current window and the database `path_to/compile_commands.json`, which has to be specified
by the user.

This will populate the location list of the current window with the type check errors - if any are available.
The location list can be opened by calling `:lwindow`.

If the location list should be automatically opened/closed in the case of errors the following `autocmd`
can be added to `~/.vimrc`:

    autocmd QuickFixCmdPost l* nested lwindow
