setlocal iskeyword+=-

syntax keyword htmlTagName contained mjml
syntax match   htmlTagName contained /mj-\k\+/
syntax match   htmlArg     contained /\k\+=\@=/
