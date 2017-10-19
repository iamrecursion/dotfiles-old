" Vim-Plug Plugin Configuration
let g:plug_shallow=0

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'shougo/unite.vim'
Plug 'vim-scripts/a.vim'
Plug 'raimondi/delimitmate'
Plug 'mrtazz/doxygentoolkit.vim'
Plug 'mbbill/undotree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'alvan/vim-closetag'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/git-log'
Plug 'terryma/vim-multiple-cursors'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/vim-task-org'
Plug 'jceb/vim-orgmode'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'
"Plug 'vim-scripts/YankRing.vim'
Plug 'eagletmt/ghcmod-vim'
Plug 'b4winckler/vim-angry'
Plug 'eagletmt/neco-ghc'
Plug 'vimwiki/vimwiki'

function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.py --clang-completer --system-libclang --system-boost --all
    endif
endfunction

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --system-libclang --system-boost --all' }
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/syntastic'
Plug 'rust-lang/rust.vim'
Plug 'kballard/vim-swift'
Plug 'terryma/vim-expand-region'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'https://github.com/octol/vim-cpp-enhanced-highlight'
Plug 'KabbAmine/zeavim.vim', {'on': [
            \   'Zeavim', 'Docset',
            \   '<Plug>Zeavim',
            \   '<Plug>ZVVisSelection',
            \   '<Plug>ZVKeyDocset',
            \   '<Plug>ZVMotion'
            \ ]}
Plug 'bagrat/vim-workspace'
Plug 'ryanoasis/vim-devicons' "needs nerd-fonts-complete (inconsolataGo NerdFont)

call plug#end()

" Helper Functions for Vim-Plug

" KEYBIND NOTES
" <F2> = Paste Mode Toggle
" <F3> = Toggle header/source
" <F4> = NERDTree Toggle
" <F5> = Undotree Toggle
" <F6> = Tagbar Toggle
" <F7> = Show YankRing
" <F8> = View Task List
" Remember that cs.. (surround commands) do not use leader
" Remember that commenting commands DO use leader
" Bufexplorer open by <leader>bv
" Ctrl+] = goto def, Ctrl+T = back from def, Alt+] = Goto def in vsp
" :YcmGenerateConfig to generate YCM configuration for the current directory

" YCM Completion Configuration
let g:ycm_global_ycm_extra_conf='~/.dotfiles/.ycm_extra_conf.py'
let g:ycm_server_log_level = 'debug'
let g:ycm_server_keep_logfiles = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tag_files = 1
let g:ycm_server_use_vim_stdout = 0
let g:ycm_confirm_extra_conf = 0
let g:ycm_goto_buffer_command = 'horizontal-split'
let g:ycm_filetype_whitelist = { '*':1 }
let g:ycm_key_invoke_completion = '<C-Space>'
let g:ycm_semantic_triggers = {'haskell' : ['.']}
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_error_symbol = '❯'
let g:ycm_warning_symbol = '⚠'
let g:ycm_register_as_syntastic_checker = 1
let g:ycm_show_diagnostics_ui = 1
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1
let g:ycm_open_loclist_on_ycm_diags = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_disable_for_files_larger_than_kb = 2000
let g:ycm_auto_start_csharp_server = 1
let g:ycm_auto_stop_csharp_server = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_max_diagnostics_to_display = 50
let g:ycm_key_detailed_diagnostics = '<leader>d'

" YCM Commands
nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>
nnoremap <F12> :YcmDiags <CR>
nnoremap <leader>cdd :YcmShowDetailedDiagnostic <CR>

" YCM Completer Commands
nnoremap <leader>cf :YcmCompleter FixIt <CR>
nnoremap <leader>cg :YcmCompleter GoTo <CR>
nnoremap <leader>ci :YcmCompleter GoToImprecise <CR>
nnoremap <leader>ct :YcmCompleter GetType <CR>
nnoremap <leader>cd :YcmCompleter GetDoc <CR>

set pumheight=10

" Split Control
set splitright
set splitbelow

" Vim Expand Region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Paste Improvements
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Folding Configuration
set foldmethod=manual
nnoremap <silent> <Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
vnoremap <Space> zf

" Diff Configuration
if &diff
    " diff mode
    set diffopt+=iwhite
endif

" Conque Configuration
let g:ConqueTerm_StartMessages = 0

" Vim Tmux Navigator
let g:tmux_navigator_save_on_switch = 1
let g:tmux_nagigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft <CR>
nnoremap <silent> <C-l> :TmuxNavigateRight <CR>
nnoremap <silent> <C-j> :TmuxNavigateDown <CR>
nnoremap <silent> <C-k> :TmuxNavigateUp <CR>
nnoremap <silent> <C-\> :TmuxNavigatePrevious <CR>

" CPP Utilities
nnoremap :findalt :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" Leader Configuration
let mapleader=","
set timeout timeoutlen=1500

" Vim-Task Configuration
nnoremap <F8> :Vt<CR><CR>
let g:vtoAuthorName='Ara Adkins'
let g:vtoTokenList = [":BUG:", ":FIXME:", ":TODO:", ":TRICKY:", ":WARNING:", "TODO", "FIXME", "BUG", "TRICKY", "WARNING", "BUG:", "FIXME:", "TODO:", "TRICKY:", "WARNING:"]

" Listings Configuration
nnoremap <F9> :set list!<CR>
set listchars=eol:¬,trail:·,tab:»·,precedes:«,extends:»

