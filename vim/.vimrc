
"Some sensible defaults ---------{{{
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
  set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
  " Turn off toolbar and menu
  set guioptions-=T
  set guioptions-=m
else
  colorscheme desert
end

" Quick timeouts on key combinations.
" set timeoutlen=300
set timeoutlen=1000 ttimeoutlen=0

" Catch trailing whitespace
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Toggle highlighting
" nmap <silent> <C-n> :silent :set nohls!<CR>:silent :set nohls?<CR>
nmap <silent> <C-n> :silent :nohlsearch<CR>

" Scroll faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>

" just use :StripWhitespace
let g:better_whitespace_enabled = 0 " use ripgrep first let g:grepper = {'tools': ['rg', 'ag', 'git', 'grep']} recognize all Markdown files autocmd BufNewFile,BufReadPost *.md set filetype=markdown let g:markdown_fenced_languages = ['c', 'cpp', 'csharp=cs', 'bash=sh', 'json'] """ Other configurations
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

if has('mouse')
  set mouse=a
endif

let mapleader = " "
"}}}


"FZF -------{{{
let g:fzf_command_prefix='Fz'
nmap <silent> <Leader>f :FzFiles<CR>
nmap <silent> <Leader>b :FzBuffers<CR>
nmap <silent> <Leader>c :FzCommands<CR>

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
let g:fzf_launcher='xfce4-terminal -x sh -c %s'
let g:fzf_command_prefix='Fz'
"}}}

" % matches on if/else, html tags, etc.
runtime macros/matchit.vim

" Bash-like filename completion {{{
set path+=**
set wildmenu
set wildmode=list:longest
set wildignore=*.o,*.fasl
"}}}

"File formats {{{
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
  au InsertEnter * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_BLOCK/TERMINAL_CURSOR_SHAPE_IBEAM/' ~/.config/xfce4/terminal/terminalrc"                                  
  au InsertLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_IBEAM/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"                                  
  au VimLeave * silent execute "!sed -i.bak -e 's/TERMINAL_CURSOR_SHAPE_IBEAM/TERMINAL_CURSOR_SHAPE_BLOCK/' ~/.config/xfce4/terminal/terminalrc"  
endif
" }}}

" Indent XML readably{{{
function! DoPrettyXML()
	1,$!xmllint --format --recover -
	set filetype=xml
endfunction
command! PrettyXML call DoPrettyXML()
"}}}

" Load local settings
if filereadable($HOME . "/.vimrc-local")
	source ~/.vimrc-local
endif"{{{}}}

" Plugins -------------- {{{
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
Plug 'w0rp/ale'						" Async Lint

Plug 'flazz/vim-colorschemes'
Plug 'altercation/vim-colors-solarized'                    " Best colors ever
Plug 'felixhummel/setcolors.vim'
Plug 'elzr/vim-json'                                    " Better JSON
Plug 'majutsushi/tagbar'                                " Tagbar
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }      " Edits graph
Plug 'mhinz/vim-grepper'                                " Better :grep
Plug 'ntpeters/vim-better-whitespace'                   " Whitespace
"Plug 'scrooloose/syntastic'                             " Syntax checker
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-commentary'                             " Comments
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-fugitive'                               " Git interface
Plug 'wesQ3/vim-windowswap'
Plug 'MobiusHorizons/fugitive-stash.vim'
Plug 'romgrk/winteract.vim'
Plug 'tommcdo/vim-fubitive'
Plug 'blueyed/vim-diminactive'
Plug 'tpope/vim-repeat'                                 " Repeat for plugins
Plug 'tpope/vim-scriptease'                             " VimL REPL
Plug 'tpope/vim-unimpaired'                             " Unimparied
Plug 'tpope/vim-sensible'                               " Sensible defaults
Plug 'tpope/vim-sleuth'                                 " Adaptive indentation
Plug 'vim-scripts/ZoomWin'
Plug 'tpope/vim-surround'                               " Surrounding
Plug 'vim-airline/vim-airline'                          " Status line
Plug 'vim-airline/vim-airline-themes'                   " Status line themes
Plug 'vim-scripts/JavaDecompiler.vim'			" Jad Decompiler - needs jad on path
Plug 'tfnico/vim-gradle'
Plug 'tpope/vim-dispatch'
Plug 'skywind3000/asyncrun.vim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'szw/vim-maximizer'
Plug 'severin-lemaignan/vim-minimap'

"Auto complete and Snippets
"Plug 'metalelf0/supertab'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'Shougo/echodoc.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
call plug#end()
"}}}

