set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'L9'

Plugin 'vim-scripts/a.vim'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/OmniCppComplete'
Plugin 'ervandew/supertab'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'

"Plugin 'tpope/vim-fugitive' " git tools
"Plugin 'airblade/vim-gitgutter'

" [javascript] plugins
Plugin 'pangloss/vim-javascript'
Plugin 'Shutnik/jshint2.vim'

" [golang] plugins
Plugin 'fatih/vim-go'

" [elixir] plugins
Plugin 'elixir-lang/vim-elixir'

" All of your Plugins must be added before the following line
call vundle#end()            " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype on
filetype plugin on
filetype plugin indent on

syntax enable

colorscheme default

set t_Co=256
set background=dark

set title
set titlestring=%t%(\ %m%)%(\ (%{expand('%:p:h')})%)%(\ %a%)

set nu

set mouse=a

set autoread

set wildmenu

set ruler
set cursorline
set cursorcolumn

set hid

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase
set smartcase

set hlsearch
set incsearch

set lazyredraw

set magic

set showmatch
set mat=2

set encoding=utf-8
set fileencodings=utf-8,gbk,GB18030,ucs-bom

" Turn backup off
set nobackup
set nowritebackup
set noswapfile

" Use spaces instead of tabs
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Always show the status line
set laststatus=2

set ttimeoutlen=50

set textwidth=80
set list " Show these tabs and spaces and so on
set listchars=tab:-\ ,extends:>,precedes:< ",trail:- " Change listchars
set linebreak " Wrap long lines at a blank
set showbreak=↪  " Change wrap line break
set fillchars=diff:⣿,vert:│ " "

highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set completeopt=menuone,menu,longest

" set tags, path ...
"set path+=~/trunk/cpp
set tag+=~/.tags/cpp

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autocmd
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

func! SetCursorLine()
  set cursorline
  set cursorcolumn
endfunc

func! SetNoCursorLine()
  set nocursorline
  set nocursorcolumn
endfunc

autocmd WinLeave * call SetNoCursorLine()
autocmd WinEnter * call SetCursorLine()
autocmd InsertEnter * call SetNoCursorLine()
autocmd InsertLeave * call SetCursorLine()
"autocmd BufWritePre,FileWritePre * call DeleteTrailingWS()
autocmd FileType c,cpp,java,php,shell,javascript,html autocmd BufWritePre <buffer> :%s/\s\+$//e
autocmd FileType javascript autocmd BufWritePre <buffer> :JSHint

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Key Mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","
let g:mapleader = ","

map j gj
map k gk
map <silent> <leader><cr> :noh<cr>
map 0 ^
map <leader>dt :call DeleteTrailingWS()<CR>

" move cursor in edit mode
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" copy & paste
vnoremap <C-c> "+y
noremap <C-m> <esc>"+p
noremap <C-a> <esc>ggVG

" quickfix shortcuts
map <F3> :cn<CR>
map <F4> :cp<CR>
nnoremap <silent> <F5> :Ag \\b<C-r><C-w>\\b  ./<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin Setting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" ListToggle
""""""""""""""""""""""""""""""""""
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'
let g:lt_height = 10

" nerdtree
""""""""""""""""""""""""""""""""""
map <F9> :NERDTreeToggle<cr>
let NERDTreeIgnore=['\~$', '\.o$', '\.lo$']

" tagbar
""""""""""""""""""""""""""""""""""
nmap <F10> :TagbarToggle<CR>

" omnicppcomplete
""""""""""""""""""""""""""""""""""
let OmniCpp_NamespaceSearch = 2
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_DisplayMode = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" ctrlp
""""""""""""""""""""""""""""""""""
let g:ctrlp_working_path_mode = 'c'
let g:ctrlp_map = '<leader>f'
nnoremap <leader>b :CtrlPMRU<cr>
let g:ctrlp_max_height = 20
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|build|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" vim-cpp-enhanced-highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1

" vim-jsbeautify
"autocmd FileType javascript noremap <buffer>  <leader>ff :call JsBeautify()<cr>
"autocmd FileType html noremap <buffer> <leader>ff :call HtmlBeautify()<cr>
"autocmd FileType css noremap <buffer> <leader>ff :call CSSBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  = :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> = :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> = :call RangeCSSBeautify()<cr>

" golang mappings
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_options = "-tabs=false -tabwidth=4 -e=true"
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper Functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
