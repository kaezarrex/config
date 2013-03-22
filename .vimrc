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
Bundle 'kevinw/pyflakes-vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdtree'

filetype plugin indent on     " required!

set ls=2         " always show status line
set ruler        " show the cursor position all the time

" tabs are 4 spaces
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" highlight trailing whitespace and tabs
set list
set listchars=tab:>\ ,trail:\ 

set timeoutlen=1000 ttimeoutlen=100

set colorcolumn=80

set number
set spell
set hlsearch

set undofile
set undodir=/tmp

set path=.,,
set wildmode=longest,list,full
set wildmenu

set autoindent
syntax on
syntax enable

" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

set backspace=start,indent,eol

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" shortcuts
map <Tab> <C-W><C-W>

if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
endi

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

"let g:solarized_termcolors=256
set background=dark
colorscheme solarized
"set t_Co=16

let g:Powerline_symbols = 'fancy'

let g:jedi#popup_on_dot = 0