""" Plugin configurations
" GUI
if has('gui_running')
  if has('gui_gtk')
  "  set guifont=Hack\ 11
  elseif has('gui_win32')
   " set guifont=Hack:h11:cANSI
  endif
endif

" appearance {{{
let g:solarized_termcolors=256
silent! colorscheme solarized
set background=dark
let g:gitgutter_override_sign_column_highlight = 0
"}}}

" disable concealing in JSON
let g:vim_json_syntax_conceal = 0

" Persistent Undo {{{
if has('persistent_undo')
  set undodir=~/.vim/undodir/
  silent call system('mkdir -p ' . &undodir)
  set undofile
endif
"}}}


" Last known cursor position {{{
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") |
      \   exe "normal! g`\"" |
      \ endif
"}}}

" Load local configurations if available
silent! source ~/.vim/local.vim
silent! source ~/.vim/functions.vim
set grepprg=rg\ --vimgrep

set tabstop=4
set softtabstop=4
set shiftwidth=4


" Syntastic related settings {{{
set statusline+=%#warningmsg#
set statusline+=%{ALEGetStatusLine()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_java_checkers=['javac']
let g:syntastic_java_javac_config_file_enabled = 1
" to make syntastic find the javac_config file
function! FindConfig(prefix, what, where)
    let cfg = findfile(a:what, escape(a:where, ' ') . ';')
    " cfg !=# '' ? ' ' . a:prefix . ' ' . shellescape(cfg) : ''
    if filereadable(fnameescape(cfg))
	exec 'source '.fnameescape(cfg)
   endif
    return ''
endfunction

autocmd FileType java compiler gradlew
autocmd FileType gradle compiler gradlew
autocmd FileType java let b:syntastic_java_javac_classpath =
    \ FindConfig('-c', '.syntastic_javac_config', expand('<afile>:p:h', 1)) .
    \ get(g:, 'syntastic_java_javac_classpath', '') 
autocmd FileType java let b:ale_java_javac_classpath =
    \ FindConfig('-c', '.syntastic_javac_config', expand('<afile>:p:h', 1)) .
    \ get(g:, 'syntastic_java_javac_classpath', '') 

"autocmd FileType java let b:JavaComplete_LibsPath = g:syntastic_java_javac_classpath

"au FileType java au BufEnter <buffer> let $CLASSPATH=g:JavaComplete_LibsPath . ":" .   g:JavaComplete_SourcesPath
"}}}

" for fugitive stash
let g:fugitive_stash_domains = ['http://git.pega.io', 'https://git.pega.io/projects/PRPC/repos/prpc-platform/browse']

" for zoomwin
nnoremap <silent> <leader>m :ZoomWin<CR>

" Load Eclim Settings
if filereadable($HOME . "/.vim/.vimrc-eclim")
	source ~/.vim/.vimrc-eclim
endif

"Autocomplete and deoplete setup --------{{{
set completeopt=longest,menuone,preview
let g:EclimCompletionMethod = 'omnifunc'
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" setting this makes supertab not work let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsListSnippets="<C-l>"
let g:deoplete#enable_at_startup = 1
let g:deoplete#complete_method = "completefunc"
let g:deoplete#enable_camel_case = 1
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  return pumvisible() ? deoplete#close_popup() : "\<CR>"
endfunction
" https://github.com/Shougo/deoplete.nvim/issues/100
" use tab to forward cycle
" inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
" inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
let g:deoplete#omni#input_patterns = {}
let g:deoplete#omni#input_patterns.java = '[^. *\t]\.\w*'
" Lazy load Deoplete to reduce statuptime
" See manpage
" Enable deoplete when InsertEnter.
let g:deoplete#enable_at_startup = 0
autocmd InsertEnter * call deoplete#enable()
"}}}

let g:table_mode_corner='|'


" Use filtered up and down in ex mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

let g:ale_open_list=0
nmap <leader>w :InteractiveWindow<CR>

"Grepper mappings {{{
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)
nnoremap <leader>ga :Grepper -tool ag -side<cr>
nnoremap <leader>G :Grepper <cr>
let g:grepper = { 'next_tool': '<leader>g' }
nnoremap <leader>* :Grepper -tool ag -cword -noprompt<cr>
nnoremap <leader>gb :Grepper -tool rg -buffers<cr>
"}}}

"DimInactive {{{
let g:diminactive_use_colorcolumn = 1
let g:diminactive_enable_focus = 1
let g:diminactive = 1
let g:diminactive_use_syntax = 0
"}}}


"java lsp with eclipse lsp {{{
au User lsp_setup call lsp#register_server({
    \ 'name': 'jdt_language_server',
    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'java -Declipse.application=org.eclipse.jdt.ls.core.id1  -Dosgi.bundles.defaultStartLevel=4 -Declipse.product=org.eclipse.jdt.ls.core.product -noverify -Xmx1G -XX:+UseG1GC -XX:+UseStringDeduplication -jar /home/osboxes/dev/ecpse/tools/jdt-language-server-latest/plugins/org.eclipse.equinox.launcher_1.4.0.v20161219-1356.jar -configuration /home/osboxes/dev/ecpse/tools/jdt-language-server-latest/config_linux -data /home/osboxes/dev/ecpse/tools/jdt-language-server-latest/workspace']},
    \ 'whitelist': ['java'],
    \ })
" }}}


"Quickly edit my vimrc {{{
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>en :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
"}}}

inoremap jk <esc>
inoremap <esc> <nop>
"To make bg transparent
"hi Normal guibg=NONE ctermbg=NONE


" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