" Spellchecking Configuration
set spell spelllang=en_gb

" unite.vim Configuration
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr> Unite.vim Configuration

call unite#custom#source('file,file/new,buffer,file_rec,line', 'matchers', 'matcher_fuzzy')

nnoremap <leader>/ :<C-u>Unite -buffer-name=search -start-insert line<CR>

" Custom control for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    imap <buffer> <C-j> <Plug>(unite_select_next_line)
    imap <buffer> <C-k> <Plug>(unite_select_previous_line)
endfunction

" YankRing Configuration
nnoremap <F7> :YRShow <CR>

" Ctags Configuration
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Fugitive Configuration
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

" a.vim Configuraiton
nnoremap <F3> :A<CR>

" Misc Autocmds
"au BufWritePre * :call <SID>StripTrailingWhitespaces()

" General Configuration
filetype plugin indent on
set nocompatible

" NERDTree Configuration
let g:NERDTreeDirArrows=1
"let g:nerdtree_tabs_open_on_console_startup=1
nnoremap <F4> :NERDTreeToggle<CR>

" NERD Commenter Configuration
command! -range Vis call setpos('.', [0,<line1>,0,0]) |
                    \ exe "normal V" |
                    \ call setpos('.', [0,<line2>,0,0])

" Omnicomplete Configuration
function! InsertTabWrapper()
  if pumvisible()
    return "\<c-n>"
  endif
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-x>\<c-o>"
  endif
endfunction
inoremap <expr><tab> InsertTabWrapper()
inoremap <expr><s-tab> pumvisible()?"\<c-p>":"\<c-d>"

" Gitgutter Configuration
let g:gitgutter_max_signs = 5000

" Tagbar Configuration
nnoremap <F6> :TagbarToggle<CR>
let g:tagbar_show_visibility = 1
let g:tagbar_show_linenumbers = 1
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_autoshowtag = 1

"Matchit Configuration
runtime macros/matchit.vim
let b:match_ignorecase=1

" Paste Options
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode

" DelimitMate Configuration
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1

" Closetag Configuration
let g:closetag_filenames="*.html,*.xml,*.xsd,*.xhtml,*.phtml,*.cfg"

" Undotree Configuration
nnoremap <F5> :UndotreeToggle<cr>
let g:undotree_WindowLayout=3
let g:undotree_DiffpanelHeight=15

" Undo Configuration
if has("persistent_undo")
    set undodir='~/.undodir/'
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

"Airline Configuration
set laststatus=2
" badwolf, solarized, molokai are all nice
let g:airline_theme='molokai'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extentions#tabline#fnamemod=":t"

" Buffer Navigation Configuration
nmap <leader>bn :enew<CR>
nmap <leader>bq :bp <BAR> bd #<CR>
nmap <leader>bj :bnext<CR>
nmap <leader>bk :bprevious<CR>
nmap <leader>bl :ls<CR>

" Uncomment below to make screen not flash on error
set vb t_vb=""

" Tabs and spacing
set ai
set sw=4
imap <S-Tab> <BS>
set et
set tabstop=4
set softtabstop=4
set expandtab
set term=xterm
set autoindent
set smartindent
set scrolloff=10

" Highlighting configuration
command H let @/=""

" Command Aliases
nmap <space> zz
nmap n nzz
nmap N Nzz

" Command Line Completion Setup
set wildmode=longest,list,full
set wildmenu

" Title Configuration
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:p:h\")})%)%(\ %a%)\ -\ %{v:servername}

" Tab Navigation
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<CR>
nnoremap tm  :tabm<Space>
nnoremap tq  :tabclose<CR>

" Colour Schemes for Vim
set t_Co=16
syntax enable
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

let &colorcolumn=join([81,101],",")
highlight colorcolumn ctermbg=0

" Enable Tags
set tags+=${HOME}/etc/tags

" Terminal Fixes
set backspace=indent,eol,start " Another backspace fix

" Terminfo Fixes
" TERMINFO FIX
if has("terminfo")
    set t_Sf=ESC[3%p1%dm
    set t_Sb=ESC[4%p1%dm
else
    set t_Sf=ESC[3%dm
    set t_Sb=ESC[4%dm
endif

" UI Config
set number
set ruler
set lazyredraw
set ttyfast

" Set cursorline
set showcmd
set visualbell
filetype indent on
set wildmenu

" Search configuration
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>

" Session Options
set ssop-=options

" Implement Smart Home
noremap <expr> <silent> <Home> col('.') == match(getline('.'),'\S')+1 ? '0' : '^'
imap <silent> <Home> <C-O><Home>

" Whitepsace Control
nnoremap <F10> :call <SID>StripTrailingWhitespaces()<CR>

function! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" Smart Maximize and Minimize
nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
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

" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

" Function to fix VM swapfile issues
function! FixSwap()
    set noswapfile
    set swapfile
endfunction

command FixSwap call FixSwap()

" Sequential Search and Replace
vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
    \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
omap s :normal vs<CR>

" Makefile Specific Options
autocmd FileType make set noexpandtab shiftwidth=4 softtabstop=0

" ASM Specific Options
autocmd FileType asm set noexpandtab shiftwidth=8 softtabstop=0 syntax=nasm

" Options for Vim-Workspace
"let g:workspace_powerline_separators = 1
"let g:workspace_tab_icon = "\uf00a"
"let g:workspace_left_trunc_icon = "\uf0a8"
"let g:workspace_right_trunc_icon = "\uf0a9"

