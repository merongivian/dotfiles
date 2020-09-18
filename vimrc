" reaload vim automatically when vimrc has changed
au BufWritePost .vimrc so $MYVIMRC

let g:ruby_path = system('echo $HOME/.rbenv/shims')
let g:lisp_rainbow = 1

let mapleader = "\\"

let g:airline_powerline_fonts=1

"nmap <silent> <leader>q :call neoterm#test#run('current')<CR>

let g:indentLine_char = '│'
let g:indentLine_color_term = 239

let g:session_autosave = 'yes'

let g:neoterm_keep_term_open = 0
let g:neoterm_size = '10'

"let g:neomake_javascript_enabled_makers = ['eslint', 'jshint']
let g:neomake_python_enabled_makers = ['pep8']
let g:neomake_ruby_checkers = ['rubocop']

"let g:choosewin_overlay_enable = 0

" Supertab config for snippets
" not sure what this does, consider deleting
"let g:SuperTabDefaultCompletionType    = '<C-d>'
"let g:SuperTabCrMapping                = 0

" scroll from top to bottom
let g:SuperTabDefaultCompletionType = "<c-n>"
" Supertab config for snippets
let g:UltiSnipsExpandTrigger="<C-d>"
let g:UltiSnipsJumpForwardTrigger="<C-d>"
"not really using this, but should
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" deoplete
"let g:deoplete#enable_at_startup = 1
"inoremap <expr><C-t>  pumvisible() ? "\<CR>" : "\<C-t>"

" hardtime
let g:hardtime_default_on = 1

let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 2
let g:hardtime_showmsg = 1
let g:hardtime_timeout = 2000

let g:list_of_normal_keys = ["h", "j", "k", "l", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1
let g:CtrlSpaceDefaultMappingKey = "<S-m>"
let g:CtrlSpaceUseTabline = 1

" rspec fold
let g:fold_rspec_foldclose = 'all'
let g:fold_rspec_foldenable = 0

" ctrlp performance
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" rainbow parenthesis
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'tex': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
\       },
\       'lisp': {
\           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\       },
\       'vim': {
\           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
\       },
\       'html': {
\           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
\       },
\       'css': 0,
\   }
\}

" vim-test
let g:test#ruby#minitest#executable = 'm'
let test#strategy = "neoterm"

map <silent> <leader>= :execute 'e '. getcwd()<CR>
map <silent>zd :Bclose!<CR>

"nmap <silent> <leader>q :call neoterm#test#run('current')<CR>
"nmap <silent> <leader>R :call neoterm#test#run('file')<CR>
"nmap <silent> <leader>a :call neoterm#test#run('all')<CR>
"nmap <silent> <leader>l :call neoterm#close_all()<CR>

nmap <silent> <leader>q :TestNearest<CR>
nmap <silent> <leader>R :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
"nmap <silent> <leader>g :TestVisit<CR>

command! Day :call DayTheme()
command! Night :call NightTheme()

tnoremap <Esc> <c-\><c-n>
vnoremap <leader>gg y:Ag <c-r>"<cr>

" copy to clipboard
map <C-c> "+y <CR>
map Y y$

vmap <Enter> <Plug>(EasyAlign)

nmap <Space> <Plug>(choosewin)

if bufwinnr(1)
  map <C-x>j <C-W>+4
  map <C-x>k <C-W>-4
  map <C-x>h :vertical resize -4<CR>
  map <C-x>l :vertical resize +4<CR>
endif

nmap <C-m> :b#<CR>
" get all files and buffers
nmap <leader>[ :Unite buffer<CR>

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

set cursorline
set cursorcolumn

au BufNewFile,BufRead *.tex set spelllang=es spell
au BufNewFile,BufRead *.md set spelllang=en spell
au BufReadPost *.es6 set syntax=javascript

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

set hidden

"" insert motion
nmap <C-a> I
nmap <C-e> A

"" tab motion
nmap <C-k> :tabprev<CR>
nmap <C-j> :tabnext<CR>
"" TODO: this is not working, but would be nice to have
"nmap <C-h> :tabfirst<CR>
"nmap <C-l> :tablast<CR>

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

autocmd! BufWritePost * Neomake

if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin()
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'
Plug 'benekastah/neomake'
Plug 'tpope/vim-surround'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'rking/ag.vim'
"Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'kassio/neoterm'
Plug 'Yggdroot/indentLine'
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-scripts/camelcasemotion'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-obsession'
"Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-expand-region'
Plug 'rhysd/clever-f.vim'
" color themes
Plug 'NLKNguyen/papercolor-theme'
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'junegunn/seoul256.vim'
" install cmake and
" cd ~/.vim/plugged/YouCompleteMe && ./install.sh --clang-completer
" phyton 2 support for neovim
" pip install nvim
"Plug 'Valloric/YouCompleteMe', { 'do': 'python3 ./install.py' }
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" always select first item on pop menu
" Plug 'vim-scripts/AutoComplPop'
" for my thesis :)
Plug 'LaTeX-Box-Team/LaTeX-Box'
Plug 'dermusikman/sonicpi.vim'
Plug 't9md/vim-choosewin'
Plug 'takac/vim-hardtime'
Plug 'rhysd/vim-crystal'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'lambdatoast/elm.vim', { 'for': 'elm' }
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'thinca/vim-ref'
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'mhinz/vim-mix-format', { 'for': 'elixir' }
" detects elixir keywords and triggers autocomplete methods
" without having to use C-space
"Plug 'larrylv/ycm-elixir', { 'for': 'elixir' }
" tags: use ripper_tags https://github.com/lzap/gem-ripper-tags
" ripper-tags -R --exclude=vendor
" https://chodounsky.net/2016/12/09/using-tags-to-browse-ruby-and-gem-source-with-vim/
" Plug 'tpope/vim-rails', { 'for': 'ruby' }
" Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'kana/vim-textobj-user', { 'for': 'elixir' }
Plug 'andyl/vim-textobj-elixir', { 'for': 'elixir' }
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'isRuslan/vim-es6'
Plug 'mhinz/vim-janah'
Plug 'luochen1990/rainbow'
Plug 'Shougo/unite.vim'
Plug 'w0rp/ale'
Plug 'mhinz/vim-hugefile'
Plug 'janko-m/vim-test'
" livecoding
Plug 'munshkr/vim-tidal'
Plug 'rlue/vim-fold-rspec'

call plug#end()

autocmd ColorScheme janah highlight Normal ctermbg=235
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
  colorscheme janah
endfunction

function! g:ToggleNuMode()
  if &relativenumber == 1
     set norelativenumber
  else
     set relativenumber
  endif
endfunction
nnoremap <silent><C-b> :call g:ToggleNuMode()<cr>
