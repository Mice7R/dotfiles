" vim:foldmethod=marker:foldlevel=0

set nocompatible
set modeline
set modelines=3
set backspace=2 "Make bcksp work as *should*

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

autocmd BufEnter * EnableStripWhitespaceOnSave

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" Powerline {{{
"python3 from powerline.vim import setup as powerline_setup
"python3 powerline_setup()
"python3 del powerline_setup
" }}}
" FileType {{{
" FileType commentstring {{{
autocmd Filetype vim setlocal commentstring=\"\ %s
autocmd Filetype make,dockerfile,sh,ruby,python setlocal commentstring=#\ %s
autocmd Filetype htmldjango setlocal commentstring={%\ comment\ %}\ %s\ {%\ endcomment\ %}
autocmd Filetype plaintex,tex setlocal commentstring=%\ %s
autocmd Filetype plantuml setlocal commentstring='\ %s
" }}}
autocmd Filetype make setlocal noet
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
hi LineNr ctermfg=246
set ruler
set number
set cursorline
set showmatch
set wildmenu
set lazyredraw
set splitbelow
set splitright
" }}}
" Shorcuts & Remaping {{{
let mapleader=","
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" highlight last inserted text
nnoremap gV `[v`]
nnoremap <silent> <Leader>nt :NERDTreeToggle<CR>
" }}}
" Functions {{{
" Insert modeline in line 0 in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf("vim: set ff=unix ft=%s ts=%d sw=%d tw=%d sts=%d %set :",
    \ &filetype, &tabstop, &shiftwidth, &textwidth, &softtabstop, &expandtab ? '' : 'no')
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line(0), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
" }}}
set statusline=%f\ %y\ %h%w%m%r\ [fo\=%{&fo}]\ %=%([%n]\ %l,%c%V\ %=\ %P%)
