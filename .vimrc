set nocompatible              " be iMproved, required
filetype off                  " required

"=====================================================
"" Vundle settings
"=====================================================
"" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'       " let Vundle mapanage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'     " Project and file navigation
Plugingin 'majutsushi/tagbar'    " Class/module browser
"
""------------browser------=== Other ===----------------------
Plugin 'bling/vim-airline'          " Lean & mean status/tabline for vim
Plugin 'fisadev/FixedTaskList.vim'  " Pluginginending tasks list
Plugin 'rosenfeld/conque-term'      " Consoles as bundleffers
Plugin 'tpope/vim-surround'         " Parentheses, brackets, quotes,             XML tags, and more

"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'           " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'  " dependencies #1
Plugin 'tomtom/tlib_vim'               " dependencies #2
Plugin 'honza/vim-snippets'            " snippets repo

""--vim-------------=== Languages support ===-------------
" --- Python ---
Plugin 'klen/python-mode'               " Python mode (docs, refactor, lints, highlightting, run and ipdb and more)
Plugin 'davidhalter/jedi-vim'           " Jedi-vim autocomplete plugin
Plugin 'mitsuhiko/vim-jinja'            " Jinja support for              vim
Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim

call vundle#end()            " required

" syntax on                 " syntax highlighing
filetype on
filetype plugin on
filetype plugin indent on " turn on the indent plugins

" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
" au FileType * setlocal colorcolumn=80

" au BufNewFile,BufRead *.html,*.mako,*.mak,*.jinja2 set ft=htmldjango
" au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

let javascript_enable_domhtmlcss=1
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS

" au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType html,htmldjango set omnifunc=htmlcomplete#CompleteTags
au FileType javascript,coffee,sass,html,css set ts=2 sw=2 sta et sts=2 ai
au FileType xhtml,xml set ts=2 sw=2 sta et sts=2 ai

au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType css setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4

au FileType python set tw=72 ts=4 sw=4 sta et sts=4 ai
au FileType python map <buffer> <leader>8 :PymodeLint<CR>
au FileType python setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" au BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
" au BufWritePre *.py normal m`:%s/\s\+$//e
" Wrapping and tabs.
" au BufNewFile,BufRead *.py set tw=72 ts=4 sts=4 sw=4 et
" Wrap at 72 chars for comments.
set formatoptions=cq textwidth=72 foldignore= wildignore+=*.py[co]
set backspace=indent,eol,start

" Smart indenting

" Completeopts
set completeopt=menuone,longest,preview
set pumheight=10            " Keep a small completion window
" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

" Highlight end of line whitespace.
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/
" match Error /\%>79v.\+/


" set colorcolumn=80
set term=gnome-256color
set smarttab
set autoindent
set guifont=Monaco:h12
set foldmethod=indent
set foldlevel=99
set number          " show line numbers
set tags=tags;$HOME/.vim/tags/ "recursively searches directory for 'tags' file
set title                     " show title in console title bar
set expandtab       " tabs are converted to spac
set showcmd         " display incomplete commands
set hlsearch        " highlight searches
set incsearch       " do incremental searching
set smartcase               " unless uppercase letters are used in the regex.
set ruler           " show the cursor position all the time
set numberwidth=4   " line numbering takes up 5 spaces
set ignorecase      " ignore case when searching
set nowrap          " stop lines from wrapping
set list            " make trailing whitespace visible
set listchars=tab:>-,trail:-,precedes:<,extends:>
set ls=2                    " allways show status line
set report=0                " : commands always print changed line count.
set ruler                   " Show some info, even without statuslines.
set shortmess+=a            " Use [+]/[RO]/[w] for modified/readonly/written.
" set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

" No visualbell and sound
set visualbell t_vb=
set novisualbell

colorscheme railscasts

" This beauty remembers where you were the last time you edited the file,
" and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

let mapleader=","  " change the leader to be a comma vs slash
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.pyo$']
let g:syntastic_check_on_open=1
let g:syntastic_mode_map = {'mode': 'active',
 \ 'active_filetypes': ['python', 'javascript', 'coffee', 'lua', 'erlang'],
 \ 'passive_filetypes': ['puppet', 'css', 'sass', 'haml', 'scss', 'json'] }

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1

let g:pymode_virtualenv = 1
let g:pymode_doc = 0
let g:pymode_doc_key = 'K'
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
let g:pymode_lint_write = 1
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" Open NerdTree
map <leader>n :NERDTreeToggle<CR>

" Toggle the tasklist
map <leader>td <Plug>TaskList

" Load the Gundo window
map <leader>g :GundoToggle<CR>

" Jump to the definition of whatever the cursor is on
map <leader>j :RopeGotoDefinition<CR>

" Rename whatever the cursor is on (including references to it)
map <leader>r :RopeRename<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Quit window on <leader>q
nnoremap <leader>q :bd<CR>
"
" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

nnoremap <leader>Tj :set ft=htmljinja<CR>
nnoremap <leader>Td :set ft=django<CR>

" Select the item in the list with enter
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
