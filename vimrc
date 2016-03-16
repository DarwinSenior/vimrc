set laststatus=2
set number
set guitablabel=%N\ %t
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set nocompatible
set clipboard=unnamed
syntax on

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'


let mapleader = ' '

" set the runtime path include Vundle and initialise
set rtp+=~/.vim/bundle/Vundle.vim
" adding merlin for autocomplete ocaml
set rtp+=~/.opam/system/share/merlin/vim
" /Users/DarwinSenior/.opam/system/share

" required
" set the runtime path include Vundle and initialise
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'gcmt/wildfire.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'jszakmeister/vim-togglecursor'
" the follwoing are

Plugin 'mhinz/vim-startify'
Plugin 'tomtom/tcomment_vim'
Plugin 'benekastah/neomake'
Plugin 'vim-airline/vim-airline'
Plugin 'ntpeters/vim-better-whitespace'
" This pligin does not support the dot repeat
" Plugin 'Raimondi/delimitMate'
" text object plugins
Plugin 'kana/vim-textobj-user'
Plugin 'glts/vim-textobj-comment'
Plugin 'rbonvall/vim-textobj-latex'
Plugin 'AndrewRadev/splitjoin.vim'
Plugin 'rizzatti/dash.vim'

" close parathesis and dot dot dot
Plugin 'cohama/lexima.vim'
Plugin 'ctrlpvim/ctrlp.vim'
" ---------------------- unite plugin -----------------
Plugin 'SirVer/ultisnips'
" Plugin 'Rip-Rip/clang_complete'
" Plugin 'zchee/deoplete-jedi'
" Plugin 'Shougo/deoplete.nvim'
" Plugin 'racer-rust/vim-racer'

Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'ujihisa/unite-colorscheme'
Plugin 'tsukkee/unite-tag'
Plugin 'Shougo/unite-outline'
Plugin 'msprev/unite-bibtex'
Plugin 'thinca/vim-ref'
Plugin 'kopischke/unite-spell-suggest'

"=============== for appereance ==============
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'terryma/vim-smooth-scroll'
Bundle 'zhaocai/GoldenView.Vim'

Plugin 'bkad/CamelCaseMotion'
Plugin 'tommcdo/vim-exchange'
Plugin 'airblade/vim-gitgutter'
Plugin 'google/vim-searchindex'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'easymotion/vim-easymotion'
Plugin 'wellle/targets.vim'
Plugin 'Chiel92/vim-autoformat'
Plugin 'junegunn/vim-easy-align'
" for html tag matching
Plugin 'Valloric/MatchTagAlways'
" The plugin listed below are language specific
" This plugin is for writing

"================= writing and all stuff================
Plugin 'junegunn/goyo.vim'
Plugin 'reedes/vim-pencil'
Plugin 'junegunn/limelight.vim'
Plugin 'plasticboy/vim-markdown'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
Plugin 'lambdalisue/shareboard.vim'
" Plugin 'euclio/vim-markdown-composer'

" For all languages
Plugin 'sheerun/vim-polyglot'
Plugin 'bendavis78/vim-polymer'
Plugin 'JuliaLang/julia-vim'
Plugin 'Valloric/YouCompleteMe'
" The plugin below are specific nvim plugin

" ========color scheme==============
Plugin 'marcopaganini/termschool-vim-theme'
Plugin 'tomasr/molokai'
Plugin 'hewo/vim-colorscheme-deepsea'
Plugin 'Wutzara/vim-materialtheme'
Plugin 'morhetz/gruvbox'
Plugin 'd11wtq/tomorrow-theme-vim'
Plugin 'reedes/vim-colors-pencil'
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ryanoasis/vim-devicons'
call vundle#end()
" required

filetype plugin indent on
" the following line is the current workaround and might need to remove in the
" future
autocmd BufRead,BufNewFile *.jl set filetype=julia
autocmd BufRead,BufNewFile *.rs set filetype=rust
autocmd BufRead,BufNewFile *.ts set filetype=typescript
autocmd BufRead,BufNewFile *.tex set filetype=tex

" easy motion with only one leader key
map <Leader>w <Plug>(easymotion-bd-w)
" map <Leader>f <Plug>(easymotion-s)
" map <Leader>l <Plug>(easymotion-bd-wl)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_shade = 1

