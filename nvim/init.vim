" Vim-Plug configuration
let g:plug_shallow=0

" Setup Commands
function! BuildYCM(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
        !./install.py
    endif
endfunction

call plug#begin('~/.local/share/nvim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'alvan/vim-closetag'
Plug 'alx741/vim-hindent', { 'do': 'stack install hindent', 'for': 'haskell' }
Plug 'alx741/vim-stylishask', { 'do': 'stack install stylish-haskell',
            \'for': 'haskell'}
" Plug 'BurningEther/nvimux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dan-t/vim-hsimport', { 'do': 'stack install hsimport', 'for': 'haskell'}
Plug 'eagletmt/ghcmod-vim', { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc', { 'do': 'stack install ghc-mod', 'for': 'haskell' }
Plug 'easymotion/vim-easymotion'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'idris-hackers/idris-vim', { 'for': 'idris' }
Plug 'jceb/vim-orgmode'
Plug 'jiangmiao/auto-pairs'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kassio/neoterm'
Plug 'mbbill/undotree'
Plug 'mhinz/neovim-remote', { 'do': 'pip3 install --user neovim-remote' }
Plug 'mpickering/hlint-refactor-vim', { 'do': 'stack install hlint',
            \'for': 'haskell'}
Plug 'neomake/neomake'
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'octol/vim-cpp-enhanced-highlight', { 'for': 'cpp' }
Plug 'parsonsmatt/intero-neovim',
            \{ 'do': 'stack build intero; stack install hdevtools',
            \'for': 'haskell' }
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-surround'
Plug 'valloric/YouCompleteMe', { 'do': function('BuildYCM') }
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'vim-scripts/vim-task-org'

" Non-Alphabetical as Load-Order Dependent
Plug 'ryanoasis/vim-devicons'

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
set tabstop=4
set softtabstop=4
set expandtab
set autoindent
set smartindent
set scrolloff=10
set wrap
set cursorline
set cursorcolumn

" Colour Schemes for Vim
 set t_Co=16
 syntax enable
 set background=dark
 let g:solarized_termtrans=1
 colorscheme solarized

" Font
if has('unix')
    set guifont=InconsolataGo\ Nerd\ Font\ Mono\ 12
else
    set guifont=InconsolataGo_Nerd_Font_Mono:h12
endif

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

" Clipboard
set clipboard=unnamed

" Leader Configuration
let mapleader=","
set timeout timeoutlen=1000

" Listings Configuration
nnoremap <F9> :set list!<CR>
set listchars=eol:¬,trail:·,tab:»·,precedes:«,extends:»

" Spellchecking Configuration
set spell spelllang=en_gb

" Undo Configuration
if has("persistent_undo")
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
let g:python3_host_prog = '/usr/bin/python'

" Search Configuration
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
command! H let @/=""
nmap <space> zz
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

" USEFUL FUNCTIONS ============================================================

" Fixing swapfile issues in VMs with slow memory updates
function! FixSwap()
    set noswapfile
    set swapfile
endfunction

command! FixSwap call FixSwap()

" Reload Vim Configuration
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

let blacklist = ['markdown', 'ruby', 'perl', 'javascript']

autocmd BufWritePre * if index(blacklist, &ft) < 0 |
            \:call <SID>StripTrailingWhitespaces()

" Visual Range Selection by Typing
command! -range Vis call setpos('.', [0,<line1>,0,0]) |
            \ exe "normal V" |
            \ call setpos('.', [0,<line2>,0,0])

command! Ses :source Session.vim

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

" Intero Neovim Configuration
let g:intero_type_on_hover = 1
set updatetime=1000

augroup InteroMaps
    au!

    " Process Management
    au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
    au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

    " Open intero/GHCi split horizontally
    au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>

    " Open intero/GHCi split vertically
    au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
    au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

    " Automatically reload on save
    au BufWritePost *.hs InteroReload

    " Load individual modules
    au FileType haskell nnoremap <silent> <leader>il
                \:InteroLoadCurrentModule<CR>
    au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

    " Type-related information
    " Heads up! These next two differ from the rest.
    au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
    au FileType haskell map <silent> <leader>T <Plug>InteroType
    au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>
    au FileType haskell nnoremap <silent> <leader>ii :InteroInfo<CR>

    " Navigation
    au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>
    au FileType haskell nnoremap <silent> <leader>ie :InteroEval<CR>

    " Managing targets
    " Prompts you to enter targets (no silent):
    au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END

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

" Gitgutter Configuration
let g:gitgitter_max_signs = 5000

" Nerdcommenter Configuration
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1

" Nerdtree Configuration
nnoremap <leader>t :NERDTreeToggle<CR>

" Nerdtree Tabs Configuration
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_meaningful_tab_names = 1
let g:nerdtree_tabs_autoclose = 1
let g:nerdtree_tabs_synchronize_view = 1
let g:nerdtree_tabs_startup_cd = 1

" Undotree Configuration
nnoremap U :UndotreeToggle<CR>
nnoremap UE :earlier<CR>
nnoremap UL :later<CR>

let g:undotree_WindowLayout = 1
let g:undotree_DiffpanelHeight = 15

" Closetag Configuration
let g:closetag_filenames="*.html,*.xml,*.xsd,*.xhtml,*.phtml,*.cfg"

" Multiple Cursors Configuration
let g:multi_cursor_exit_from_visual_mode = 0
let g:multi_cursor_exit_from_insert_mode = 1

function! Multiple_cursors_before()
  if exists(':NeoCompleteLock')==2
    exe 'NeoCompleteLock'
  endif
endfunction

function! Multiple_cursors_after()
  if exists(':NeoCompleteUnlock')==2
    exe 'NeoCompleteUnlock'
  endif
endfunction

" Vim-Task-Org Configuration
let g:vtoAuthorName = 'Ara Adkins'
let g:vtoTokenList = [":BUG:", ":FIXME:", ":TODO:", ":TRICKY:", ":WARNING:",
            \"TODO", "FIXME", "BUG", "TRICKY", "WARNING", "BUG:", "FIXME:",
            \"TODO:", "TRICKY:", "WARNING:"]
let g:vtoDateFormat = "%y-%m-%d %T"

" Vim Expand Region Configuration
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

call expand_region#custom_text_objects({
      \ 'a]' :1,
      \ 'ab' :1,
      \ 'aB' :1,
      \ })

