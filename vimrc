let mapleader = "\\"

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
let g:syntastic_ruby_checkers = ['mri', 'rubocop', 'rubylint']

nmap <leader>z :NERDTreeToggle<CR>
nmap <leader>t :GitGutterToggle<CR> :GitGutterLineHighlightsEnable<CR>
nmap <leader>nh :noh<CR>

nnoremap <leader>[ :buffers<CR>:buffer<Space>

set hlsearch
set incsearch
set laststatus=2
syntax enable
set number
set ruler
set encoding=utf-8

set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

set hidden

"" buffer navigation
nmap <C-m> :b#<CR>
nmap [b :bp<CR>
nmap ]b :bn<CR>
nmap bx :NERDTreeClose<CR> :TagbarClose<CR> :bdelete<CR>

"" insert motion
nmap <C-a> I
nmap <C-e> A

"" jump motion
map s E
map , B

let g:tagbar_type_ruby = {
                \ 'kinds' : [
                    \ 'm:modules',
                    \ 'c:classes',
                    \ 'f:methods',
                    \ 'F:singleton methods',
                    \ 'C:constants',
                    \ 'a:aliases'
                \ ],
                \ 'ctagsbin':  'ripper-tags',
                \ 'ctagsargs': ['-f', '-']
                \ }

" removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'msanders/snipmate.vim'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-surround'
Plugin 'michaeljsmith/vim-indent-object'
Plugin 'tpope/vim-fugitive.git'
Plugin 'primitivorm/tagbar'
Plugin 'flazz/vim-colorschemes'
Plugin 'skalnik/vim-vroom'
Plugin 'airblade/vim-gitgutter'
Plugin 'rking/ag.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme herald
"colorscheme jelleybeans

