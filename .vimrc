call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set ls=2         " allways show status line
set ruler        " show the cursor position all the time

set hlsearch

" tabs are 4 spaces
set shiftwidth=4
set ts=4
set expandtab

set timeoutlen=100

" syntax highlighting and smart indent
syntax on
"set autoindent      " always set autoindenting on
"set smartindent     " smart indent
"set cindent         " cindent
filetype plugin indent on " Turns on filetype detection, filetype plugins, and filetype indenting all of which add nice extra features to whatever language you're using
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

map f za

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

"folding settings
"set foldmethod=indent   "fold based on indent
"set foldnestmax=2      "deepest fold is 2 levels
"set nofoldenable        "dont fold by default
"set foldlevel=1         "this is just what i use

"VimRoom
let g:vimroom_sidebar_height=0

colorscheme igor

set background=dark
colorscheme solarized

":set colorcolumn=80
":highlight ColorColumn ctermbg=grey guibg=grey

let g:Powerline_symbols = 'fancy'

noremap <Up> <nop>
noremap <Down> <nop>
noremap <Left> <nop>
noremap <Right> <nop>

