set nocompatible

" Pathogen plugin loader
execute pathogen#infect()

" filetype stuff
filetype on
filetype plugin on
filetype indent on

" split navigation
nnoremap <silent> <C-Left>  :wincmd h<CR>
nnoremap <silent> <C-Right> :wincmd l<CR>
nnoremap <silent> <C-Up>    :wincmd j<CR>
nnoremap <silent> <C-Down>  :wincmd k<CR>

" tab navigation
nnoremap <C-S-tab>  :tabprevious<CR>
nnoremap <C-tab>    :tabnext<CR>
nnoremap <C-t>      :tabnew<CR>
inoremap <C-S-tab>  <Esc>:tabprevious<CR>i
inoremap <C-tab>    <Esc>:tabnext<CR>i
inoremap <C-t>      <Esc>:tabnew<CR>

" running
map <F9> :w<CR>:!./%<CR>
imap <F9> <Esc>:w<CR>:!./%<CR>

" indentation
set expandtab
set sw=2
set sts=2
set modeline

" misc
set enc=utf-8
set number
set cursorline!
syntax on

" theme
colors monokai

let g:GPGDefaultRecipients=["maciej@gamrat.it"]
