" A bunch of vim config options I have collected

" Set the nocompatible options just in case
set nocompatible 

" Load in vundle for some plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'lervag/vimtex'
call vundle#end()

" Set the colorscheme to desert, seems the nicest
colorscheme desert

" Turn on syntax highlighting
filetype off
filetype plugin indent on
syntax on

" Turn on highlight searching, and remove highlights using ctrl+c
set hlsearch
hi Search ctermbg=red
nnoremap <C-c> :noh<CR>
nnoremap <C-Tab> <Tab>

" Fix some fortran stuff
let fortran_have_tabs=1
let g:go_version_warning=0

" Turn on line numbers
set number

" Prevent wrapping of lines
set nowrap

" The only correct tab options
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" Always have 10 lines below the cursor
set scrolloff=10

" Increase the timeout (this seems to help crashing when idle in an ssh)
set ttimeoutlen=100

" Set the mouse to be enabled (use shift for copy/pasting outside of vim)
set mouse=a

" Show current commands in bottom bar
set showcmd

" Make line status look better
set laststatus=2
set statusline=%F%m%r%h%w\ (%{&ff}){%Y}\ [%l,%v][%p%%]

" Stop all the whining
set noerrorbells
set visualbell t_vb=

" Turn spellcheck on for .tex files (set to British English)
au BufRead,BufNewFile *.tex set spell spelllang=en_gb
au BufRead,BufNewFile *.tex set wrap

" Fix the syntax highlighting for .jl (julia) files
au BufRead,BufNewFile *.jl :set filetype=julia

" Restore cursor position (this seems to work by default on some platforms and
" not others)
augroup JumpCursorOnEdit
   au!
   autocmd BufReadPost *
            \ if expand("<afile>:p:h") !=? $TEMP |
            \   if line("'\"") > 1 && line("'\"") <= line("$") |
            \     let JumpCursorOnEdit_foo = line("'\"") |
            \     let b:doopenfold = 1 |
            \     if (foldlevel(JumpCursorOnEdit_foo) > foldlevel(JumpCursorOnEdit_foo - 1)) |
            \        let JumpCursorOnEdit_foo = JumpCursorOnEdit_foo - 1 |
            \        let b:doopenfold = 2 |
            \     endif |
            \     exe JumpCursorOnEdit_foo |
            \   endif |
            \ endif
   " Need to postpone using "zv" until after reading the modelines.
   autocmd BufWinEnter *
            \ if exists("b:doopenfold") |
            \   exe "normal zv" |
            \   if(b:doopenfold > 1) |
            \       exe  "+".1 |
            \   endif |
            \   unlet b:doopenfold |
            \ endif
augroup END

" Remember some info between vim sessions
set viminfo='10,\"1000,:20,%,n~/.viminfo

" Turn on command menu
set wildmenu
set wildmode=list:longest

" Make w and q commands case-insensitive
:command WQ wq
:command Wq wq
:command W w
:command Q q

" Set autocorrect for my common types:
iab anf and

