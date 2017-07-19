set nocompatible              " be iMproved, required
set autoindent
set tabstop=2
set expandtab
set shiftwidth=2
filetype plugin indent on

"set rtp+=~/.vim/powerline/powerline/bindings/vim
source ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim/plugin/powerline.vim
set laststatus=2
syntax on
set background=dark
let g:Powerline_symbols = 'unicode'
set laststatus=2
set encoding=utf-8
set t_Co=256

"Set backspace to normal functio
set backspace=indent,eol,start

"Use pathogen
execute pathogen#infect()

"Use 'nu' to set or unset number
set number
map nu :set invnumber<CR>

"Syntastic no like params
let g:puppet_puppetlint_args = "--no-class_inherits_from_params_class-check"

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors = 0 
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=233
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
let g:indent_guides_guide_size = 1 
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
