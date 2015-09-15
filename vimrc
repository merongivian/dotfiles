" reaload vim automatically when vimrc has changed
au BufWritePost .vimrc so $MYVIMRC

let mapleader = "\\"

let g:airline_powerline_fonts=1

let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='bubblegum'

let g:NumberToggleTrigger="<C-b>"

let g:indentLine_char = '│'
let g:indentLine_color_term = 239

let NERDTreeHijackNetrw = 1
let g:ctrlp_dont_split = 'nerdtree'

let g:session_autosave = 'yes'

let g:neoterm_keep_term_open = 0
let g:neoterm_size = '10'

let g:neomake_javascript_enabled_makers = ['eslint', 'jshint']

" ino <c-j> <c-r>=TriggerSnippet()<cr>
" snor <c-j> <esc>i<right><c-r>=TriggerSnippet()<cr>
" imap ss <esc>a<Plug>snipMateNextOrTrigger
" smap ss <Plug>snipMateNextOrTrigger

map <silent> <leader>d :execute 'e '. getcwd()<CR>
map <silent> td :Bclose!<CR>

nmap <leader>t :GitGutterToggle<CR> :GitGutterLineHighlightsEnable<CR>
nmap <leader>nh :noh<CR>

nmap <silent> <leader>r :call neoterm#test#run('current')<CR>
nmap <silent> <leader>R :call neoterm#test#run('file')<CR>
nmap <silent> <leader>a :call neoterm#test#run('all')<CR>
nmap <silent> <leader>l :call neoterm#close_all()<CR>

command! Day :call DayTheme()
command! Night :call NightTheme()

nnoremap <leader>[ :buffers<CR>:buffer<Space>
tnoremap <Esc> <c-\><c-n>

" pinky savers from this blog: http://nathan-long.com/blog/vim-a-few-of-my-favorite-things/
noremap <M-;> ;
noremap ; :

inoremap jj <esc>

" copy to clipboard
map <C-c> "+y <CR>

vmap <Enter> <Plug>(EasyAlign)

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

au BufNewFile,BufRead *.tex set spelllang=es spell
au BufNewFile,BufRead *.md set spelllang=en spell

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

set hidden

" code for enabling quickscope only when movin through characters
" see: https://gist.github.com/cszentkiralyi/dc61ee28ab81d23a67aa

let g:qs_enable = 0
let g:qs_enable_char_list = [ 'f', 'F', 't', 'T' ]

function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif
    let letter = nr2char(getchar())
    if needs_disabling
        QuickScopeToggle
    endif
    return a:movement . letter
endfunction

for i in g:qs_enable_char_list
  execute 'noremap <expr> <silent>' . i . " Quick_scope_selective('". i . "')"
endfor

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

" remap uppercase error :Qa
cnoreabbrev W w
cnoreabbrev Qa qa
cnoreabbrev Q q

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

augroup sourcesession
        autocmd!
        autocmd VimEnter * nested
        \ if !argc() && empty(v:this_session) && filereadable('Session.vim') |
        \   source Session.vim |
        \ endif
augroup END

" removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

nnoremap <silent> <Leader>rts :call TrimWhiteSpace()<CR>

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

autocmd BufWritePost * Neomake

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'msanders/snipmate.vim'
Plug 'benekastah/neomake'
Plug 'tpope/vim-surround'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'rking/ag.vim'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'moll/vim-node', { 'for': 'javascript' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'dsawardekar/ember.vim', { 'for': 'javascript' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'kassio/neoterm'
Plug 'Yggdroot/indentLine'
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-scripts/camelcasemotion'
Plug 'Raimondi/delimitMate'
Plug 'junegunn/vim-easy-align'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-obsession'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-expand-region'
" color themes
Plug 'NLKNguyen/papercolor-theme'
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
" install cmake and
" cd ~/.vim/plugged/YouCompleteMe && ./install.sh --clang-completer
" phyton 2 support for neovim
" pip install nvim
Plug 'Valloric/YouCompleteMe'
" for my thesis :)
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'dermusikman/sonicpi.vim'
Plug 'unblevable/quick-scope'
call plug#end()

colorscheme jellybeans
" custom functions

function! DayTheme()
  set background=light
  let g:airline_theme='PaperColor'
  let g:indentLine_color_term = 250
  colorscheme papercolor
endfunction

function! NightTheme()
  set background=dark
  let g:airline_theme='bubblegum'
  let g:indentLine_color_term = 239
  colorscheme seoul256
endfunction
