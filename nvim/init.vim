
" Vim-Plug configuration =====================================================

let plug_shallow=0

function! CondPlugin(cond, ...)
    " Allows for conditional use of plugins
    " e.g. Plug 'benekastah/neomake', Cond(has('nvim'), { 'on': 'Neomake' })
    let opts = get(a:000, 0, {})
    return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/.local/share/nvim/plugged')

" These plugins require: Python 3, Ruby, and Node.js providers for Neovim

Plug 'alvan/vim-closetag'
Plug 'cespare/vim-toml'
Plug 'christoomey/vim-sort-motion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'derekwyatt/vim-scala'
Plug 'easymotion/vim-easymotion'
Plug 'edwinb/idris2-vim'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'haya14busa/incsearch.vim'
Plug 'idanarye/vim-vebugger'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-plug'
Plug 'kassio/neoterm'
Plug 'kustosz/vim-enso-syntax'
Plug 'lervag/vimtex'
Plug 'lifepillar/vim-solarized8'
Plug 'LnL7/vim-nix'
Plug 'mbbill/undotree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovimhaskell/haskell-vim', {'for': 'haskell'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'octol/vim-cpp-enhanced-highlight', {'for': 'cpp'}
Plug 'Olical/vim-enmasse'
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'preservim/nerdcommenter'
Plug 'sheerun/vim-polyglot'
Plug 'terryma/vim-expand-region'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/AdvancedSorters'
Plug 'vim-scripts/vim-task-org'
Plug 'yaroot/vissort'

" Non-Alphabetical as Load-Order Dependent
Plug 'ryanoasis/vim-devicons'

call plug#end()

" BASIC EDITOR CONFIGURATION =================================================

" Basic Nvim Configuration
filetype plugin indent on
imap <S-Tab> <BS>
set autoindent
set expandtab
set number
set pumheight=10
set ruler
set scrollback=1000
set scrolloff=10
set smartindent
set softtabstop=4
set sw=4
set tabstop=4
set wrap
set hidden

" Shorter update time provides a noticeably better user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Enable the sign column always to prevent flickering.
" Can be set as `signcolumn=number` after nvim 0.5.0.
set signcolumn=yes

" Colour Schemes for Vim
set termguicolors
set background=dark
colorscheme solarized8
let g:solarized_termtrans=1
let g:solarized_visibility="low"
let g:solarized_diffmode="low"
let g:solarized_statusline="low"
syntax enable

" Highlights
highlight CocErrorSign guifg=#dc322f
highlight CocWarningSign guifg=#cb4b16
highlight CocInfoSign guifg=#b58900
highlight CocHintSign guifg=#6c71c4

highlight CocHighlightText guibg=#073642 guifg=#93a1a1
highlight CocHighlightRead guibg=#073642 guifg=#93a1a1
highlight CocHighlightWrite guibg=#073642 guifg=#93a1a1

highlight ColorColumn guibg=#073642
highlight CursorLine guibg=#073642

" Rulers
let &colorcolumn=join([81,101],",")

" Splits Control
set splitbelow
set splitright

" Folding Configuration
set foldmethod=manual
nnoremap <silent> <space> @=(foldlevel('.')?'za':"\<space>")<CR>
vnoremap <space> zf

" Diff Configuration
if &diff
    " diff mode
    set diffopt+=iwhite
endif

" Improvements to Pasting
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Clipboard
set clipboard=unnamed

" Leader Configuration
let mapleader=","
set timeout timeoutlen=1000

" Listings Configuration
set list
set showbreak=↪\
set listchars=tab:\ \ ,trail:·,precedes:«,extends:»,nbsp:␣

" Spellchecking Configuration
set spell
set spelllang=en_gb

" Undo Configuration
if has("persistent_undo")
    set undofile
    set undolevels=10000

    " Allows undoing of reloading a file
    set undoreload=10000
endif

" Work with visual lines
nmap j gj
nmap k gk
nmap ^ g0
nmap $ g$

" Buffer Navigation Configuration
nmap <leader>bn :enew<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bj :bnext<CR>
nmap <leader>bk :bprevious<CR>
nmap <leader>bl :ls<CR>

" Tab Navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<CR>
nnoremap tm  :tabm<Space>
nnoremap tq  :tabclose<CR>

" Perl Support
let g:loaded_perl_provider = 0 " Disable perl

" Ruby Support
let g:loaded_ruby_provider = 0 " Disable ruby

" Python Support
set pyx=3
let g:loaded_python_provider = 0 " Disable Py2

let pyenv_root = trim(system("pyenv root")) . "/versions/neovim"

if !empty(glob(pyenv_root))
    let g:python3_host_prog = pyenv_root . "/bin/python3"
elseif has('mac')
    let intel_py_path = "/usr/local/bin/python3"
    let apple_py_path = "/opt/homebrew/bin/python3"

    if filereadable(intel_py_path)
        let g:python3_host_prog = intel_py_path
    elseif filereadable(apple_py_path)
        let g:python3_host_prog = apple_py_path
    endif
elseif has('unix')
    let g:python3_host_prog = '/usr/bin/python3'
else
    let g:python3_host_prog = 'C:\development\python\bin\python'
endif

" Search Configuration
set incsearch
set hlsearch
set ignorecase
set smartcase
set inccommand=nosplit
nmap <space> zz
command! H noh
nmap n nzz
nmap N Nzz

" Session Options
set ssop-=options

" Command Line Completion Setup
set wildmode=longest,list,full
set wildmenu

" Program Title String
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\
            \%{v:servername}

" Terminal Mode Changes
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

tnoremap <Esc> <C-\><C-n>

command! -nargs=* T split | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

" General Navigation Commands
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Help Configuration
:cnoreabbrev <expr> h getcmdtype() == ":" && getcmdline() == "h" ? "vert h" : "h"

" USEFUL FUNCTIONS ===========================================================

" Reload Vim Configuration While Editing
command! Reload :so %

" Prevent visual paste from overwriting paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Toggle Maximise state of split
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

" Whitespace Sripping
function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

nnoremap <leader><leader>ws :call <SID>StripTrailingWhitespaces() <CR>

" Visual Range Selection by Typing
command! -range Vis call setpos('.', [0,<line1>,0,0]) |
            \ exe "normal V" |
            \ call setpos('.', [0,<line2>,0,0])

" Visual Macro Application
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" FILETYPE SPECIFIC OPTIONS ==================================================

" Make
autocmd FileType typescript set expandtab shiftwidth=2 softtabstop=2

" Make
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0

" Assembly
autocmd FileType asm set noexpandtab shiftwidth=8 softtabstop=0 syntax=nasm

" JSONC
autocmd FileType json syntax match Comment +\/\/.\+$+

" Enso
autocmd FileType enso set nospell

" VIM PLUGIN CONFIGURATION ===================================================

" nvim-treesitter Configuration ==============================================

lua << EOF
require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        'bash',
        'bibtex',
        'c',
        'c_sharp',
        'clojure',
        'cmake',
        'comment',
        'commonlisp',
        'cooklang',
        'cpp',
        'css',
        'cuda',
        'dot',
        'erlang',
        'glsl',
        'go',
        'graphql',
        'haskell',
        'help',
        'hjson',
        'hocon',
        'html',
        'http',
        'java',
        'javascript',
        'jsdoc',
        'json',
        'json5',
        'jsonc',
        'julia',
        'kotlin',
        'latex',
        'llvm',
        'lua',
        'make',
        'markdown',
        'ninja',
        'nix',
        'ocaml',
        'perl',
        'python',
        'r',
        'regex',
        'rst',
        'ruby',
        'rust',
        'scala',
        'scheme',
        'swift',
        'toml',
        'typescript',
        'verilog',
        'vim',
        'yaml',
        'zig',
        },
    sync_install = false,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    incremental_selection = {
        enable = true
    },
    indent = {
        enable = false
    }
}
EOF

