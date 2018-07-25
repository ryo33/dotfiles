"dein
if &compatible
    set nocompatible
endif
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
    let s:toml= expand('~/dotfiles/.dein.toml')
    let s:toml_lazy = expand('~/dotfiles/.dein_lazy.toml')
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:toml_lazy, {'lazy': 1})

    call dein#end()

    call dein#save_state()
endif
if dein#check_install()
    call dein#install()
endif
"/dein

" Color Scheme
set background=dark
colorscheme hybrid

" Modern Vim
set nocompatible
filetype plugin indent on
syntax enable

" UTF-8
scriptencoding utf-8
set encoding=utf8
set fileencoding=utf-8

" No dumps
set noswapfile
set nowritebackup
set nobackup

" No bells
set noerrorbells
set visualbell

" Surpress warnings when switch buffers having changes
set hidden

" Free moving
set scrolloff=0
set virtualedit=all

" Normal backspace
set backspace=indent,eol,start

" Enable * and +
set clipboard=unnamedplus,unnamed

" Appearance of not printable
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%,eol:↲

" Show cmd in status line
set showcmd

" Ultimate history
set history=10000

" Python
let g:python3_host_prog = '/home/ryo/.pyenv/versions/3.6.4/bin/python3'
let g:python_host_prog = '/home/ryo/.pyenv/versions/2.7/bin/python'

" Enable matchit
runtime macros/matchit.vim

" Create a shorthand %% for %:h (directory of %)
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'

" Use <C-p> and <C-n> as <Up> and <Down> in ex mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" Rich completion in ex mode
set wildmenu
set wildmode=full

" Treat '-' as a part of a word
set iskeyword+=-

" Highlight the number of cursor line
set cursorline
hi clear CursorLine

" Prevent the delay of `O`.
set timeout timeoutlen=5000 ttimeoutlen=100

" Show matching quotes or braces
set showmatch

" Default indent
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

set list
set ruler
set nostartofline
set matchpairs& matchpairs+=<:>
set matchtime=3
set textwidth=0

" Use Alt to control windows
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
noremap <A-H> <C-w><
noremap <A-J> <C-w>-
noremap <A-K> <C-w>+
noremap <A-L> <C-w>>

" Search next with zz (center the current line)
noremap <Leader>n nzz
noremap <Leader>N Nzz

" Clear nohlsearch & rerender
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" & with keeping substitution flags
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Submode to navigate tabs
call submode#enter_with('changetab', 'n', '', 'gt', 'gt')
call submode#enter_with('changetab', 'n', '', 'gT', 'gT')
call submode#map('changetab', 'n', '', 't', 'gt')
call submode#map('changetab', 'n', '', 'T', 'gT')

" Submode to navigate history call submode#enter_with('undo/redo', 'n', '', 'g-', 'g-')
call submode#enter_with('undo/redo', 'n', '', 'g+', 'g+')
call submode#map('undo/redo', 'n', '', '-', 'g-')
call submode#map('undo/redo', 'n', '', '+', 'g+')

":Rename newfile.name
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

" auto comment off
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

" Indent setting for each language
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType python setlocal completeopt-=preview

autocmd FileType yaml set tabstop=2
autocmd FileType markdown set ts=2 sw=2 expandtab
autocmd FileType javascript set ts=2 sw=2 expandtab
autocmd FileType javascript.jsx set ts=2 sw=2 expandtab
autocmd FileType json set ts=2 sw=2 expandtab
autocmd FileType html set ts=2 sw=2 expandtab
autocmd FileType rust set ts=4 sw=4 expandtab
autocmd FileType cpp set ts=4 sw=4 expandtab
autocmd FileType erlang setl tabstop=8 expandtab shiftwidth=2 softtabstop=2
autocmd FileType go setl tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType tex setl tabstop=2 shiftwidth=2 softtabstop=2

" Filetypes
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
    autocmd BufNewFile,BufRead *.spec set filetype=markdown
augroup END