" Set the toggling the line number
let g:NumberToggleTrigger = "<C-k>"
nnoremap <silent> <Leader>ln :call NumberToggle()<CR>

let g:polyglot_disable = ['markdown']

" for markdown plugin
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1
let g:markdown_composer_autostart = 0

" section for note taking
let g:notes_directories = ["~/Desktop/Notes"]
let g:notes_suffix = ".md"
let g:notes_title_sync = "rename_file"



" for the pencil plugin init
" this is for the writing mode of vim

let g:pencil#wrapModeDefault = 'soft'
let g:pencil_higher_contrast_ui = 1

function! s:goyo_enter()
    set scrolloff=999
    set background=light
    Limelight
    call pencil#init({'wrap': 'soft'})
    colorscheme Tomorrow
    set spell
    hi clear SpellBad
    hi SpellBad cterm=bold,undercurl ctermbg=224
endfunction

function! s:goyo_leave()
    set scrolloff=5
    colorscheme Tomorrow-Night
    Limelight!
    call pencil#init({'wrap': 'off'})
    set nospell
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" For alignment settings

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)



" ntpeters/vim-better-whitespace config
highlight ExtraWhitespace ctermbg=Black


" Limit the working path to current path
let g:ctrlp_show_hidden = 1
let g:ctrlp_working_path_mode = 'r'

" Do not ask every time it appears.
autocmd! BufWritePost * Neomake
autocmd! BufWritePre * StripWhitespace

let g:neomake_html_polylint_maker = {
            \ 'args': ['--no-recursion'],
            \ 'errorformat': '%A%f:%l:%c,%Z    %m'
            \}

let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_python_enabled_makers = ['flake8', 'pep8']
let g:neomake_json_enabled_makers = ['jsonlint']
let g:neomake_vim_enabled_makes = ['vint']
let g:neomake_typescript_enabled_makers = ['tsc']
let g:neomake_html_enabled_makers = ['polylint']
let g:neomake_cpp_enabled_markers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++14", "-Wextra", "-Wall", "-fsanitize=undefined","-g"]
let g:neomake_rust_enabled_makers = ['cargocheck']

" let g:neomake_matlab_enabled_makers = ['mlint']


" add tags and sort of things
set tags+=./.tags
" nmap <Leader>tag :TagbarToggle<CR>

" setting auto format
nmap <Leader><Leader><Leader> :Autoformat<CR>


let g:airline_theme = "bubblegum"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1


" " Configuration of markdown
let g:vim_markdown_folding_disable=1
let g:vim_markdown_math=1
let g:vim_markdown_formatter=1

" add additional surround ys(text object)l for latex begin end pair
let g:surround_{char2nr('l')}="\\\1command\1\{\r}"

" There are some specific file types indentation
" javascript/python/coffeescript 4 indent
autocmd Filetype javascript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype typescript setlocal ts=2 sw=2 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab

autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

" ref-pydoc
let g:ref_pydoc_cmd = "python3 -m pydoc"

" Save the old file and Switch File with ctrlp
" nmap to :w<CR>:CtrlP<CR>
if executable('ag')
    let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup','--hidden', '-g', '']
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
endif
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nmap <Leader>Fi :w<CR>:Unite file_rec/neovim<CR>i<Down><Up>
nmap <Leader>fi :w<CR>:Unite file<CR>i
nmap <Leader>bi :w<CR>:Unite buffer<CR>i
nmap <Leader>ti :w<CR>:Unite tag<CR>i
" nmap <Leader>yi :w<CR>:Unite
nmap <Leader>oi :w<CR>:Unite outline<CR>i
nmap to :Ctrlp<CR>
nmap To :CtrlpBuffer<CR>

" Opening the shell for vim
" The following command lines are for specific plugins,
" I believe that I will use all of them by starting leader
nnoremap <Leader>nt :NERDTree<CR>
" nnoremap <Leader>sh :tabnew<CR>:VimShell<CR>
nnoremap <Leader>sh :tabe term://zsh<CR>i

