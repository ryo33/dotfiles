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
" General
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'kana/vim-submode'
" Languages
NeoBundleLazy 'mxw/vim-jsx', {'autoload': {'filetypes': ['javascript']}}
NeoBundleLazy 'pangloss/vim-javascript', {'autoload': {'filetypes': ['javascript']}}
NeoBundleLazy 'elixir-lang/vim-elixir', {'autoload': {'filetypes': ['elixir', 'eelixir']}}
NeoBundleLazy 'rust-lang/rust.vim', {'autoload': {'filetypes': ['rust']}}
NeoBundleLazy 'plasticboy/vim-markdown', {'autoload': {'filetypes': ['markdown']}}
NeoBundleLazy 'jimenezrick/vimerl', {'autoload': {'filetypes': ['erlang']}}
NeoBundleLazy 'fatih/vim-go', {'autoload': {'filetypes': ['go']}}
NeoBundleLazy 'cespare/vim-toml', {'autoload': {'filetypes': ['toml']}}
NeoBundleLazy 'vim-scripts/ebnf.vim', {'autoload': {'filetypes': ['ebnf']}}
NeoBundleLazy 'avakhov/vim-yaml', {'autoload': {'filetypes': ['yaml']}}
" Others
NeoBundleLazy 'thinca/vim-quickrun', {'autoload': {'command': ['QuickRun']}}
NeoBundleLazy 'kannokanno/previm',
            \{'autoload': {
            \'filetypes': ['markdown'],
            \'command': ['PrevimOpen']
            \}}
NeoBundleLazy 'tyru/open-browser.vim', {'autoload': {'command': ['PrevimOpen']}}
NeoBundle 'ryo33/powerful-type.vim'

call neobundle#end()

" Required:
filetype plugin indent on

NeoBundleCheck
"/NeoBundle

" status bar
let g:lightline = { 
    \ 'colorscheme': 'solarized_dark.vim',
    \ 'component': {
    \   'readonly': '%{&readonly?"⭤":""}',
    \ }
    \ }
set laststatus=2
" /status bar

:let erlang_force_use_vimerl_indent = 0
autocmd FileType erlang setl tabstop=8 expandtab shiftwidth=2 softtabstop=2

autocmd FileType go setl tabstop=4 shiftwidth=4 softtabstop=4

colorscheme hybrid

au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a "Google Chrome"'

let g:neocomplete#enable_at_startup = 1

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

" Prevent the delay of `O`.
set timeout timeoutlen=5000 ttimeoutlen=100

autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType python setlocal completeopt-=preview

autocmd FileType yaml set tabstop=2

set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

augroup filetypes
    autocmd!
    autocmd BufNewFile,BufRead *.md,*.mkd set filetype=markdown
    autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx
    autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
    autocmd BufNewFile,BufRead *.toml set filetype=toml
    autocmd BufNewFile,BufRead *.rs set filetype=rust
    autocmd BufNewFile,BufRead *.ex set filetype=elixir
    autocmd BufNewFile,BufRead *.exs set filetype=elixir
    autocmd BufNewFile,BufRead *.eex set filetype=eelixir
    autocmd BufNewFile,BufRead *.ebnf set filetype=ebnf
augroup END

command! MarkdownPreview PrevimOpen

nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap sw <C-w>w
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap s- :<C-u>sp<CR>
nnoremap s\| :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>

let g:submode_keep_leaving_key = 1
call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's.', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's,', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '.', '<C-w>+')
call submode#map('bufmove', 'n', '', ',', '<C-w>-')

call submode#enter_with('changetab', 'n', '', 'gt', 'gt')
call submode#enter_with('changetab', 'n', '', 'gT', 'gT')
call submode#map('changetab', 'n', '', 't', 'gt')
call submode#map('changetab', 'n', '', 'T', 'gT')

call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
call submode#map('undo/redo', 'n', '', '-', 'g-')
call submode#map('undo/redo', 'n', '', '+', 'g+')
