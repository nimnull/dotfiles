filetype off

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
call pathogen#infect()

syntax on                 " syntax highlighing
filetype on
filetype plugin on
filetype plugin indent on " turn on the indent plugins

" Disable the colorcolumn when switching modes.  Make sure this is the
" first autocmd for the filetype here
" au FileType * setlocal colorcolumn=80

au BufNewFile,BufRead *.html,*.mako,*.mak,*.jinja2 set ft=htmldjango
au BufRead *.py set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
au BufWritePost *.coffee silent CoffeeMake! -b | cwindow | redraw!

au FileType python set omnifunc=pysmell#Complete
au FileType javascript set omnifunc=javascriptcomplete#CompleteJS
au FileType css set omnifunc=csscomplete#CompleteCSS
au FileType html,htmldjango set omnifunc=htmlcomplete#CompleteTags

au FileType python set tw=72 ts=4 sw=4 sta et sts=4 ai
au FileType javascript,coffee,sass,html,css,htmldjango set ts=2 sw=2 sta et sts=2 ai
au FileType xhtml,xml set ts=2 sw=2 sta et sts=2 ai

au BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
au BufWritePre *.py normal m`:%s/\s\+$//e
" Wrapping and tabs.
au BufNewFile,BufRead *.py set tw=72 ts=4 sts=4 sw=4 et
au BufNewFile,BufReadPost *.coffee setl sts=2 sw=2 et
" Wrap at 72 chars for comments.
set formatoptions=cq textwidth=72 foldignore= wildignore+=*.py[co]
set backspace=indent,eol,start

" More syntax highlighting.
let python_highlight_all = 1

" Smart indenting
set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

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
set nocompatible    " use vim defaults
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
set statusline=[%l,%v\ %P%M]\ %f\ %r%h%w\ (%{&ff})\ %{fugitive#statusline()}

colorscheme railscasts

" This beauty remembers where you were the last time you edited the file,
" and returns to the same position.
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

let g:pyflakes_use_quickfix=0
let g:pep8_map='<leader>8'
let mapleader=","  " change the leader to be a comma vs slash
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.pyo$']
let g:syntastic_check_on_open=1
let g:syntastic_mode_map = {'mode': 'active',
 \ 'active_filetypes': ['python', 'javascript', 'coffee', 'lua', 'erlang'],
 \ 'passive_filetypes': ['puppet', 'css', 'sass', 'haml', 'scss', 'json'] }

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

" Paste selection to the http://paste.pocoo.org
map <leader>p :Lodgeit<CR>

" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Quit window on <leader>q
nnoremap <leader>q :q<CR>
"
" hide matches on <leader>space
nnoremap <leader><space> :nohlsearch<cr>

" Remove trailing whitespace on <leader>S
nnoremap <leader>S :%s/\s\+$//<cr>:let @/=''<CR>

" Select the item in the list with enter
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>
