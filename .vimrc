scriptencoding utf-8
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
    let s:toml= '~/dotfiles/.dein.toml'
    let s:toml_lazy = '~/dotfiles/.dein_lazy.toml'
    call dein#load_toml(s:toml, {'lazy': 0})
    call dein#load_toml(s:toml_lazy, {'lazy': 1})

    call dein#end()

    call dein#save_state()
endif
if dein#check_install()
    call dein#install()
endif
"/dein

set background=dark
colorscheme hybrid

" snippet
imap <C-s> <Plug>(neosnippet_expand_or_jump)
smap <C-s> <Plug>(neosnippet_expand_or_jump)

filetype plugin indent on
syntax enable

" status bar
let g:lightline = {
    \ 'colorscheme': 'solarized_dark.vim',
    \ 'component': {
    \   'readonly': '%{&readonly?"⭤":""}',
    \ }
    \ }
set laststatus=2
" /status bar

" Use deoplete.
let g:deoplete#enable_at_startup = 1

:let erlang_force_use_vimerl_indent = 0
autocmd FileType erlang setl tabstop=8 expandtab shiftwidth=2 softtabstop=2

autocmd FileType go setl tabstop=4 shiftwidth=4 softtabstop=4

let g:vim_markdown_folding_disabled = 1

let vim_markdown_preview_browser='Safari'
let vim_markdown_preview_github=1
let vim_markdown_preview_hotkey='<C-m>'

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
set clipboard=unnamed
set list
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
set showcmd
hi clear CursorLine

" Prevent the delay of `O`.
set timeout timeoutlen=5000 ttimeoutlen=100

set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType python setlocal completeopt-=preview

au FileType yaml set tabstop=2
au FileType markdown set ts=2 sw=2 expandtab
au FileType javascript set ts=2 sw=2 expandtab
au FileType javascript.jsx set ts=2 sw=2 expandtab
au FileType json set ts=2 sw=2 expandtab
au FileType html set ts=2 sw=2 expandtab
au FileType rust set ts=4 sw=4 expandtab

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
    autocmd BufNewFile,BufRead *.md set filetype=markdown
    autocmd BufNewFile,BufRead *.spec set filetype=markdown
augroup END

command! MarkdownPreview PrevimOpen

nnoremap <ESC> <ESC>:nohlsearch<CR>

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

" auto comment off
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

":Rename newfile.name
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

":ResearchPunctuation
function ResearchPunctuation()
    silent! %s/、/，/g
    silent! %s/．/。/g
endfunction
command! -nargs=0 ResearchPunctuation call ResearchPunctuation()
