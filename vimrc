if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
	set fileencodings=ucs-bom,utf-8,latin1
endif

" Must be first,changes behaviour of other settings 
set nocompatible

" allow backspacing over everyting in insert mode
set bs=indent,eol,start 

"set cscope
if has("cscope") && filereadable("/usr/bin/cscope")
	set csprg=/usr/bin/cscope
	set csto=0
	set cst
	set nocsverb
	" add any database in current directory
	if filereadable("cscope.out")
		cs add $PWD/cscope.out
		" else add database pointed to by environment
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
	set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
 " Also switch on highlighting the last used search pattern.

if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif
    
" 256 colors
set t_Co=256

" sane text files
"set fileformat=unix
"set encoding=utf-8

" sane tabs
set tabstop=4

filetype on
if has("autocmd")
filetype plugin indent on
		augroup vimrcEX
				au!
				autocmd FileType text setlocal textwidth=78
				autocmd BufReadpost *
										\if line("'\'")> 1 && line("'\'") <= line("$")
										\exe "normal! g`\"" |
										\endif
				augroup end
			 	autocmd FileType c,cpp set shiftwidth=8 | set tabstop=8
			 	autocmd FileType html,xml,javascript set shiftwidth=2 | set tabstop=2
			 	autocmd FileType css,md set shiftwidth=4 |
		endif"has("autocmd")
"covert all typed tabs to spaces
set expandtab

"syntax highlighting
syntax on

"set color scheme
color molokai

let g:rehash256 = 1
let g:molokai_original = 1

" disable <Leader> timeout
set notimeout
set ttimeout

" allow backgrounding buffers without them
" and remeber marks/undo for backgrounded buffers
set hidden

"apply operations to all of selection including last char
set selection=inclusive

" for regular expressions turn magic on
set magic

" no line wrapping
set nowrap

" set numbers
set number

" make searches cas-sensitive only if they contain upper-case characters
set ignorecase
set smartcase

" show search matches as the search patter is typed
set incsearch

" set the indent
set smartindent

" display cursor co-ords at all times
set ruler
set cursorline

" keep more context when scrolling off the end of a buffer
set scrolloff=3

" search-next wraps back to start of file
set wrapscan
" Misc
set wildmenu
set spell
"------------------------------------------

"use the vundle

set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()
Plugin 'gmarik/vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mattn/emmet-vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'SirVer/ultisnips'
Plugin 'marijnh/tern_for_vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim.git'
Plugin 'mhinz/vim-startify'

call vundle#end()

"set Tlist

"let Tlist_Auto_Open = 1
let Tlist_Ctags_cmd = '/usr/bin/ctags'
let Tlist_Show_One_File = 1
let Tlist_WinWidth = 20
let Tlist_WinHight = 40
let Tlist_Exit_OnlyWindow = 1

" set alirline

set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '1'
let g:airline#extensions#tabline#buffer_nr_show = 1

" Map key buffer

nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

"set YoucompeteMe

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'  
let g:syntastic_always_populate_loc_list = 1
let g:ycm_confirm_extra_conf = 0

"set tagbar

nmap tb :Tagbar<cr>
let g:tagbar_ctags_bin='/usr/bin/ctags'
let g:tagbar_width=25

"map key to ultisnips

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"set markdown

let g:vim_markdown_frontmatter=1

"set Nerdtree

let g:NERDTree_title="[Nerdtree]"

function! NERDTree_Start()
		exec 'NERDTree'
endfunction

function! NERDTree_IsValid()
		return 1
endfunction

let g:winManagerWidth=25
let g:winManagerWindowLayout='BufExplorer,NERDTree|TagList'
let g:persistentBehaviour=3

nmap wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>

" set the CtrlPFunky
nnoremap <Leader>fu :CtrlPFunky<Cr>
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
let g:ctrlp_extensions = ['funky']
