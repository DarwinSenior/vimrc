set laststatus=2
set number
set guitablabel=%N\ %t
set backspace=indent,eol,start
set whichwrap+=<,>,h,l
set nocompatible
set clipboard=unnamed
syntax on

let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/home/DarwinSenior/anaconda3/bin/python'

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
" Plugin 'majutsushi/tagbar'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'gcmt/wildfire.vim'
Plugin 'kien/rainbow_parentheses.vim'
" the follwoing are
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

Plugin 'mhinz/vim-startify'
Plugin 'tomtom/tcomment_vim'
" Plugin 'scrooloose/syntastic'
Plugin 'benekastah/neomake'
Plugin 'vim-airline/vim-airline'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'nathanaelkane/vim-indent-guides'
" This pligin does not support the dot repeat
" Plugin 'Raimondi/delimitMate'
" text object plugins
Plugin 'kana/vim-textobj-user'
Plugin 'glts/vim-textobj-comment'
Plugin 'rbonvall/vim-textobj-latex'

" close parathesis and dot dot dot
Plugin 'cohama/lexima.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'tommcdo/vim-exchange'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-abolish'
Plugin 'jeffkreeftmeijer/vim-numbertoggle'
Plugin 'easymotion/vim-easymotion'
Plugin 'wellle/targets.vim'
" for html tag matching
Plugin 'Valloric/MatchTagAlways'
Plugin 'rking/ag.vim'
" The plugin listed below are language specific
" This plugin is for writing
Plugin 'junegunn/goyo.vim'
Plugin 'reedes/vim-pencil'
Plugin 'itchyny/calendar.vim'
" For all languages
Plugin 'sheerun/vim-polyglot'
Plugin 'JuliaLang/julia-vim'
Plugin 'bendavis78/vim-polymer'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
" The plugin below are specific nvim plugin
" Plugin 'jalvesaq/Nvim-R'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
" The plugin below is for iterm
Plugin 'jszakmeister/vim-togglecursor'
call vundle#end()
" required

filetype plugin indent on
" the following line is the current workaround and might need to remove in the
" future
autocmd BufRead,BufNewFile *.jl set filetype=julia
autocmd BufRead,BufNewFile *.ts set filetype=typescript

" easy motion with only one leader key
map <Leader>w <Plug>(easymotion-bd-w)
map <Leader>f <Plug>(easymotion-s)
map <Leader>l <Plug>(easymotion-bd-wl)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_shade = 1
" Set the toggling the line number
let g:NumberToggleTrigger = "<C-k>"
nnoremap <silent> <Leader>ln :call NumberToggle()<CR>

let g:polyglot_disable = ['markdown']

" for markdown plugin
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_math = 1


" for the pencil plugin init
" this is for the writing mode of vim

let g:pencil#wrapModeDefault = 'soft'
let g:pencil_higher_contrast_ui = 1

function! s:goyo_enter()
    set scrolloff=999
    set background=light
    call pencil#init({'wrap': 'soft'})
    set spell
    hi clear SpellBad
    hi SpellBad cterm=bold,undercurl ctermbg=224
endfunction

function! s:goyo_leave()
    set scrolloff=5
    colorscheme Tomorrow-Night
    call pencil#init({'wrap': 'off'})
    set nospell
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nnoremap <Leader>gy :Goyo<CR>
nnoremap <Leader>gy<ESC> :Goyo!<CR>


" ntpeters/vim-better-whitespace config
highlight ExtraWhitespace ctermbg=Black


" the following is the configuration for the ag
nmap <Leader>ag :Ag<Space>



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
let g:neomake_cpp_enable_markers=['clang']
let g:neomake_cpp_clang_args = ["-std=c++14", "-Wextra", "-Wall", "-fsanitize=undefined","-g"]

" let g:neomake_matlab_enabled_makers = ['mlint']


" add tags and sort of things
set tags+=./.tags
" nmap <Leader>tag :TagbarToggle<CR>


nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>

let g:UltiSnipsEditSplit = "vertical"
let g:ycm_server_keep_logfiles = 1
let g:ycm_global_ymc_extra_conf = "~/.vim/.ycm_extra_conf.py"

let g:ulti_expand_or_jump_res = 0 "default value, just set once
function! Ulti_ExpandOrJump_and_getRes()
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res
endfunction
inoremap <CR> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":"\n"<CR>

let g:airline_theme = "bubblegum"
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1


" " Configuration of markdown
" let g:vim_markdown_folding_disable=1
" let g:vim_markdown_math=1
" let g:vim_markdown_formatter=1

" add additional surround ys(text object)l for latex begin end pair
let g:surround_{char2nr('l')}="\\\1command\1\{\r}"

" There are some specific file types indentation
" javascript/python/coffeescript 4 indent
autocmd Filetype javascript setlocal ts=4 sw=4 sts=0 expandtab
autocmd Filetype python setlocal ts=4 sw=4 sts=0 expandtab

autocmd VimEnter * RainbowParenthesesToggle
autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

" Save the old file and Switch File with FuzzyFinder
" New File with FuzzyFinder
" nnoremap t1 1gt
" nnoremap t2 2gt
" nnoremap t3 3gt
" nnoremap t4 4gt
" nnoremap t5 5gt
" nnoremap t6 6gt
" nnoremap t7 7gt
" nnoremap t8 8gt
" nnoremap t9 9gt
" nnoremap t0 :tablast<CR>
nmap to :w<CR>:CtrlP<CR>
nmap <Leader>to :CtrlPBuffer<CR>
nmap <Leader>bw :w<CR>
nmap <Leader>bd :bd<CR>

" Opening the shell for vim
" The following command lines are for specific plugins,
" I believe that I will use all of them by starting leader
nnoremap <Leader>nt :NERDTree<CR>
" nnoremap <Leader>sh :tabnew<CR>:VimShell<CR>
nnoremap <Leader>sh :tabe term://zsh<CR>i
nmap <Leader>y "+y
nmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

" I could not fully grasp the navigation techniques
" So, here I just define the keys and hopefully it will
" speed up. Here in normal/visual mode, Capital HJKL would jump
" 5 steps ahead instead of 1
" and in the insert mode, I will use <Ctrl>+HJKL for these
" special jumps
nmap H 5h
nmap J 5j
nmap K 5k
nmap L 5l
vmap H 5h
vmap J 5j
vmap K 5k
vmap L 5l

" These command are for the insert mode
" <Ctrl>+<Enter> insert a new line below
" <Ctrl>+<Shift>+<Enter> insert a new line above
" <Ctrl>+a Beginning of the line
" <Ctrl>+e End of the line
inoremap <C-a> <Esc>^i
inoremap <C-e> <Esc>$a


" Exchanging lines and words, so it is pretty awesome.
" cx exchange. I will listen to the advise and not add too much customisation
" to the vim key mapping

filetype plugin on
filetype indent on

" syntax group setting
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
"Set the theme and the fontsize
colorscheme Tomorrow-Night
set guifont=InputSans:h20"

" Set to auto read when a file is changed from the outside
set autoread

" :W sudo saves the file
" (useful for handling the permission-denied error)
" command W w !sudo tee % > dev/null

" In many terminal emulators the mouse works just fine, so enable it
if has('mouse')
    set mouse=a
endif

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

tmap <ESC> <C-\><C-n>

let g:calendar_google_calendar = 1
let g:calendar_google_task = 1

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
