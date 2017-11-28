set nocompatible              " be iMproved, required
set autoindent
set tabstop=2
set expandtab
set shiftwidth=2
filetype plugin indent on

"Set backspace to normal functio
set backspace=indent,eol,start

"Use pathogen
execute pathogen#infect()

"Use 'nu' to set or unset number
set number
map nu :set invnumber<CR>

"Use 'gu' to set or unset git-gutter
map gu :GitGutterToggle<CR>

"
"Syntastic no like params
let g:puppet_puppetlint_args = "--no-class_inherits_from_params_class-check"

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

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='molokai'

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:ale_sign_warning = '--'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_linters = {
\   'python': ['flake8'],
\}
