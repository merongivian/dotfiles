"reaload vim automatically when vimrc has changed
au BufWritePost .vimrc so $MYVIMRC

let mapleader = "\\"

let g:ruby_path = system('echo $HOME/.rbenv/shims')

" copy to clipboard
map <C-c> "+y <CR>
map Y y$

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

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen
set hidden

au BufNewFile,BufRead *.tex set spelllang=es spell
au BufNewFile,BufRead *.md set spelllang=en spell
au BufReadPost *.es6 set syntax=javascript

" remap uppercase error :Qa
cnoreabbrev W w
cnoreabbrev Qa qa
cnoreabbrev Q q
cnoreabbrev Wq wq

"" insert motion
nmap <C-a> I
nmap <C-e> A

" removes trailing spaces
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

autocmd FileWritePre    * :call TrimWhiteSpace()
autocmd FileAppendPre   * :call TrimWhiteSpace()
autocmd FilterWritePre  * :call TrimWhiteSpace()
autocmd BufWritePre     * :call TrimWhiteSpace()

tnoremap <Esc> <c-\><c-n>

" weird compatibility config from the 70s that might break some plugins if
" deleted
set nocompatible
filetype off

let g:lisp_rainbow = 1

let g:session_autosave = 'yes'

let g:neoterm_keep_term_open = 0
let g:neoterm_size = '10'

let g:UltiSnipsExpandTrigger="<C-d>"
let g:UltiSnipsJumpForwardTrigger="<C-d>"

" vim tree
let g:nvim_tree_hide_dotfiles = 1

" hardtime
let g:hardtime_default_on = 1

let g:hardtime_allow_different_key = 1
let g:hardtime_maxcount = 2
let g:hardtime_showmsg = 1
let g:hardtime_timeout = 2000

let g:list_of_normal_keys = ["h", "j", "k", "l", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_visual_keys = ["h", "j", "k", "l", "<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]
let g:list_of_insert_keys = ["<UP>", "<DOWN>", "<LEFT>", "<RIGHT>"]

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

" split-term
set splitbelow

" vim-test
function! BufferTermStrategy(cmd)
  exec '20Term ' . a:cmd
endfunction

let g:test#ruby#minitest#executable = 'm'
let g:test#custom_strategies = {'bufferterm': function('BufferTermStrategy')}
let g:test#strategy = 'bufferterm'

" ale linters
let g:ale_linters = {'ruby': ['ruby']}

map <silent> <leader>= :execute 'e '. getcwd()<CR>
map <silent>zd :Bclose!<CR>

nmap <silent> <leader>q :TestNearest<CR>
nmap <silent> <leader>R :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>

"codeium
let g:codeium_disable_bindings = 1
imap <script><silent><nowait><expr> <C-t> codeium#Accept()

imap <C-e>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-r>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-x>   <Cmd>call codeium#Clear()<CR>

command! -nargs=1 Ts :lua require('telescope.builtin').live_grep({default_text = <q-args>})

vnoremap <leader>gg y:Ts <c-r>"<cr>
vnoremap <leader>rr y:Ts def <c-r>"<cr>

vmap <Enter> <Plug>(EasyAlign)

"nmap <Space> <Plug>(choosewin)

if bufwinnr(1)
  map <leader>j <C-W>+4
  map <leader>k <C-W>-4
  map <leader>h :vertical resize -4<CR>
  map <leader>l :vertical resize +4<CR>
endif

"" tab motion
nmap <C-k> :tabprev<CR>
nmap <C-j> :tabnext<CR>
"" TODO: this is not working, but would be nice to have
"nmap <C-h> :tabfirst<CR>
"nmap <C-l> :tablast<CR>

" tidal
filetype plugin on
let g:tidal_target = "terminal"

nnoremap - :NvimTreeOpen<CR>

call plug#begin()
Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'nvim-tree/nvim-tree.lua'
Plug 'tpope/vim-vinegar'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
Plug 'rking/ag.vim'
"Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'kassio/neoterm'
Plug 'rbgrouleff/bclose.vim'
Plug 'vim-scripts/camelcasemotion'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'xolox/vim-misc'
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
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
Plug 'dense-analysis/ale'
Plug 'mhinz/vim-hugefile'
Plug 'janko-m/vim-test'
" livecoding
Plug 'merongivian/vim-tidal'
Plug 'vimlab/split-term.vim'
" -------------------------------------
" -------------------------------------
" ----------- LUA PLUGINS -------------
" -------------------------------------
" -------------------------------------
" lsp
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'ray-x/cmp-treesitter'
Plug 'hrsh7th/nvim-cmp'
" search
Plug 'BurntSushi/ripgrep', { 'do': 'brew install ripgrep' }
Plug 'sharkdp/fd'
Plug 'nvim-telescope/telescope-fzf-native.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
" indentation lines
Plug 'lukas-reineke/indent-blankline.nvim'
" treesiter, install package for language afterwords
Plug 'nvim-treesitter/nvim-treesitter'
" Day/night theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
" bottom line
Plug 'nvim-lualine/lualine.nvim'
Plug 'ryanoasis/vim-devicons'
" tabs
Plug 'alvarosevilla95/luatab.nvim'
Plug 'simrat39/symbols-outline.nvim'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" context
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'kshenoy/vim-signature'
" zooming
Plug 'troydm/zoomwintab.vim'
" AI
Plug 'Exafunction/codeium.vim'
" class and methods folding/listing
Plug 'stevearc/aerial.nvim'
" More icons?
Plug 'nvim-tree/nvim-web-devicons'
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'rafamadriz/friendly-snippets'

call plug#end()

if !exists('g:vscode')
  autocmd ColorScheme janah highlight Normal ctermbg=235
  colorscheme tokyonight
  let g:tokyonight_style = "storm"
endif

" custom functions
function! g:ToggleNuMode()
  if &relativenumber == 1
     set norelativenumber
  else
     set relativenumber
  endif
endfunction
nnoremap <silent><C-b> :call g:ToggleNuMode()<cr>

if !exists('g:vscode')
  lua require('jose.init')
endif
