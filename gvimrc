" No audible bell
set vb

" Use console dialogs
set guioptions+=c

" Default Font
set guifont=Inconsolata-g:h16

" Default window dimensions
set columns=171 lines=66

" Gvim options
set guioptions-=T
set guioptions-=m
set guioptions-=r
set guioptions-=L
set guioptions-=t
set mousehide

" Use dispatch for vim-rspec
let g:rspec_command = "Dispatch rspec {spec}"
