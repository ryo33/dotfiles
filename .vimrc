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
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'mkitt/tabline.vim'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundleLazy 'Shougo/unite.vim', {'autoload': {'command': ['Unite']}}
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

" Unite
let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,tabe :<C-u>tabe<CR>:<C-u>UniteWithBufferDir -buffer-name=files file<CR>

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

" neosnippet
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