" YouCompleteMe Configuration
let g:ycm_global_ycm_extra_conf='~/.dotfiles/tool_config/.ycm_extra_conf.py'
let g:ycm_server_log_level = 'debug'
let g:ycm_server_keep_logfiles = 0
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tag_files = 0
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
let g:ycm_disable_for_files_larger_than_kb = 3000
let g:ycm_auto_start_csharp_server = 1
let g:ycm_auto_stop_csharp_server = 1
let g:ycm_add_preview_to_completeopt = 1
let g:ycm_max_diagnostics_to_display = 50
let g:ycm_key_detailed_diagnostics = '<leader>d'
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_use_utilsnips_completer = 0

nnoremap <leader>ycc :YcmForceCompileAndDiagnostics<CR>
nnoremap <leader>ycd :YcmDiags<CR>

nnoremap <leader>ycf :YcmCompleter FixIt<CR>
nnoremap <leader>ycg :YcmCompleter GoTo<CR>
nnoremap <leader>yct :YcmCompleter GetType<CR>
nnoremap <leader>yci :YcmCompleter GetDoc<CR>

" Neco-GHC Configuration
let g:necoghc_use_stack = 0
let g:necoghc_enable_detailed_browse = 1

" Haskell-Vim Configuration
let g:haskell_enable_quantification = 1
let g:haskell_enable_recursivedo = 1
let g:haskell_enable_arrowsyntax = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_static_pointers = 1
let g:haskell_backpack = 1

let g:haskell_indent_if = 4
let g:haskell_indent_case = 4
let g:haskell_indent_let = 4
let g:haskell_indent_where = 4
let g:haskell_indent_before_where = 0
let g:haskell_indent_after_bare_where = 4
let g:haskell_indent_do = 4
let g:haskell_indent_in = 0
let g:haskell_indent_guard = 2
let g:cabal_indent_section = 2

" Denite.vim Configuration
augroup deniteresize
  autocmd!
  autocmd VimResized,VimEnter * call denite#custom#option('default',
        \{'winheight': winheight(0) / 3})
augroup end

call denite#custom#option('default', {'winheight': winheight(0)/4})

call denite#custom#option('default', {
            \ 'prompt': '❯'
            \ })

call denite#custom#map(
            \'insert',
            \'<Esc>',
            \'<denite:enter_mode:normal>',
            \'noremap'
            \)
call denite#custom#map(
            \'normal',
            \'<Esc>',
            \'<NOP>',
            \'noremap'
            \)
call denite#custom#map(
            \'insert',
            \'<C-v>',
            \'<denite:do_action:vsplit>',
            \'noremap'
            \)
call denite#custom#map(
            \'normal',
            \'<C-v>',
            \'<denite:do_action:vsplit>',
            \'noremap'
            \)
call denite#custom#map(
            \'normal',
            \'dw',
            \'<denite:delete_word_after_caret>',
            \'noremap'
            \)
