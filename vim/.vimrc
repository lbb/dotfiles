set nocompatible              " dont't be compatible with vi

let g:pathogen_disabled = ["ropevim", "minibufexpl", "command-t"]

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set dir=~/.vimswap//,/tmp//,.
let g:snippets_dir = "~/.vim/snippets"
let mapleader=","
set listchars=tab:▸\ ,eol:¬
set hidden

set backupcopy=no

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>:exe ":echo 'vimrc reloaded'"<CR>

" mappings
map <leader>td <Plug>TaskList
map <leader>g :GundoToggle<CR>
map <leader>t :CommandT<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>j :RopeGotoDefinition<CR>
" map <leader>r :RopeRename<CR>
nmap <leader>a <Esc>:Ack!
map <leader>l :TagbarToggle<CR>
map <leader>i :set list!<CR> " toggle invisible chars like tab or CR

map <leader>ö :PyLint<CR>
map <leader>ä :Pydoc<CR>

" pydoc settings
let g:pydoc_wh = 160
" let g:pydoc_open_cmd = 'vsplit' 

" use ,8 in quickfix window to jump to pep8 violation
let g:pep8_map='<leader>8'
let g:pyflakes_use_quickfix = 0
let g:CommandTMaxHeight = 10

" pymode disable lint on save
let g:pymode_lint_write = 0

let g:flake8_max_line_length=120

" ctrlp stuff
map <leader>t :CtrlP<CR>
map <leader>b :CtrlPBuffer<CR>
let g:ctrlp_custom_ignore = 'static/images/'

" window
nmap <leader>sw<left>  :topleft  vnew<CR>
nmap <leader>sw<right> :botright vnew<CR>
nmap <leader>sw<up>    :topleft  new<CR>
nmap <leader>sw<down>  :botright new<CR>

" buffer
nmap <leader>s<left>   :leftabove  vnew<CR>
nmap <leader>s<right>  :rightbelow vnew<CR>
nmap <leader>s<up>     :leftabove  new<CR>
nmap <leader>s<down>   :rightbelow new<CR>

" open/close the quickfix window
nmap <leader>q :copen<CR>
nmap <leader>qq :cclose<CR>

" remove trailing whitespace
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

let g:pymode_breakpoint_key = '<leader>ü'

cmap w!! w !sudo tee % >/dev/null   "if forgot sudo save with :w!!

set number                    " Display line numbers
set numberwidth=1             " using only 1 column (and 1 space) while possible
set wildmenu                  " Menu completion in command mode on <Tab>
set wildmode=full             " <Tab> cycles between all matching choices.

" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**
set wildignore+=*/env/**

set grepprg=ack         " replace the default grep program with ack

set splitright

set guioptions-=L   "disable scrollbar left from nerdtree
set guioptions-=r   "disable right scrollbar

set colorcolumn=79
syntax on
filetype on
filetype plugin on
filetype plugin indent on

colorscheme gruvbox
set bg=dark

:hi ColorColumn guibg=#2d2d2d ctermbg=246

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

nnoremap <silent> <c-Right> <c-W>L
nnoremap <silent> <c-Left> <c-W>H
nnoremap <silent> <c-Up> <c-W>K
nnoremap <silent> <c-Down> <c-W>K

"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplorerMoreThanOne=1

""" Moving Around/Editing
set cursorline              " have a line indicate the cursor location
set ruler                   " show the cursor position all the time
set nostartofline           " Avoid moving cursor to BOL when jumping around
set virtualedit=block       " Let cursor move past the last char in <C-v> mode
set scrolloff=999           " pin cursor in the vertical center of screen
"set scrolloff=3             " Keep 3 context lines above and below the cursor
set backspace=2             " Allow backspacing over autoindent, EOL, and BOL
set showmatch               " Briefly jump to a paren once it's balanced
set nowrap                  " don't wrap text
set linebreak               " don't wrap textin the middle of a word
set autoindent              " always set autoindenting on
set smartindent             " use smart indent if there is no indent file
set tabstop=4               " <tab> inserts 4 spaces 
set shiftwidth=4            " but an indent level is 2 spaces wide.
set softtabstop=4           " <BS> over an autoindent deletes both spaces.
set expandtab               " Use spaces, not tabs, for autoindent/tab key.
set shiftround              " rounds indent to a multiple of shiftwidth
set matchpairs+=<:>         " show matching <> (html mainly) as well
set foldmethod=indent       " allow us to fold on indents
set foldlevel=99            " don't fold by default

" close preview window automatically when we move around
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"""" Reading/Writing
set noautowrite             " Never write a file unless I request it.
set noautowriteall          " NEVER.
set noautoread              " Don't automatically re-read changed files.
set modeline                " Allow vim options to be embedded in files;
set modelines=5             " they must be within the first or last 5 lines.
set ffs=unix,dos,mac        " Try recognizing dos, unix, and mac line endings.


" status line ?!
set laststatus=2 " Always display the statusline in all windows
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" powerline fast escape
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

"set statusline =%#identifier#
"set statusline+=[%t]    "tail of the filename
"set statusline+=%*

"display a warning if fileformat isnt unix
"set statusline+=%#warningmsg#
"set statusline+=%{&ff!='unix'?'['.&ff.']':''}
"set statusline+=%*

"display a warning if file encoding isnt utf-8
"set statusline+=%#warningmsg#
"set statusline+=%{(&fenc!='utf-8'&&&fenc!='')?'['.&fenc.']':''}
"set statusline+=%*

"set statusline+=%h      "help file flag
"set statusline+=%y      "filetype

"read only flag
"set statusline+=%#identifier#
"set statusline+=%r
"set statusline+=%*

"modified flag
"set statusline+=%#identifier#
"set statusline+=%m
"set statusline+=%*

"set statusline+=%{fugitive#statusline()}

"set statusline+=%=                           " right align
"set statusline+=%10((%l,%c)%)\            " line and column
"set statusline+=%P  " percentage of file


" Python
"au BufRead *.py compiler nose
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType coffee setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType html setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 smartindent
au FileType js setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2 smartindent
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
" Don't let pyflakes use the quickfix window
let g:pyflakes_use_quickfix = 0


" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

if has("gui_running")
    :set guioptions-=m "remove menu bar
    :set guioptions-=T "remove toolbar
    :set guioptions-=r "remove right hand scroll bar 
    ":set guifont=Monospace\ 10
    ":set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 10
    :set guifont=Droid\ Sans\ Mono\ for\ Powerline\ 9
    ":set guifont=Inconsolata\ for\ Powerline 10
    "set guiheadroom=0
    :set nomousehide    
endif

