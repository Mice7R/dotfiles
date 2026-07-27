" vim: set ff=unix ft=vim ts=4 sw=4 tw=0 sts=4 et :
setlocal foldmethod=syntax

syn region  pythonFunctionFold	start="^\z(\s*\)\%(def\|class\)\>"
  \ end="\ze\%(\s*\n\)\+\%(\z1\s\)\@!." fold transparent
syn region  pythonFold matchgroup=pythonComment
  \ start='#.*{{{.*$' end='#.*}}}.*$' fold transparent
