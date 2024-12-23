"reaload vim automatically when vimrc has changed
au BufWritePost .vimrc so $MYVIMRC

let g:ruby_path = system('echo $HOME/.rbenv/shims')
let g:lisp_rainbow = 1

let mapleader = "\\"

"nmap <silent> <leader>q :call neoterm#test#run('current')<CR>

let g:session_autosave = 'yes'

let g:neoterm_keep_term_open = 0
let g:neoterm_size = '10'

"let g:choosewin_overlay_enable = 0

" Supertab config for snippets
" not sure what this does, consider deleting
"let g:SuperTabDefaultCompletionType    = '<C-d>'
"let g:SuperTabCrMapping                = 0

" scroll from top to bottom
" let g:SuperTabDefaultCompletionType = "<c-n>"
" Supertab config for snippets
let g:UltiSnipsExpandTrigger="<C-d>"
let g:UltiSnipsJumpForwardTrigger="<C-d>"
"not really using this, but should
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" deoplete
"let g:deoplete#enable_at_startup = 1
"inoremap <expr><C-t>  pumvisible() ? "\<CR>" : "\<C-t>"

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

"nmap <silent> <leader>q :call neoterm#test#run('current')<CR>
"nmap <silent> <leader>R :call neoterm#test#run('file')<CR>
"nmap <silent> <leader>a :call neoterm#test#run('all')<CR>
"nmap <silent> <leader>l :call neoterm#close_all()<CR>

nmap <silent> <leader>q :TestNearest<CR>
nmap <silent> <leader>R :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
"nmap <silent> <leader>g :TestVisit<CR>

"codeium
let g:codeium_disable_bindings = 1
imap <script><silent><nowait><expr> <C-t> codeium#Accept()

imap <C-e>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-r>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-x>   <Cmd>call codeium#Clear()<CR>

command! Day :call DayTheme()
command! Night :call NightTheme()
command! Storm :call StormTheme()
command! -nargs=1 Ts :lua require('telescope.builtin').live_grep({default_text = <q-args>})

tnoremap <Esc> <c-\><c-n>
vnoremap <leader>gg y:Ts <c-r>"<cr>
vnoremap <leader>rr y:Ts def <c-r>"<cr>
"

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

if executable("ag")
  let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

set nocompatible              " be iMproved, required
filetype off                  " required
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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-fugitive'
Plug 'majutsushi/tagbar'
Plug 'lewis6991/gitsigns.nvim'
Plug 'rking/ag.vim'
"Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'kassio/neoterm'
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
Plug 'Shougo/unite.vim'
Plug 'dense-analysis/ale'
Plug 'mhinz/vim-hugefile'
Plug 'janko-m/vim-test'
" livecoding
Plug 'merongivian/vim-tidal'
Plug 'rlue/vim-fold-rspec'
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
" this package needs pynvim in order to work, but can not be installed through
" brew. This forces installation via pip3, perhaps using this is a terrible
" idea
" pip3 install 'pynvim @ git+https://github.com/neovim/pynvim' --break-system-packages
" comments on the issue: https://github.com/orgs/Homebrew/discussions/3404#discussioncomment-8738672
" blog: https://peterbabic.dev/blog/install-pynvim-via-homebrew/
Plug 'quangnguyen30192/cmp-nvim-ultisnips'
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
Plug 'kyazdani42/nvim-web-devicons'
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
" Popups and fancy command line
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'rcarriga/nvim-notify'
" class and methods folding/listing
Plug 'stevearc/aerial.nvim'

call plug#end()

autocmd ColorScheme janah highlight Normal ctermbg=235
colorscheme tokyonight
let g:tokyonight_style = "storm"
" custom functions

function! DayTheme()
  " hacky way to reload scheme so i can change the theme if already set
  " with tokyonight
  colorscheme jellybeans

  let g:tokyonight_style = "day"
  let g:tokyonight_italic_functions = 1
  let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

  colorscheme tokyonight
endfunction

