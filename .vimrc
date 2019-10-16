"set nocompatible              " be iMproved, required
set autoindent
set tabstop=2
set expandtab
set shiftwidth=2
syntax enable
filetype plugin indent on
set modelines=5

"Set backspace to normal functio
set backspace=indent,eol,start

"Use pathogen
execute pathogen#infect()

"Use 'nu' to set or unset number
set number
map nu :set invnumber<CR>

"Use 'gu' to set or unset git-gutter
map gu :GitGutterToggle<CR>
set updatetime=100


colorscheme default
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
let g:indent_guides_guide_size = 1
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"colorcolumn at line 80
au BufRead,BufNewFile *.py,*pyw set cc=80
au BufRead,BufNewFile *.md set cc=80

"Auto wrap markdown
au BufRead,BufNewFile *.md setlocal textwidth=80

"Salt files as yaml
au BufRead,BufNewFile *.sls set ft=yaml

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
" Ale configurations
"
" Some Ale keybindings
map au :ALEToggle<CR>
map af : ALEFix<CR>
let g:ale_sign_warning = '--'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['black'],
\   'terraform': ['terraform'],
\}
let g:ale_python_autopep8_options = '--aggressive --aggressive'
let g:ale_linters = {
\   'markdown': ['prettier'],
\   'python': ['flake8', 'pylint'],
\}

"Fuzzy Finder
set runtimepath+=~/.fzf
autocmd vimenter * NERDTree
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p
" Find the current file in NERDTree
"nmap ,n :NERDTreeFind<CR>
" Toggle NERDTree
nmap ,m :NERDTreeToggle<CR>
" Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

"Vim-go
set autowrite
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1

" Ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"CtrlP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
