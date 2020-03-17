" Override netrw's `C-l` mapping, since we have tmux keybindings for that.
nnoremap <buffer> <C-l> :TmuxNavigateRight<cr>
