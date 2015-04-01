colorscheme default
"NeoBundle
if !1 | finish | endif

if has('vim_starting')
    if &compatible
        set nocompatible
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'nvie/vim-flake8'
NeoBundle 'nathanaelkane/vim-indent-guides'

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck
"/NeoBundle

syntax on
set encoding=utf8
set fileencoding=utf-8
set scrolloff=5
set noswapfile
set nowritebackup
set nobackup
set backspace=indent,eol,start
set vb t_vb=
set novisualbell
set clipboard+=unnamed
set clipboard=unnamed
set list
set number
set ruler
set nocompatible
set nostartofline
set matchpairs& matchpairs+=<:>
set showmatch
set matchtime=3
set textwidth=0
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲
set virtualedit=all
set cursorline
hi clear CursorLine
inoremap jj <Esc>

autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

filetype indent plugin on
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
filetype indent on

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

let g:jedi#popup_on_dot = 1
let g:jedi#popup_select_first = 0
let g:jedi#rename_command = '<Leader>R'
autocmd FileType python setlocal completeopt-=preview