set foldlevel=99
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Coc.nvim Configuration =====================================================
"
" Needs Node and Yarn installed.
" Installed Language Servers (Most from AUR or Brew)
" - [CCLS](https://github.com/MaskRay/ccls/)
" - [Haskell Language Server](https://github.com/haskell/haskell-language-server)

" Plugins
lua << EOF
vim.g.coc_global_extensions = {
    'coc-calc',
    'coc-clangd',
    'coc-diagnostic',
    'coc-dictionary',
    'coc-emoji',
    'coc-explorer',
    'coc-fsharp',
    'coc-git',
    'coc-github',
    'coc-gitignore',
    'coc-highlight',
    'coc-html',
    'coc-java',
    'coc-json',
    'coc-lists',
    'coc-lua',
    'coc-marketplace',
    'coc-metals',
    'coc-omnisharp',
    'coc-powershell',
    'coc-prettier',
    'coc-pyright',
    'coc-rust-analyzer',
    'coc-solargraph',
    'coc-sql',
    'coc-svg',
    'coc-syntax',
    'coc-texlab',
    'coc-tsserver',
    'coc-vimlsp',
    'coc-vimtex',
    'coc-xml',
    'coc-yaml',
    'coc-yank',
    'coc-zig',
    'coc-toml',
    'coc-julia',
    'coc-hls',
}
EOF