call denite#custom#map(
            \ 'insert',
            \ '<C-j>',
            \ '<denite:move_to_next_line>',
            \ 'noremap'
            \)
call denite#custom#map(
            \ 'insert',
            \ '<C-k>',
            \ '<denite:move_to_previous_line>',
            \ 'noremap'
            \)

call denite#custom#var('file_rec', 'command',
            \ ['rg', '--files', '--glob', '!.git', '.'])
call denite#custom#var('grep', 'command', ['rg'])
call denite#custom#var('grep', 'default_opts',
            \ ['--hidden', '--vimgrep', '--no-heading', '-S'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

nnoremap <leader>e :Denite buffer<CR>
nnoremap <C-p> :Denite file_rec <CR>
nnoremap <C-o> :Denite buffer line register<CR>

" Neomake Configuration
call neomake#configure#automake('w')

" Vim-Hindent Configuration
let g:hindent_on_save = 0
au FileType haskell nnoremap <silent> <leader>hi :Hindent<CR>

" Vim-Stylish Configuration
let g:stylishask_on_save = 0
au FileType haskell nnoremap <silent> <leader>hs :Stylishask<CR>

" GHCMod Vim Configuration
au FileType haskell nmap <leader>hc :GhcModSplitFunCase<CR>
au FileType haskell nmap <leader>hg :GhcModSigCodegen<CR>

" Hlint-Refactor Configuration
let g:hlintRefactor#disableDefaultKeybindings = 1

au FileType haskell nmap <leader>lo :call ApplyOneSuggestion()<CR>
au FileType haskell nmap <leader>la :call ApplyAllSuggestions()<CR>

" Idris Configuration
let g:idris_indent_if = 4
let g:idris_indent_case = 4
let g:idris_indent_let = 4
let g:idris_indent_where = 4
let g:idris_indent_do = 4
let g:idris_indent_rewrite = 8

augroup IdrisMaps
    au!

    " Management
    au FileType idris nnoremap <silent> <leader>id :call
                \IdrisShowDoc()<CR>
    au FileType idris nnoremap <silent> <leader>ii :call IdrisResponseWin()<CR>
    au FileType idris nnoremap <silent> <leader>ir :call IdrisReload()<CR>
    " Interactive Editing
    au FileType idris nnoremap <silent> <leader>it :call IdrisShowType()<CR>
    au FileType idris nnoremap <silent> <leader>is :call IdrisCaseSplit()<CR>
    au FileType idris nnoremap <silent> <leader>ic :call IdrisAddClause(0)<CR>
    au FileType idris nnoremap <silent> <leader>im :call IdrisAddMissing()<CR>
    au FileType idris nnoremap <silent> <leader>if :call IdrisRefine()<CR>
    au FileType idris nnoremap <silent> <leader>ip :call IdrisProofSearch(1)<CR>
    au FileType idris nnoremap <silent> <leader>il :call IdrisMakeLemma()<CR>
    au FileType idris nnoremap <silent> <leader>ie :call IdrisEval()<CR>
    au FileType idris nnoremap <silent> <leader>iw 0:call IdrisMakeWith()<CR>
    au FileType idris nnoremap <silent> <leader>imc :call IdrisMakeCase()<CR>

augroup END

" Neoterm Configuration
let g:neoterm_position = 'horizontal'

nmap gx <Plug>(neoterm-repl-send)
xmap gx <Plug>(neoterm-repl-send)
nmap gxx <Plug>(neoterm-repl-send-line)

" Nvimux Configuration
" lua << EOF
" local nvimux = require('nvimux')
"
" -- Nvimux configuration
" nvimux.config.set_all{
  " prefix = '<C-a>',
  " open_term_by_default = true,
  " new_window_buffer = 'single',
  " quickterm_direction = 'botright',
  " quickterm_orientation = 'vertical',
  " -- Use 'g' for global quickterm
  " quickterm_scope = 't',
  " quickterm_size = '80',
" }
"
" -- Nvimux custom bindings
" nvimux.bindings.bind_all{
  " {'s', ':NvimuxHorizontalSplit', {'n', 'v', 'i', 't'}},
  " {'v', ':NvimuxVerticalSplit', {'n', 'v', 'i', 't'}},
" }
"
" -- Required so nvimux sets the mappings correctly
" nvimux.bootstrap()
" EOF

" Neovim Remote Configuration
if has('nvim')
  let $VISUAL = 'nvr -cc split --remote-wait'
endif

" Vim-Devicons Configuration
let g:webdevicons_enable = 1

let g:webdevicons_enable_denite = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_nerdtree = 1