function! NightTheme()
  " hacky way to reload scheme so i can change the theme if already set
  " with tokyonight
  colorscheme jellybeans

  let g:tokyonight_style = "night"
  let g:tokyonight_italic_functions = 1
  let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

  colorscheme tokyonight
endfunction

function! StormTheme()
  " hacky way to reload scheme so i can change the theme if already set
  " with tokyonight
  colorscheme jellybeans

  let g:tokyonight_style = "storm"
  let g:tokyonight_italic_functions = 1
  let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

  colorscheme tokyonight
endfunction

function! g:ToggleNuMode()
  if &relativenumber == 1
     set norelativenumber
  else
     set relativenumber
  endif
endfunction
nnoremap <silent><C-b> :call g:ToggleNuMode()<cr>

" -----------------------
" -----------------------
" lua setup
" -----------------------
" -----------------------

lua << EOF
-- ----------
-- ----------
-- LSP with tab completion integrated with ultisnips
local cmp = require("cmp")
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  sources = {
    { name = "ultisnips" },
    { name = 'nvim_lsp' },
    { name = 'treesitter' },
    { name = 'buffer',
        option = {
          get_bufnrs = function()
            return vim.api.nvim_list_bufs()
          end
        }
      },
    -- more sources
  },
  -- Configure for <TAB> people
  -- - <TAB> and <S-TAB>: cycle forward and backward through autocompletion items
  -- - <TAB> and <S-TAB>: cycle forward and backward through snippets tabstops and placeholders
  -- - <TAB> to expand snippet when no completion item selected (you don't need to select the snippet from completion item to expand)
  -- - <C-space> to expand the selected snippet from completion menu
  mapping = {
    ["<C-Space>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        if vim.fn["UltiSnips#CanExpandSnippet"]() == 1 then
          return vim.fn.feedkeys(t("<C-R>=UltiSnips#ExpandSnippet()<CR>"))
        end

        cmp.select_next_item()
      elseif check_back_space() then
        vim.fn.feedkeys(t("<cr>"), "n")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif check_back_space() then
        vim.fn.feedkeys(t("<tab>"), "n")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
        return vim.fn.feedkeys(t("<C-R>=UltiSnips#JumpBackwards()<CR>"))
      elseif cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
})

require'lspconfig'.solargraph.setup {
  capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
}
require'lspconfig'.denols.setup{}
-- ----------
-- ----------
-- init gitsigns

require('gitsigns').setup()
-- ----------
-- ----------
-- init indent blankline

vim.opt.list = true

local highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
}
local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup { scope = { highlight = highlight } }

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
-- ----------
-- ----------
-- init lualine

-- stolen from: https://github.com/hoob3rt/lualine.nvim/issues/335
-- makes more clear that buffer has not being saved
local sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = {{function()
      local bg = '#228b22' -- not modified
      if vim.bo.modified then bg = '#ff4499' -- unsaved
      elseif not vim.bo.modifiable then bg = '#a70089' end -- readonly
      vim.cmd('hi! lualine_filename_status guibg='..bg)
      return '%t %m'
    end,
    color = 'lualine_filename_status',
    }}
    ,
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress'},
    lualine_z = { 'location'}
    }

require('lualine').setup({
    options = { theme = 'tokyonight' },
    sections = vim.deepcopy(sections),
    inactive_sections = vim.deepcopy(sections),

})

require'nvim-tree'.setup()

require('luatab').setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "javascript", "ruby" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["ac"] = "@call.outer",
        ["ic"] = "@call.inner",
      },
    },
  },
}

require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'module',
            'class',
            'function',
            'method',
            'block',
            -- 'for', -- These won't appear in the context
            -- 'while',
            -- 'if',
            -- 'switch',
            -- 'case',
        },
        -- Example for a specific filetype.
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        --   rust = {
        --       'impl_item',
        --   },
    },
  }

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
  messages = {
    enabled = false
  }
})

require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    -- vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    -- vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<C-W>a", "<cmd>AerialToggle!<CR>")
EOF
