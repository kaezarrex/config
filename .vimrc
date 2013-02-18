set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on     " required!

set ls=2         " allways show status line
set ruler        " show the cursor position all the time

set hlsearch

" tabs are 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab

set timeoutlen=1000 ttimeoutlen=100

set colorcolumn=80

set path=.,,
set wildmode=longest,list,full
set wildmenu

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" syntax highlighting and smart indent
set autoindent
syntax on
syntax enable " Turns on filetype detection if not already on, and then applies filetype-specific highlighting.

if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
endi

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

set backspace=start,indent,eol

" shortcuts
map <Tab> <C-W><C-W>

hi Folded ctermbg=0

" Folding - use f to fold/unfold blocks
map f za
let g:python_fold_comments = 0
let g:python_fold_docstrings = 0

" Javascript folding
function! JavaScriptFold()
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen

set list
set listchars=tab:>\ ,trail:\ 

set number
set relativenumber

set undofile
set undodir=/tmp

"let g:solarized_termcolors=256
set background=dark
colorscheme solarized
set t_Co=16

let g:Powerline_symbols = 'fancy'

let g:jedi#popup_on_dot = 0
