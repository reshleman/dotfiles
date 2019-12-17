" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{jscs,jshint,eslint}rc set filetype=json
  autocmd BufRead,BufNewFile *.cjsx set filetype=coffee

  " ALE linting events
  if g:has_async
    set updatetime=1000
    let g:ale_lint_on_text_changed = 0
    autocmd CursorHold * call ale#Queue(0)
    autocmd CursorHoldI * call ale#Queue(0)
    autocmd InsertEnter * call ale#Queue(0)
    autocmd InsertLeave * call ale#Queue(0)
  else
    echoerr "ALE requires NeoVim or Vim 8"
  endif
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Text formatting:
" - (j) remove comment leader when joining lines
" - (n) recognize numbered lists
set formatoptions+=jn

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ag_prg="ag --vimgrep"

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag -Q -l --nocolor --hidden -g "" %s'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  if !exists(":Ag")
    command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
    nnoremap \ :Ag<SPACE>
  endif
endif

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Switch between the last two files
nnoremap <Leader><Leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <Leader>gt :TestVisit<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Set tags for vim-fugitive
set tags^=.git/tags

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Move between linting errors
nnoremap ]r :ALENextWrap<CR>
nnoremap [r :ALEPreviousWrap<CR>

" Set spellfile
set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Color Settings
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Make Ruby quotes red, not blue (override theme in thoughbot/dotfiles)
highlight link rubyStringDelimiter Delimiter

" Python-friendly settings for vim-tmux-runner, recommended by the README
let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1

" Mappings for opening, attaching, and focusing the tmux runner
nmap <leader>osr :VtrOpenRunner {'orientation': 'h', 'percentage': 50}<cr>
nnoremap <leader>va :VtrAttachToPane<cr>
nnoremap <leader>fr :VtrFocusRunner<cr>

" Mappings to send current and visually-selected line(s) to the tmux runner
nmap <C-f> :VtrSendLinesToRunner<cr>
vmap <C-f> :VtrSendLinesToRunner<cr>

" Use vim-tmux-runner for vim-rspec
let g:rspec_command = "call VtrSendCommand('rspec {spec}')"

" Extra mapping for vim-rspec
nnoremap <Leader>a :call RunAllSpecs()<CR>

"Auto-indent entire file and return to previous cursor location
map <Leader>i mmgg=G`m

"Format JSON and XML
map <Leader>js :silent %!python -m json.tool<cr>
map <Leader>xml :silent %!xmllint --format --recover - 2>/dev/null<cr>

" Automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

" Zoom a vim pane, <leader>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" Quickly search dotfiles with Ctl-P
nmap <leader>df :CtrlP ~/Code/reshleman/dotfiles<cr>

" Reduce wait time for key code or mapped key sequence to complete.
set timeoutlen=500

" Set up persistent undo
if has('persistent_undo')
    let s:myUndoDir = expand('$HOME/.vimundo')
    if !isdirectory(s:myUndoDir)
      call mkdir(s:myUndoDir, 'p')
    endif
    execute 'set undodir=' . s:myUndoDir
    set undofile
endif

" Show :Ag key mapping hint text in quickfix window
let g:ag_apply_qmappings = 1
let g:ag_mapping_message = 1

" Always use global Python linters, not those from a virtualenv
let g:ale_python_flake8_use_global=1
let g:ale_python_pylint_use_global=1

" Use project-specific Python linter config, if available
if filereadable("etc/pep8.cfg")
  let g:ale_python_flake8_options="--config=etc/pep8.cfg"
  let g:ale_python_flake8_change_directory=0
endif
if filereadable("etc/pylintrc")
  let g:ale_python_pylint_options="--rcfile=etc/pylintrc"
  let g:ale_python_pylint_change_directory=0
endif

let g:ale_linters = {'python': ['pylint', 'flake8']}

" Enable all syntax highlighting from 'vim-python/python-syntax'
let g:python_highlight_all = 1

" 'vim-python/python-syntax' is sometimes unusably slow when using the default
" regex engine; forcing the 'old' engine appears to resolve this.
set regexpengine=1
