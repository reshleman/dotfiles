" Automatically wrap at 72 characters and spell check commit messages
setlocal textwidth=72
setlocal spell

function! s:JiraMarkdownLink(...)
  if a:0 == 0  " No args provided, use git branch name
    let l:ticket_num = fugitive#Head()
  else  " Ticket number is passed as only argument
    let l:ticket_num = a:1
  endif

  return "[" . l:ticket_num . "](https://transfix.atlassian.net/browse/" . l:ticket_num . ")"
endfunction

command! -nargs=? -buffer Jira :normal "=s:JiraMarkdownLink(<f-args>)<C-M>p
