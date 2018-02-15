" Vim-Plug configuration
let g:plug_shallow=0

call plug#begin('~/.local/share/nvim/plugged')

Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" BASIC EDITOR CONFIGURATION ==================================================

" Basic Nvim Configuration
filetype plugin indent on
set number
set ruler
set pumheight=10
set ai
set sw=4
imap <S-Tab> <BS>
set et
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set scrolloff=10
set nowrap

" Colour Schemes for Vim
set t_Co=16
syntax enable
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

" Splits Control
set splitright
set splitbelow

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
vnoremap <silent> p p']
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" Leader Configuration
let mapleader=","
set timeout timeoutlen=1500

" Listings Configuration
nnoremap <F9> :set list!<CR>
set listchars=eol:¬,trail:·,tab:»·,precedes:«,extends:»

" Spellchecking Configuration
set spell spelllang=en_gb

" Undo Configuration
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

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

" Rulers
let &colorcolumn=join([81,101],",")
highlight colorcolumn ctermbg=0

" Python Support
let g:loaded_python_provider = 1

" Ruby Support
let g:loaded_ruby_provider = 1

" Search Configuration
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
command H let @/=""
nmap <space> zz
nmap n nzz
nmap N Nzz

" Session Options
set ssop-=options

" Command Line Completion Setup
set wildmode=longest,list,full
set wildmenu

" Program Title String
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}

" USEFUL FUNCTIONS ============================================================

" Fixing swapfile issues in VMs with slow memory updates
function! FixSwap()
    set noswapfile
    set swapfile
endfunction

command FixSwap call FixSwap()

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

let blacklist = ['markdown', 'ruby', 'perl', 'javascript']

autocmd BufWritePre * if index(blacklist, &ft) < 0 | :call <SID>StripTrailingWhitespaces()

" FILETYPE SPECIFIC OPTIONS ===================================================

" Make
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0

" Assembly
autocmd FileType asm set noexpandtab shiftwidth=8 softtabstop=0 syntax=nasm

" VIM PLUGIN CONFIGURATION ====================================================

" Vim Tmux Navigator
let g:tmux_navigator_save_on_switch = 1
let g:tmux_nagigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft <CR>
nnoremap <silent> <C-l> :TmuxNavigateRight <CR>
nnoremap <silent> <C-j> :TmuxNavigateDown <CR>
nnoremap <silent> <C-k> :TmuxNavigateUp <CR>
nnoremap <silent> <C-\> :TmuxNavigatePrevious <CR>

" Vim Airline Configuration
set laststatus=2
" badwolf, solarized, molokai are all nice
let g:airline_theme='molokai'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extentions#tabline#fnamemod=":t"

" Vim-Easymotion Configuration
nmap s <Plug>(easymotion-s)

" Incsearch Configuration
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

