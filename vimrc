set tabstop=4 "A tab is 4 spaces
set expandtab "Always uses spaces instead of tabs
set softtabstop=4 "Insert 4 spaces when tab is pressed
set shiftwidth=4 "An indent is 4 spaces
set shiftround "Round indent to nearest shiftwidth multiple

set ruler
set number
set autoindent
syntax on
colorscheme ron
let mapleader=","

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ff=unix ts=%d sw=%d tw=%d %set :",
    \ &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