" Navigation
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-y>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <CR> pumvisible() ? "\<C-e>\<CR>" : "\<CR>"

" Trigger the Suggestions Menu
inoremap <silent><expr> <c-space> coc#refresh()

" Basic Popups
nn <silent> <leader>l :CocList<CR>
nn <silent> <C-p> :CocList files<CR>
nn <silent> <C-e> :CocList buffers<CR>
nn <silent> <C-i> :CocList grep<CR>
nn <silent> <C-o> :CocList lines<CR>
nn <silent> <C-s> :CocList symbols<CR>
nn <silent> T :CocCommand explorer<CR>
nn <silent> Y :<C-u>CocList -A --normal yank<CR>
nn <silent> <C-y> :CocCommand yank.clean<CR>
" REMEMBER: Use <C-o> to enter normal mode.

" Scrolling the Popup Menu
nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

" Code Information
nmap <silent> H :call CocActionAsync('doHover')<CR>
autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

" Diagnostics Navigation
nmap <silent> g[ <Plug>(coc-diagnostic-prev)
nmap <silent> g] <Plug>(coc-diagnostic-next)

" Go-To Code Navigation
nmap <silent> gb <Plug>(coc-declaration)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gl <Plug>(coc-open-link)

" Formatting
nmap <silent> <leader>f <Plug>(coc-format)
nmap <silent> <leader>fs <Plug>(coc-format-selected)
xmap <silent> <leader>fs <Plug>(coc-format-selected)

" Refactoring
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>r <Plug>(coc-refactor)

" Code Actions
nmap <leader>a <Plug>(coc-codeaction)
nmap <leader>al <Plug>(coc-codeaction-line)
nmap <leader>as <Plug>(coc-codeaction-selected)
vmap <leader>as <Plug>(coc-codeaction-selected)
nmap <leader>cl <Plug>(coc-codelens-action)
nmap <leader>qf <Plug>(coc-fix-current)

" Text Object Navigation
xmap <leader>if <Plug>(coc-funcobj-i)
omap <leader>if <Plug>(coc-funcobj-i)
xmap <leader>af <Plug>(coc-funcobj-a)
omap <leader>af <Plug>(coc-funcobj-a)
xmap <leader>ic <Plug>(coc-classobj-i)
omap <leader>ic <Plug>(coc-classobj-i)
xmap <leader>ac <Plug>(coc-classobj-a)
omap <leader>ac <Plug>(coc-classobj-a)

" Range Selection
nmap <silent> <leader>rs <Plug>(coc-range-select)
xmap <silent> <leader>rs <Plug>(coc-range-select)

