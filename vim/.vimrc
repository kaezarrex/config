set nocompatible               " be iMproved
filetype off                   " required!

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" My Plugins here:
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'fatih/vim-go'
Plugin 'groenewege/vim-less'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kevinw/pyflakes-vim'
Plugin 'mikewest/vimroom'
Plugin 'mileszs/ack.vim'
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

" shortcuts
map <Tab> <C-W><C-W>

if has("autocmd")
    " Restore cursor position
    au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
    autocmd BufNewFile,BufReadPost *.css setl shiftwidth=2 expandtab tabstop=2 softtabstop=2
    autocmd BufNewFile,BufReadPost *.scss setl shiftwidth=2 expandtab tabstop=2 softtabstop=2
    autocmd BufNewFile,BufReadPost *.scss setl foldmethod=indent nofoldenable
    autocmd BufNewFile,BufReadPost *.html setl shiftwidth=2 expandtab tabstop=2 softtabstop=2
    autocmd BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab tabstop=2 softtabstop=2
    autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
    autocmd BufNewFile,BufReadPost *.md setl tw=79 wrap
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

" Go stuff
let g:go_fmt_command = "goimports"

"let g:solarized_termcolors=256
"set t_Co=16
set background=dark
colorscheme solarized

let g:airline_powerline_fonts = 1

let g:jedi#popup_on_dot = 0
