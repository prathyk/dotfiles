
set nocompatible
syntax on
filetype on
filetype plugin on
filetype indent on

set history=1000
set showmatch
set matchtime=0
set shortmess=atI
set ruler
set showcmd

set sidescroll=1
set sidescrolloff=3

" Set xterm title
set title

" Search options
set hlsearch
set incsearch
set ignorecase
set smartcase

set visualbell
set noerrorbells
set printoptions=paper:letter

" Keep more lines of context
set scrolloff=3

" Make backspace delete lots of things
set backspace=indent,eol,start

" Auto-backup files and .swp files don't go to pwd
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" Allow switching edited buffers without saving
set hidden

" Look for the file in the current directory, then south until you reach home.
set tags=tags;~/

" Who needs .gvimrc?
if has('gui_running')
  set encoding=utf-8
  "set guifont=Monospace\ Bold\ 9
  set guifont=Bitstream\ Vera\ Sans\ Mono\ 11
  " Turn off toolbar and menu
  set guioptions-=T
  set guioptions-=m
  colorscheme inkpot
else
  colorscheme desert
end

" Change <Leader>
let mapleader = ","

" Quick timeouts on key combinations.
set timeoutlen=300

" Lusty
"let g:LustyJugglerShowKeys = 2
"let g:LustyJugglerKeyboardLayout = "dvorak"
"let g:LustyExplorerAlwaysShowDotFiles = 1
let g:LustyExplorerSuppressRubyWarning = 1
nmap <silent> <Leader>f :LustyFilesystemExplorer<CR>
nmap <silent> <Leader>b :LustyBufferExplorer<CR>
nmap <silent> <Leader>r :LustyFilesystemExplorerFromHere<CR>
nmap <silent> <Leader>g :LustyBufferGrep<CR>
nmap <silent> <Leader>j :LustyJuggler<CR>
nmap <silent> <TAB> :LustyJugglePrevious<CR>

"let g:LustyJugglerAltTabMode=1
"noremap <silent> <A-s> :LustyJuggler<CR>

" Catch trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Fix command typos (stolen from Adam Katz)
nmap ; :

" Buffer management
nmap <C-h> :bp<CR>
nmap <C-l> :bn<CR>
nmap <C-d> :bw<CR>
vmap <C-d> :bw<CR>

" Toggle highlighting
" nmap <silent> <C-n> :silent :set nohls!<CR>:silent :set nohls?<CR>
nmap <silent> <C-n> :silent :nohlsearch<CR>

" Scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>

" % matches on if/else, html tags, etc.
runtime macros/matchit.vim

" Bash-like filename completion
set path+=**
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.fasl

if has("autocmd")

  autocmd BufRead letter* set filetype=mail
  autocmd Filetype mail set fo -=l autoindent spell

  autocmd Filetype sh set ts=4 shiftwidth=2 expandtab
  autocmd Filetype lisp,ruby,xml,html set ts=8 shiftwidth=2 expandtab
  autocmd Filetype python set ts=2 shiftwidth=2 expandtab
  autocmd Filetype xml,xslt,diff,ruby color desert
  autocmd Filetype xml,xslt,diff,ruby set expandtab
  autocmd FileType javascript,html set ts=2 shiftwidth=2 expandtab
  autocmd FileType java set ts=2 shiftwidth=2 expandtab
  autocmd FileType r set ts=2 shiftwidth=2 expandtab
  autocmd BufReadPre viper,.viper set filetype=lisp
  autocmd FileType tex set ts=2 shiftwidth=2 expandtab

endif
" Indent XML readably
function! DoPrettyXML()
	1,$!xmllint --format --recover -
	set filetype=xml
endfunction
command! PrettyXML call DoPrettyXML()

" Load local settings
if filereadable($HOME . "/.vimrc-local")
	source ~/.vimrc-local
endif


" Download vim-plug if not already installed
if has('unix')
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
  endif
elseif has('win32')
  if empty(glob('~/vimfiles/autoload/plug.vim'))
    echom "Install vim-plug!"
  endif
endif

""" Plugins
call plug#begin('~/.vim/plugged')
Plug 'airblade/vim-gitgutter'                           " Git hunks
Plug 'andschwa/vim-colors-solarized'                    " Best colors ever
Plug 'easymotion/vim-easymotion'                        " Movements
Plug 'EinfachToll/DidYouMean'                           " File guessing
Plug 'elzr/vim-json'                                    " Better JSON
Plug 'majutsushi/tagbar'                                " Tagbar
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }      " Edits graph
Plug 'mhinz/vim-grepper'                                " Better :grep
Plug 'ntpeters/vim-better-whitespace'                   " Whitespace
Plug 'scrooloose/syntastic'                             " Syntax checker
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-commentary'                             " Comments
Plug 'tpope/vim-eunuch'                                 " UNIX commands
Plug 'tpope/vim-fugitive'                               " Git interface
Plug 'tpope/vim-repeat'                                 " Repeat for plugins
Plug 'tpope/vim-scriptease'                             " VimL REPL
Plug 'tpope/vim-sensible'                               " Sensible defaults
Plug 'tpope/vim-sleuth'                                 " Adaptive indentation
Plug 'tpope/vim-surround'                               " Surrounding
Plug 'tpope/vim-vinegar'                                " File explorer
Plug 'vim-airline/vim-airline'                          " Status line
Plug 'vim-airline/vim-airline-themes'                   " Status line themes
Plug 'vim-scripts/LustyExplorer'			" Lusty Explorer
Plug 'vim-scripts/LustyJuggler'				" Lusty Juggler
Plug 'vim-scripts/JavaDecompiler.vim'			" Jad Decompiler - needs jad on path
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'					" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tfnico/vim-gradle'
Plug 'tpope/vim-dispatch'
call plug#end()

""" Plugin configurations
" GUI
if has('gui_running')
  if has('gui_gtk')
    set guifont=Hack\ 11
  elseif has('gui_win32')
    set guifont=Hack:h11:cANSI
  endif
endif

" appearance
let g:solarized_termcolors=256
silent! colorscheme solarized
set background=dark
let g:gitgutter_override_sign_column_highlight = 0

" disable concealing in JSON
let g:vim_json_syntax_conceal = 0

" just use :StripWhitespace
let g:better_whitespace_enabled = 0

" use ripgrep first
let g:grepper = {'tools': ['rg', 'ag', 'git', 'grep']}

" recognize all Markdown files
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let g:markdown_fenced_languages = ['c', 'cpp', 'csharp=cs', 'bash=sh', 'json']

""" Other configurations
set hidden      " multiple buffers
set ignorecase  " ignore case in searches
set linebreak   " wrap after words
set smartcase   " match case once specified
set spell       " always spell check
set visualbell  " no sound
set autowrite   " write files when leaving

" configure wildmenu tab completion
set wildmode=list:longest,full
set wildignorecase

if has('persistent_undo')
  set undodir=~/.vim/undodir/
  silent call system('mkdir -p ' . &undodir)
  set undofile
endif

if has('mouse')
  set mouse=a
endif

let mapleader = " "

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif

" Load local configurations if available
silent! source ~/.vim/local.vim
silent! source ~/.vim/functions.vim
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options

command! -bang -nargs=* Find call fzf#vim#grep('runcached.py -c 3600 rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
set grepprg=rg\ --vimgrep

set tabstop=4
set softtabstop=4
set shiftwidth=4