" Startup Config
let g:coc_start_at_startup = 1

" UI Config
let g:coc_status_error_sign = '❯'
let g:coc_status_warning_sign = '❯'
let g:coc_status_info_sign = '❯'
let g:coc_status_message_sign = '❯'

" Vim Tmux Navigator Configuration ===========================================
let g:tmux_navigator_save_on_switch = 2
let g:tmux_nagigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft <CR>
nnoremap <silent> <C-l> :TmuxNavigateRight <CR>
nnoremap <silent> <C-j> :TmuxNavigateDown <CR>
nnoremap <silent> <C-k> :TmuxNavigateUp <CR>
nnoremap <silent> <C-\> :TmuxNavigatePrevious <CR>

" Vim Airline Configuration ==================================================
set laststatus=2
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extentions#tabline#fnamemod=":t"

" Vim-Easymotion Configuration ===============================================
nmap s <Plug>(easymotion-s)

map  <Leader>ef <Plug>(easymotion-bd-f)
nmap <Leader>ef <Plug>(easymotion-overwin-f)

map <Leader>eL <Plug>(easymotion-bd-jk)
nmap <Leader>eL <Plug>(easymotion-overwin-line)

map  <Leader>ew <Plug>(easymotion-bd-w)
nmap <Leader>ew <Plug>(easymotion-overwin-w)

" Incsearch Configuration ====================================================
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

function! s:config_easyfuzzymotion(...) abort
return extend(copy({
\   'converters': [incsearch#config#fuzzy#converter()],
\   'modules': [incsearch#config#easymotion#module()],
\   'keymap': {"\<CR>": '<Over>(easymotion)'},
\   'is_expr': 0,
\   'is_stay': 1
\ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

map f/ <Plug>(incsearch-fuzzy-/)
map f? <Plug>(incsearch-fuzzy-?)
map fg/ <Plug>(incsearch-fuzzy-stay)

" Fugitive Configuration =====================================================
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

" Nerdcommenter Configuration ================================================
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Undotree Configuration =====================================================
nnoremap U :UndotreeToggle<CR>
nnoremap UE :earlier<CR>
nnoremap UL :later<CR>

let g:undotree_WindowLayout = 1
let g:undotree_DiffpanelHeight = 15

" Vim-Task-Org Configuration =================================================
let g:vtoAuthorName = 'Ara Adkins'
let g:vtoTokenList = [":BUG:", ":FIXME:", ":TODO:", ":TRICKY:", ":WARNING:",
            \"TODO", "FIXME", "BUG", "TRICKY", "WARNING", "BUG:", "FIXME:",
            \"TODO:", "TRICKY:", "WARNING:"]
let g:vtoDateFormat = "%y-%m-%d %T"

" Vim Expand Region Configuration ============================================
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

call expand_region#custom_text_objects({
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ })

" Haskell-Vim Configuration ==================================================
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_backpack = 1

let g:haskell_indent_disable = 1

" Neoterm Configuration ======================================================
let g:neoterm_default_mod = ':botright'

nmap gx <Plug>(neoterm-repl-send)
xmap gx <Plug>(neoterm-repl-send)
nmap gxx <Plug>(neoterm-repl-send-line)

" Vim-Devicons Configuration =================================================
let g:webdevicons_enable = 1

let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

" Vebugger Configuration =====================================================
let g:vebugger_leader='<leader>D'

" Projectionist Configuration ================================================
autocmd User ProjectionistActivate :Pcd

" Vim-Markdown Configuration =================================================
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_strikethrough = 1

au FileType markdown set conceallevel=0

" Vissort Configuration ======================================================
let g:vissort_option="i"

" Vim-Scala Configuration ====================================================
let g:scala_scaladoc_indent = 1
au BufRead,BufNewFile *.sbt set filetype=scala

" Vimtex Configuration =======================================================
let g:vimtex_compiler_progname = 'nvr'
let g:tex_flavor = 'latex'

