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
NeoBundle 'elixir-lang/vim-elixir'
NeoBundle 'othree/yajs.vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'jimenezrick/vimerl'
NeoBundle 'tpope/vim-pathogen'
NeoBundle 'fatih/vim-go'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundleLazy 'kana/vim-altr'
NeoBundle 'Shougo/unite-outline'

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck
"/NeoBundle
:let erlang_force_use_vimerl_indent = 0
autocmd FileType erlang setl tabstop=8 expandtab shiftwidth=2 softtabstop=2

autocmd FileType go setl tabstop=4 expandtab shiftwidth=4 softtabstop=4

colorscheme hybrid

au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a "Google Chrome"'

let g:neocomplete#enable_at_startup = 1

let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,tabe :<C-u>tabe<CR>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>

"vim-altr
nnoremap <Leader>h <Plug>(altr-forward)

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

autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType python setlocal completeopt-=preview

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

autocmd BufNewFile,BufRead *.es6 set filetype=javascript
