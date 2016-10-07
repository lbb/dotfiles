"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

" Required:
set runtimepath^=/home/realfake/.config/nvim/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('/home/realfake/.config/nvim/'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Miscellaneous:
call dein#add('suan/vim-instant-markdown', {'on_ft': 'markdown'})
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('majutsushi/tagbar')
call dein#add('Yggdroot/indentLine')
call dein#add('blindFS/vim-taskwarrior')
call dein#add('mattn/webapi-vim')
call dein#add('Raimondi/delimitMate')
call dein#add('troydm/asyncfinder.vim')
call dein#add('vim-airline/vim-airline')
call dein#add('tpope/vim-surround')
call dein#add('rhysd/github-complete.vim')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('tomasr/molokai')
call dein#add('vimwiki/vimwiki')
call dein#add('sjl/gundo.vim')
" call dein#add('metakirby5/codi.vim')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('neomake/neomake')

" Unite:
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/unite-outline')
call dein#add('ujihisa/unite-colorscheme')
call dein#add('junkblocker/unite-codesearch')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

" Themes:
call dein#add('mhartington/oceanic-next')
call dein#add('ap/vim-css-color') 
call dein#add('vim-airline/vim-airline-themes')
call dein#add('mhartington/oceanic-next')


" Autocomplete:
call dein#add('Shougo/deoplete.nvim')
call dein#add('zchee/deoplete-go', {'build': 'make'})
    
" Golang:
call dein#add('fatih/vim-go')

" Git:
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('tpope/vim-fugitive')

" NerdTree:
call dein#add('scrooloose/nerdtree')
call dein#add('ryanoasis/vim-devicons')

" Specify revision/branch/tag:
call dein#add('Shougo/vimshell')

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
  let pluginsExist=1
endif

"End dein Scripts-------------------------

"Custom sidebar:
set nu

" Deocomplete-(go):
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" Go-vim: 
"	let g:go_highlight_functions = 1
"	let g:go_highlight_methods = 1
"	let g:go_highlight_structs = 1
"	let g:go_highlight_interfaces = 1
"	let g:go_highlight_operators = 1
"	let g:go_highlight_build_constraints = 1
"	let g:go_term_enabled = 1
	let g:go_auto_type_info = 1
	let g:go_fmt_command = "goimports" " Is buggy

set foldmethod=syntax
set foldlevel=5
let g:deoplete#sources#go = 'vim-go'

" indentLine:
	let g:indentLine_char = '┆'
	let g:indentLine_color_term = 239
	set list lcs=tab:\┆\ 

" Vim general:
	nnoremap Q <nop>
	map q <Nop>
	let mapleader = ','
	"nnoremap <C-J> <C-W><C-J>
	"nnoremap <C-K> <C-W><C-K>
	"nnoremap <C-L> <C-W><C-L>
	"nnoremap <C-H> <C-W><C-H>
	
" Vim color:
	"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
	"let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
	"syntax enable
	"colorscheme OceanicNext
	"set background=dark
	"set cursorline "slows down bif files due to buffer rewrite
	"highlight MatchParen cterm=bold ctermbg=none ctermfg=red
	"autocmd Filetype .* if getfsize(@%) > 999 | setlocal nocursorline
	"			\setlocal lazyredraw | endif

if (has("termguicolors"))
 set termguicolors
endif

" Theme
	syntax enable
	colorscheme OceanicNext
	set background=dark
	let g:oceanic_next_terminal_italic = 1
	let g:oceanic_next_terminal_bold = 1
" GitGutter:
	let g:gitgutter_sign_column_always = 1
	let g:gitgutter_max_signs = 500
	let g:gitgutter_map_keys = 0
	let g:gitgutter_override_sign_column_highlight = 0
	let g:gitgutter_enabled = 1
	let g:gitgutter_signs = 1
	let g:gitgutter_async = 1
	let g:gitgutter_highlight_lines = 0
	set updatetime=250

" Airline:
	let g:airline#extensions#tabline#enabled = 1
	let g:airline_theme='oceanicnext' "let g:airline_theme = 'behelit'
	let g:airline_powerline_fonts = 1

" Devicons:
	let g:webdevicons_enable_airline_tabline = 1
	let g:webdevicons_enable_airline_statusline = 1

" Enable snipMate compatibility feature:
	let g:neosnippet#enable_snipmate_compatibility = 1
	imap <C-k>     <Plug>(neosnippet_expand_or_jump)
	smap <C-k>     <Plug>(neosnippet_expand_or_jump)
	xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior:
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)"
" \: "\<TAB>"

" NERDTree:
	nmap <F3> :NERDTreeToggle<CR>
	autocmd StdinReadPre * let s:std_in=1
	let NERDTreeShowHidden=1
	let g:NERDTreeWinSize=45
	let g:NERDTreeAutoDeleteBuffer=1

	" NERDTress File highlighting
	function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
	exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
	exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
	endfunction

	call NERDTreeHighlightFile('jade', 'green', 'none', 'green', 'none')
	call NERDTreeHighlightFile('md', 'blue', 'none', '#6699CC', 'none')
	call NERDTreeHighlightFile('config', 'yellow', 'none', '#d8a235', 'none')
	call NERDTreeHighlightFile('conf', 'yellow', 'none', '#d8a235', 'none')
	call NERDTreeHighlightFile('json', 'green', 'none', '#d8a235', 'none')
	call NERDTreeHighlightFile('html', 'yellow', 'none', '#d8a235', 'none')
	call NERDTreeHighlightFile('css', 'cyan', 'none', '#5486C0', 'none')
	call NERDTreeHighlightFile('scss', 'cyan', 'none', '#5486C0', 'none')
	call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 'none')
	call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'none')
	call NERDTreeHighlightFile('ts', 'Blue', 'none', '#6699cc', 'none')
	call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'none')
	call NERDTreeHighlightFile('gitconfig', 'black', 'none', '#686868', 'none')
	call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#7F7F7F', 'none')

" Tagbar:
	nmap <F4> :TagbarToggle<CR>

" Unite:
	let g:unite_data_directory='~/.nvim/.cache/unite'
	let g:unite_source_history_yank_enable=1
	let g:unite_prompt='» '

" Miscellaneous:
let g:airline#extensions#tmuxline#enabled = 0
imap <silent><expr> <TAB>
 \ pumvisible() ? "\<C-n>" :
 \ <SID>check_back_space() ? "\<TAB>" :
 \ deoplete#mappings#manual_complete()

function! s:check_back_space()
 let col = col('.') - 1
 return !col || getline('.')[col - 1] =~ '\s'
endfunction

autocmd BufReadPost *
 \ if line("'\"") > 0 && line ("'\"") <= line("$ghlight MatchParen cterm=bold ctermfg=cyan") |
 \   exe "normal! g'\"" |
 \ endif


autocmd BufRead * normal zz
autocmd! BufWritePost * Neomake
autocmd bufenter * if (winnr("$") == 1 && exists("b:NREDTree") && b:NERDTree.isTree()) | q | endif

