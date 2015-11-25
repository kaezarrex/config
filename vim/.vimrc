set nocompatible               " be iMproved
filetype off                   " required!

" Vundle Setup {{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" }}}

" Plugins {{{
" My Plugins here:
Plugin 'airblade/vim-gitgutter'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'davidhalter/jedi-vim'
Plugin 'fatih/vim-go'
Plugin 'groenewege/vim-less'
Plugin 'junegunn/goyo.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kevinw/pyflakes-vim'
Plugin 'mikewest/vimroom'
Plugin 'mileszs/ack.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'rstacruz/sparkup'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'wakatime/vim-wakatime'
" }}}

" Vundle End {{{
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" }}}

" Plugin Settings {{{
let g:jedi#popup_on_dot = 0
let g:sparkupExecuteMapping = '<c-r>'
let g:airline_powerline_fonts = 1
" Don't show seperators
let g:airline_left_sep=''
let g:airline_right_sep=''
" }}}

" Tabs {{{
" tabs are 4 spaces
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
syntax on
syntax enable
" }}}

" File Browsing {{{
set path=.,,
set wildmode=longest,list,full
set wildmenu
" }}}

" Misc {{{
set ls=2         " always show status line
set ruler        " show the cursor position all the time

" highlight trailing whitespace and tabs
set listchars=tab:>\ ,trail:\ 
set list

set timeoutlen=1000 ttimeoutlen=100

set number
set spell
set hlsearch

set lazyredraw
set modelines=1


" display the current mode and partially-typed commands in the status line:
set showmode
set showcmd

set backspace=start,indent,eol
" }}}

" Color Column {{{
" show colored 80th column
if exists('+colorcolumn')
    set colorcolumn=80
endif
" }}}

" Undos {{{
" enable persistent undos
if has('persistent_undo')
    set undodir=/tmp
    set undofile
endif
" }}}

" Key Mappings {{{
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" turn off arrow keys
noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>
" ???
map <Tab> <C-W><C-W>
" }}}

" Folding {{{
set foldmethod=indent   " fold based on indent level
set foldnestmax=10      " max 10 depth
set foldenable          " don't fold files by default on open
nnoremap f za
set foldlevelstart=5    " start with fold level of 5

" Folding - use f to fold/unfold blocks
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
" }}}

" AutoGroups {{{
augroup configgroup
    autocmd!
    autocmd BufNewFile,BufReadPost *.css,*.scss,*.less setl shiftwidth=2 expandtab tabstop=2 softtabstop=2
    autocmd BufNewFile,BufReadPost *.html setl shiftwidth=2 expandtab tabstop=2 softtabstop=2
    autocmd BufNewFile,BufReadPost *.coffee,*.js,*.json,*.jsx setl shiftwidth=2 expandtab tabstop=2 softtabstop=2
    autocmd BufNewFile,BufReadPost *.md setl tw=79 wrap
    autocmd BufWritePre *.py,*.js,*.jsx,*.coffee,*.css,*.sass,*.less,*.md :call <SID>StripTrailingWhitespaces()
    autocmd BufNewFile,BufReadPost *.hs setl nospell
augroup END
" }}}

" Go {{{
let g:golang_cwindow = 0
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
" }}}

" Colors {{{
"let g:solarized_termcolors=256
"set t_Co=16
set background=dark
colorscheme solarized
" }}}

" Custom Functions {{{
" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! <SID>StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction
" }}}

" vim:foldmethod=marker:foldlevel=0
