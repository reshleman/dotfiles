" Automatically wrap at 72 characters and spell check commit messages
setlocal textwidth=72
setlocal spell

command! -nargs=1 -buffer Jira :normal i[<args>](https://transfix.atlassian.net/browse/<args>)<ESC>
