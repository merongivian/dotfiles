" reaload vim automatically when vimrc has changed
au BufWritePost .vimrc so $MYVIMRC

let mapleader = "\\"

let g:airline_powerline_fonts=1
let g:airline_theme='bubblegum'

let g:NumberToggleTrigger="<C-b>"

let g:indentLine_char = '│'
let g:indentLine_color_term = 239

let g:session_autosave = 'yes'

let g:neoterm_keep_term_open = 0
let g:neoterm_size = '10'

let g:neomake_javascript_enabled_makers = ['eslint', 'jshint']
let g:neomake_python_enabled_makers = ['pep8']

"let g:choosewin_overlay_enable = 0

" configs for snippets, see:
" https://www.reddit.com/r/vim/comments/2sx567/snipmate_and_youcompleteme_doesnt_work_well/
"
" YouCompleteMe config for snippets
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
"
" Supertab config for snippets
let g:SuperTabDefaultCompletionType    = '<C-d>'
let g:SuperTabCrMapping                = 0

" Supertab config for snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

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
let g:CtrlSpaceDefaultMappingKey = "<C-l>"
let g:CtrlSpaceUseTabline = 1

map <silent> <leader>d :execute 'e '. getcwd()<CR>
map <silent>zd :Bclose!<CR>

nmap <silent> <leader>r :call neoterm#test#run('current')<CR>
nmap <silent> <leader>R :call neoterm#test#run('file')<CR>
nmap <silent> <leader>a :call neoterm#test#run('all')<CR>
nmap <silent> <leader>l :call neoterm#close_all()<CR>

command! Day :call DayTheme()
command! Night :call NightTheme()

tnoremap <Esc> <c-\><c-n>

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

nnoremap <silent><C-p> :Unite -start-insert file<CR>
nnoremap <leader>[ :Unite buffer<CR>
nmap <C-m> :b#<CR>

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

"" insert motion
nmap <C-a> I
nmap <C-e> A

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
Plug 'Shougo/unite.vim'
Plug 'bling/vim-airline'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
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
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'kassio/neoterm'
Plug 'Yggdroot/indentLine'
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-scripts/camelcasemotion'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-obsession'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-expand-region'
Plug 'szw/vim-ctrlspace'
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
" remove branch ref when merged
Plug 'unblevable/quick-scope', {'branch': '1.1.1'}
Plug 't9md/vim-choosewin'
Plug 'takac/vim-hardtime'
Plug 'rhysd/vim-crystal'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'lambdatoast/elm.vim', { 'for': 'elm' }
Plug 'elixir-lang/vim-elixir', { 'for': 'elixir' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
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
