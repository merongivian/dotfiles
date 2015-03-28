" reaload vim automatically when vimrc has changed
au BufWritePost .vimrc so $MYVIMRC

let mapleader = "\\"

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
let g:syntastic_ruby_checkers = ['mri', 'rubylint']

let g:NumberToggleTrigger="<C-b>"

let g:indentLine_char = '│'
let g:indentLine_color_term = 239

let NERDTreeHijackNetrw = 1
let g:ctrlp_dont_split = 'nerdtree'

" ino <c-j> <c-r>=TriggerSnippet()<cr>
" snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>
" imap ss <esc>a<Plug>snipMateNextOrTrigger
" smap ss <Plug>snipMateNextOrTrigger

map <silent> <leader>d :execute 'e '. getcwd()<CR>
map <silent> bd :Bclose<CR>

nmap <leader>t :GitGutterToggle<CR> :GitGutterLineHighlightsEnable<CR>
nmap <leader>nh :noh<CR>

nmap <silent> <leader>r :TestNearest<CR>
nmap <silent> <leader>R :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>

nnoremap <leader>[ :buffers<CR>:buffer<Space>

set noswapfile

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
set expandtab!
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

call plug#begin()
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'msanders/snipmate.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-surround'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'rking/ag.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'lukerandall/haskellmode-vim', { 'for': 'haskell' }
Plug 'dsawardekar/ember.vim', { 'for': 'javascript' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'janko-m/vim-test'
Plug 'Yggdroot/indentLine'
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-scripts/camelcasemotion'
" install cmake and
" cd ~/.vim/plugged/YouCompleteMe && ./install.sh --clang-completer
Plug 'Valloric/YouCompleteMe'
call plug#end()

"colorscheme herald
colorscheme jelleybeans
"colorscheme oceanblack256
"colorscheme candyman
"colorscheme mustang
"colorscheme seoul256

