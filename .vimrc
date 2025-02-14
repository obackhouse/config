" Set the nocompatible options just in case
set nocompatible 

" Load in vundle for some plugins
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'           " Plugin manager
Plugin 'lervag/vimtex'                  " LaTeX editor
Plugin 'JuliaEditorSupport/julia-vim'   " Julia editor
Plugin 'ervandew/supertab'              " Tab improvements
Plugin 'funorpain/vim-cpplint'          " C++ linter
Plugin 'cespare/vim-toml'               " TOML editor
Plugin 'dpelle/vim-LanguageTool'        " Grammar checker
Plugin 'embear/vim-localvimrc'          " Look for .lvimrc first
Plugin 'vim-python/python-syntax'       " Python syntax
Plugin 'NLKNguyen/c-syntax.vim'         " C syntax
Plugin 'NLKNguyen/papercolor-theme'     " PaperColor theme
Plugin 'nvie/vim-flake8'                " Flake8 formatter
Plugin 'ambv/black'                     " Black formatter
Plugin 'vim-airline/vim-airline'        " Airline
if has('nvim')
    Plugin 'tpope/vim-fugitive'         " Git
    Plugin 'kiyoon/jupynium.nvim'       " Jupyter notebook
    Plugin 'nvim-lua/plenary.nvim'      " Plenary
    Plugin 'wookayin/semshi', { 'do': ':UpdateRemotePlugins', 'tag': '*' }  " Python highlighting
endif
if exists('copilot')
    Plugin 'zbirenbaum/copilot.lua'     " Copilot
    Plugin 'CopilotC-Nvim/CopilotChat.nvim', { 'branch': 'main' }  " Copilot chat
endif
call vundle#end()

" Set the colorscheme
set t_Co=256
set background=dark
colorscheme PaperColor
"hi Normal ctermbg=black
let g:PaperColor_Theme_Options = {
  \   'language': {
  \     'python': {
  \       'highlight_all': 1,
  \       'highlight_builtins': 1
  \     },
  \     'cpp': {
  \       'highlight_standard_library': 1
  \     },
  \     'c': {
  \       'highlight_builtins': 1
  \     }
  \   }
  \ }

" Turn on syntax highlighting
filetype off
filetype plugin indent on
syntax on
let g:python_highlight_all = 1
hi pythonBuiltinFunc ctermfg=37 cterm=bold
let g:semshi#error_sign = v:false

" Turn on highlight searching, and remove highlights using ctrl+c
set hlsearch
hi Search ctermbg=red
nnoremap <C-c> :noh<CR>
nnoremap <C-Tab> <Tab>

" Help with tmux getting the correct colours
"if exists("+termguicolors")
"    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"    set termguicolors
"endif

" Fix some fortran stuff
let fortran_have_tabs=1
let g:go_version_warning=0

" Turn on line numbers
set number

" Prevent wrapping of lines
set nowrap

" Change split directions
set splitbelow
set splitright

" Turn wrapping back on for .md and .tex files
au BufRead,BufNewFile *.md set wrap
au BufRead,BufNewFile *.tex set wrap

" The only correct tab options
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent
set cindent

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

" Turn spellcheck on for .tex and .md files (set to British English)
au BufRead,BufNewFile *.tex set spell spelllang=en_gb
au BufRead,BufNewFile *.md set spell spelllang=en_gb
au BufRead,BufNewFile *.tex set wrap
au BufRead,BufNewFile *.md set wrap

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

" Make sure backspace has desired behaviour
set backspace=indent,eol,start

" Enable unicode keymapping for all filetypes
"let g:latex_to_unicode_keymap = 1
let g:latex_to_unicode_file_types = ".*"

" Make w and q commands case-insensitive
:command WQA wqa
:command WQa wqa
:command Wqa wqa
:command WQ wq
:command Wq wq
:command WA wa
:command Wa wa
:command W w
:command Q q

" Set autocorrect for my common types:
iab anf and
iab improt import

" No continuation of comments in C/C++ files
autocmd FileType c,h,cpp,hpp setlocal formatoptions-=cro

" No continuation of comments in Python files
autocmd FileType py setlocal formatoptions-=cro

" Copilot options (copilot.vim)
"imap <silent><script><expr> <C-j> copilot#Accept("")
"imap <C-h> <Plug>(copilot-previous)
"imap <C-k> <Plug>(copilot-next)
"imap <C-l> <Plug>(copilot-accept-word)
"let g:copilot_no_tab_map = v:true
"let g:copilot_node_command = "/home/ollie/Downloads/node-v18.12.0-linux-x64/bin/node"
"let g:copilot_python_styleguide = "
"    \ Always adhere to the `black` style guide.
"    \ Always use double quotes for strings, unless inside an f-string.
"    \ Be careful to use the correct number of closing brackets, and to place the closing bracket on the same line as the statement that opened it.
"    \ I always use `from __future__ import annotations` for type hinting, and I keep type hints inside `TYPE_CHECKING` blocks when possible.
"    \ I tend to use Google-style docstrings, but if the file is already using a different style, I will stick to that.
"    \"

" Copilot chat options
if exists('copilot')
    lua require("CopilotChat").setup({})
endif
:command Chat CopilotChat

" Copilot chat options
if exists('copilot')
    lua << EOF
    require("copilot").setup({
        suggestion = {
            enabled = true,
            auto_trigger = true,
            hide_during_completion = true,
            debounce = 80,
            keymap = {
                accept = "<C-j>",
                previous = "<C-h>",
                next = "<C-k>",
                accept_word = "<C-l>",
            },
        },
        copilot_node_command = "/home/ollie/Downloads/node-v18.12.0-linux-x64/bin/node",
    })
EOF
endif