" I could not fully grasp the navigation techniques
" So, here I just define the keys and hopefully it will
" speed up. Here in normal/visual mode, Capital HJKL would jump
" 5 steps ahead instead of 1
" and in the insert mode, I will use <Ctrl>+HJKL for these
" special jumps
nmap H 5h
nmap L 5l
nmap J 5j
nmap K 5k
vmap J 5j
vmap K 5k
vmap H 5h
vmap L 5l
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

" These command are for the insert mode
" <Ctrl>+<Enter> insert a new line below
" <Ctrl>+<Shift>+<Enter> insert a new line above
" <Ctrl>+a Beginning of the line
" <Ctrl>+e End of the line
inoremap <C-a> <Esc>^i
inoremap <C-e> <Esc>$a


" Exchanging lines and words, so it is pretty awesome.

" syntax group setting
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
"Set the theme and the fontsize
colorscheme Tomorrow-Night
set guifont=InputSans:h20"

" Set to auto read when a file is changed from the outside

" :W sudo saves the file
" (useful for handling the permission-denied error)
" command W w !sudo tee % > dev/null

" In many terminal emulators the mouse works just fine, so enable it
if has('mouse')
    set mouse=a
endif

" when diff use vertical split
set diffopt+=vertical

set previewheight=5

set autoread
" The following are the rules for the indentations
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent

" Ignore the cases when searching
" When searching trying to be smart cases
" Hightlight the search result
" Make search like in the mordern browser
set ignorecase
set smartcase
set hlsearch
set incsearch


" <Ctrl-l> redraws the screen and removes any search highlighting
" <Ctrl-L> remove not only hightlighting but also the term completely
nnoremap <silent> <C-L> :nohl<CR>
nnoremap <silent> <C-l> :let @/ = ""<CR>

" setting start to be better equipped
nmap * *``

" folding settings
set foldmethod=manual   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

if has('nvim')
    tmap <ESC> <C-\><C-n>
endif

" ==================== completion =========================
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

" let g:loaded_youcompleteme = 1
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_server_keep_logfiles = 1
" let g:ycm_show_diagnostics_ui = 0
let g:ycm_filetype_blacklist = {'tex': 1, 'markdown': 1, 'notes': 1, 'text': 1}
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_global_ymc_extra_conf = "/Users/DarwinSenior/.vim/.ycm_extra_conf.py"
let g:ycm_rust_src_path = "/Users/DarwinSenior/.rust/rustc-1.6.0/src"

let g:UltiSnipsEditSplit = "vertical"
let g:ulti_expand_or_jump_res = 0 "default value, just set once
function! Ulti_ExpandOrJump_and_getRes()
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res
endfunction
let g:UltiSnipsExpandTrigger = "<c-tab>"
inoremap <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>

" set hidden
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_omnicppcomplete_compliance = 0
let g:clang_make_default_keymappings = 0
let g:clang_library_path = "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib"

" let g:deoplete#enable_at_startup = 1
" inoremap <silent><expr><Tab>  pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()

" for racer completion
let g:racer_cmd = "~/.cargo/bin/racer"
let $RUST_SRC_PATH = "/Users/DarwinSenior/.rust/rustc-1.6.0/src"

" startify settings

let g:startify_bookmarks = [ {'v': '~/.vimrc'}, '~/.zshrc', '~/.tmux.conf' ]
let g:startify_custom_header = [
            \ '                                 ___         ',
            \ '                                 | |         ',
            \ '                                 | |         ',
            \ '                         ------------------- ',
            \ '                         ------------------- ',
            \ '                          |  ___  |  ___  |  ' ,
            \ '                          | | | | | | | | |  ' ,
            \ '                          | |-+-| | |-+-| |  ' ,
            \ '                          | |_|_| | |_|_| |  ' ,
            \ '                          |  ___  |  ___  |  ' ,
            \ '                          | |   | | |   | |  ' ,
            \ '                          | |   | | |   | |  ' ,
            \ '                          | |___| | |___| |  ' ,
            \ '                          |  ___  |  ___  |  ' ,
            \ '                          | |   | | |   | |  ' ,
            \ '                          | |   | | |   | |  ' ,
            \ '                          | |___| | |___| |  ' ,
            \ '                          |       |       |  ' ,
            \ '                         =================== '
            \]
