set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My Bundles here:
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'fatih/vim-go'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kevinw/pyflakes-vim'
Plugin 'mikewest/vimroom'
Plugin 'mileszs/ack.vim'
Plugin 'rjohnsondev/vim-compiler-go'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

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

set number
set spell
set hlsearch

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

if exists('+colorcolumn')
    " show colored 80th column
    set colorcolumn=80
endif

if has('persistent_undo')
    " enable persistent undos
    set undodir=/tmp
    set undofile
endif

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

" go-compile
let g:golang_cwindow = 0

" shortcuts
map <Tab> <C-W><C-W>

if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
endi

hi Folded ctermbg=0

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

" Folding - use f to fold/unfold blocks
map f za
let g:python_fold_comments = 0
let g:python_fold_docstrings = 0

autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}
autocmd BufRead,BufNewFile *.html setlocal foldmethod=indent shiftwidth=2 tabstop=2


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

try
    "let g:solarized_termcolors=256
    set t_Co=16
    set background=dark
    colorscheme solarized
catch
    colorscheme desert
endtry

let g:airline_powerline_fonts = 1

let g:jedi#popup_on_dot = 0
