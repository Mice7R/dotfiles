" vim:foldmethod=marker:foldlevel=0

set nocompatible
set modeline
set modelines=3
set backspace=2 "Make bcksp work as *should*

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

" Powerline {{{
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
" }}}
" Indentation & Folding {{{
set autoindent
set tabstop=4 "A tab is 4 spaces
set expandtab "Always uses spaces instead of tabs
set softtabstop=4 "Insert 4 spaces when tab is pressed
set shiftwidth=4 "An indent is 4 spaces
set shiftround "Round indent to nearest shiftwidth multiple
" Foldign
set foldenable " enable folding
set foldlevelstart=4
set foldnestmax=10
" }}}
" Colors & UI {{{
set t_Co=256
syntax on
filetype indent on
colorscheme ron
set laststatus=2 "Always show status line
set ruler
set number
set cursorline
set showmatch
set wildmenu
set lazyredraw
" }}}
" Shorcuts & Remaping {{{
let mapleader=","
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]
" }}}
" Functions {{{
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ff=unix ts=%d sw=%d tw=%d sts=%d %set :",
    \ &tabstop, &shiftwidth, &textwidth, &softtabstop, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
" }}}
set statusline=%f\ %y\ %h%w%m%r\ %{fugitive#statusline()}\ %=%(%l,%c%V\ %=\ %P%)
