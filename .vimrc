
if filereadable(expand("~/.vimrc.after"))
	  source ~/.vimrc.after
	endif

" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif

" Enable per-directory .vimrc files and disable unsafe commands in them
" NOTE: Must be at the very end, after all sourcing — `set secure` blocks
" autocmd/shell/write commands for the rest of the startup chain.
set exrc
set secure
