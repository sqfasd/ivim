"""""""""""""""""""""""""""""""""""""""
" => move cursor in edit mode
"""""""""""""""""""""""""""""""""""""""
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

"""""""""""""""""""""""""""""""""""""""
" => set tags, path ...
"""""""""""""""""""""""""""""""""""""""
"set path+=~/trunk/cpp
"set path+=~/trunk/cpp/.ymake-out/opt/thrift-out
"set path+=~/trunk/cpp/.ymake-out/opt/proto-out
"set tag+=~/.tags/base

"""""""""""""""""""""""""""""""""""""""
" => copy & paste
"""""""""""""""""""""""""""""""""""""""
vnoremap <C-c> "+y
noremap <C-m> <esc>"+p
noremap <C-a> <esc>ggVG

"""""""""""""""""""""""""""""""""""""""
" => quickfix shortcuts
"""""""""""""""""""""""""""""""""""""""
map <F3> :cn<CR>
map <F4> :cp<CR>

nnoremap <silent> <F5> :Ack<CR>
