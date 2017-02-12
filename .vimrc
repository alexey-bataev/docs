    " .vimrc File
    " Maintained by: Jeffrey Way
    " jeffrey@jeffrey-way.com
    " http://net.tutsplus.com
    "
    set nocompatible              " be iMproved, required
    python import vim

    " set the runtime path to include Vundle and initialize
    set rtp+=~/vim_plugins/vim-plug
    call plug#begin('~/vim_plugins')
    " alternatively, pass a path where Vundle should install plugins
    "call vundle#begin('~/some/path/here')

    " let Vundle manage Vundle, required
    " Plug 'gmarik/Vundle.vim'

    " The following are examples of different formats supported.
    " Keep Plugin commands between vundle#begin/end.
    " plugin on GitHub repo
    " Plug 'tpope/vim-fugitive'
    " plugin from http://vim-scripts.org/vim/scripts.html
    Plug 'L9'
    " Git plugin not hosted on GitHub
    " Plugin 'git://git.wincent.com/command-t.git'
    " The sparkup vim script is in a subdirectory of this repo called vim.
    " Pass the path to set the runtimepath properly.
    Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
    " Plug 'alexey-bataev/YouCompleteMe', {'do' : './my_ycm_install.sh'}
    " Plug 'Valloric/YouCompleteMe', { 'do': './my_ycm_install.sh' }
    Plug 'Valloric/YouCompleteMe', { 'do': '/usr/bin/python ./install.py --clang-completer' }
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'altercation/vim-colors-solarized'
    " Plug 'endel/vim-github-colorscheme'
    " Plug 'vim-scripts/autumnleaf_modified.vim'
    " Plug 'vim-scripts/AutumnLeaf'
    " Plug 'junegunn/seoul256.vim'
    Plug 'vim-scripts/spacehi.vim'
    Plug 'Raimondi/delimitMate'
    Plug 'mhinz/vim-signify'
    "Plug 'rosenfeld/conque-term'
    Plug 'jeetsukumaran/vim-buffergator'
    Plug 'vim-scripts/TaskList.vim'
    Plug 'rtfb/vim-dox-spell'
    Plug 'vim-scripts/SearchComplete'
    Plug 'vim-scripts/vcscommand.vim'
    Plug 'nathanaelkane/vim-indent-guides'
    " Plug 'bbchung/clighter'
    "Plug 'matthiasvegh/ycmlighter'
    Plug 'mhinz/vim-startify'
    "Plug 'vim-scripts/Conque-Shell'
    "Plug 'SirVer/ultisnips'
    "Plug 'honza/vim-snippets'
    Plug 'aserebryakov/filestyle'
    "Plug 'garious/vim-llvm'
    Plug 'kopischke/vim-fetch'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'Yggdroot/indentLine'
    Plug 'kopischke/vim-stay'
    Plug 'vim-scripts/DoxygenToolkit.vim'
    Plug 'junegunn/vim-plug'
    Plug 'junkblocker/patchreview-vim'
    Plug 'chrisbra/Recover.vim'
    Plug 'sjl/gundo.vim'
    Plug 'freeo/vim-kalisi'
    Plug 'jeaye/color_coded', {'do' : 'cmake . && make && make install'}
    Plug 'tpope/vim-sensible'
    Plug 'vim-scripts/yanktmp.vim'
    Plug 'vim-jp/vim-cpp'
    Plug 'rhysd/committia.vim'
    Plug 'Shougo/vimshell.vim'
    Plug 'bogado/file-line'
    Plug 'vim-scripts/LanguageTool'
    Plug 'vim-scripts/rest.vim'
    Plug 'ryanoasis/vim-devicons'
    " Plug 'ntpeters/vim-airline-colornum'
    " Plug 'google/vim-colorscheme-primary'
    " Plug 'NLKNguyen/papercolor-theme'
    Plug 'ktonga/vim-follow-my-lead'
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
    Plug 'wincent/command-t'
    Plug 'tpope/vim-commentary'
    Plug 'adelarsq/vim-grimmjow'
    " Plug 'gilligan/vim-lldb'
    Plug 'airblade/vim-gitgutter'

    " All of your Plugins must be added before the following line
    call plug#end()            " required
    " To ignore plugin indent changes, instead use:
    "filetype plugin on
    "
    " Brief help
    " :PluginList          - list configured plugins
    " :PluginInstall(!)    - install (update) plugins
    " :PluginSearch(!) foo - search (or refresh cache first) for foo
    " :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
    "
    " see :h vundle for more details or wiki for FAQ
    " Put your non-Plugin stuff after this line

    "Forget compatibility with Vi. Who cares.
    set nocompatible

    "Enable filetypes
    filetype on
    filetype indent on

    "Write the old file out when switching between files.
    set autowrite

    "Display current cursor position in lower right corner.
    set ruler

    "Want a different map leader than \
    let mapleader="\\"

    "Ever notice a slight lag after typing the leader key + command? This lowers
    "the timeout.
    set timeoutlen=500

    "Switch between buffers without saving
    set hidden

    "Set the color scheme. Change this to your preference.
    "Here's 100 to choose from: http://www.vim.org/scripts/script.php?script_id=625
    set t_Co=256
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"
    syntax enable
    set background=light
    let g:solarized_termcolors=256
    "let g:seoul256_background = 239
    "colorscheme seoul256
    colorscheme solarized
    "colorscheme grimmjow
    " colorscheme primary
    " colorscheme dw_green
    "colorscheme kalisi
    " colorscheme PaperColor

    "Set font type and size. Depends on the resolution. Larger screens, prefer h20
    set guifont=DejaVuSansMonoForPowerline\ Nerd\ Font\ 10

    "Tab stuff
    set tabstop=2
    set shiftwidth=2
    set softtabstop=2
    set expandtab
    "set syntax=cpp.doxygen
    let g:load_doxygen_syntax=1

    "Show command in bottom right portion of the screen
    set showcmd

    "Prefer relative line numbering?
    "set relativenumber"

    "Indent stuff
    set smartindent
    set autoindent

    "Always show the status line
    set laststatus=2

    "Prefer a slightly higher line height
    set linespace=3

    "Better line wrapping
    set wrap
    set textwidth=0
    set wrapmargin=0
    set formatoptions=qrn1
    set colorcolumn=81
    highlight GitGutterAdd ctermbg=Red cterm=bold
    highlight ColorColumn ctermbg=red
    let g:gitgutter_override_sign_column_highlight = 0
    let g:gitgutter_highlight_lines = 0
    highlight SignColumn ctermbg = Green
    highlight SignColumn guibg = Green
    " let g:gitgutter_enabled = 0
    let g:gitgutter_signs = 0
    let g:gitgutter_realtime = 0
    let g:gitgutter_eager = 0
    "highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
    "match ExtraWhitespace /\s\+\%#\@<!$/

    "Set incremental searching"
    set incsearch

    "Highlight searching
    set hlsearch

    " case insensitive search
    set ignorecase
    set smartcase

    "Hide MacVim toolbar by default
    set go-=T

    "Hard-wrap paragraphs of text
    nnoremap <leader>q gqip

    "Enable code folding
    set foldenable

    "Hide mouse when typing
    set mousehide

    "Shortcut to fold tags with leader (usually \) + ft
    nnoremap <leader>ft Vatzf

    " Create dictionary for custom expansions
    " set dictionary+=/Users/jeff_way/.vim/dict.txt

    "Opens a vertical split and switches over (\v)
    nnoremap <leader>v <C-w>v<C-w>l

    "Split windows below the current window.
    set splitbelow

    " session settings
    set sessionoptions=resize,winpos,winsize,buffers,tabpages,folds,curdir,help

    "Set up an HTML5 template for all new .html files
    "autocmd BufNewFile * silent! 0r $VIMHOME/templates/%:e.tpl

    "Load the current buffer in Firefox - Mac specific.
    abbrev ff :! open -a firefox.app %:p<cr>

    "Map a change directory to the desktop - Mac specific
    nmap <leader>d :cd ~/Desktop<cr>:e.<cr>

    "Shortcut for editing  vimrc file in a new tab
    nmap <leader>ev :tabedit $MYVIMRC<cr>

    "Change zen coding plugin expansion key to shift + e
    let g:user_zen_expandabbr_key = '<C-e>'

    "Faster shortcut for commenting. Requires T-Comment plugin
    map <leader>c <c-_><c-_>

    "Saves time; maps the spacebar to colon
    nmap <space> :

    "Automatically change current directory to that of the file in the buffer
    autocmd BufEnter * cd %:p:h

    "Map code completion to , + tab
    imap <leader><tab> <C-x><C-o>

    " More useful command-line completion
    set wildmenu

    "Auto-completion menu
    set wildmode=list:longest

    "http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
    set completeopt=longest,menuone
    inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
      \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
    inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
      \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

    "Map escape key to jj -- much faster
    imap jj <esc>

    "Delete all buffers (via Derek Wyatt)
    nmap <silent> ,da :exec "1," . bufnr('$') . "bd"<cr>

    "Bubble single lines (kicks butt)
    "http://vimcasts.org/episodes/bubbling-text/
    nmap <C-Up> ddkP
    nmap <C-Down> ddp

    "Bubble multiple lines
    vmap <C-Up> xkP`[V`]
    vmap <C-Down> xp`[V`]

    " Source the vimrc file after saving it. This way, you don't have to reload Vim to see the changes.
    if has("autocmd")
     augroup myvimrchooks
      au!
      autocmd bufwritepost .vimrc source ~/.vimrc
     augroup END
    endif

    "Spelling corrects. Just for example. Add yours below.
    iab teh the
    iab Teh The
    set spell spelllang=en_us

    " Get to home dir easier
    " <leader>hm is easier to type than :cd ~
    nmap <leader>hm :cd ~/ <CR>

    " Alphabetically sort CSS properties in file with :SortCSS
    :command! SortCSS :g#\({\n\)\@<=#.,/}/sort

    " Shortcut to opening a virtual split to right of current pane
    " Makes more sense than opening to the left
    nmap <leader>bv :bel vsp

    " Revert line to HEAD
    vmap <silent> u <esc>:Gdiff<cr>gv:diffget<cr><c-w><c-w>ZZ

    " Saves file when Vim window loses focus
    au FocusLost * :wa

    " Backups
    set backupdir=~/.vim/tmp/backup// " backups
    set directory=~/.vim/tmp/swap// " swap files
    set backup " enable backup

    " No more stretching for navigating files
    "noremap h ;
    "noremap j h
    "noremap k gj
    "noremap l gk
    "noremap ; l

    set showmatch " show matching brackets

    autocmd FileType cpp setlocal commentstring=//\ %s
    map <F9> :YcmCompleter FixIt<CR>
    let g:webdevicons_enable = 1
    " print empty <a> tag
    " map! ;h <a href=""></a><ESC>5hi
    let g:clang_format_path='/home/abataev/clang_tools/bin/clang-format'
    map <C-K> :pyf ~/clang_tools/llvm/tools/clang/tools/clang-format/clang-format.py<CR>
    map <C-F> :pyf ~/clang_tools/llvm/tools/clang/tools/extra/include-fixer/tool/clang-include-fixer.py<CR>
    imap <C-K> <ESC>:pyf ~/clang_tools/llvm/tools/clang/tools/clang-format/clang-format.py<CR>i
    let g:clang_rename_path='/home/abataev/clang_tools/bin/clang-rename'
    map ,cr :pyf ~/clang_tools/llvm/tools/clang/tools/extra/clang-rename/tool/clang-rename.py<CR>
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
    " set shellcmdflag=-ic
    " set encoding=utf-8
    " let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
    " let g:airline_theme = 'wombat'
    " let g:airline_theme = 'light'
    let g:airline_exclude_preview = 1
    let g:airline_theme = 'light'
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#whitespace#enabled = 1
    let g:airline#extensions#ycm#enabled = 1
    let g:airline#extensions#ycm#error_symbol = 'E:'
    let g:airline#extensions#ycm#warning_symbol = 'W:'
    let g:airline#extensions#hunks#enabled = 1
    let g:airline#extensions#hunks#non_zero_only = 0
    let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    " unicode symbols
    "let g:airline_left_sep = '»'
    "let g:airline_left_sep = '►'
    "let g:airline_left_alt_sep = '>'
    "let g:airline#extensions#tabline#left_alt_sep = '►'
    "let g:airline#extensions#tabline#left_sep = '>'
    "let g:airline_right_sep = '«'
    "let g:airline_right_sep = '◄'
    "let g:airline_right_alt_sep = '<'
    "let g:airline_symbols.linenr = '␊'
    "let g:airline_symbols.linenr = '␤'
    "let g:airline_symbols.linenr = '¶'
    "let g:airline_symbols.branch = '⎇'
    "let g:airline_symbols.branch = '↨'
    "let g:airline_symbols.paste = 'ρ'
    "let g:airline_symbols.paste = 'Þ'
    "let g:airline_symbols.paste = '∥'
    "let g:airline_symbols.whitespace = 'Ξ'
    "let g:airline_symbols.readonly = '®'
    "let g:airline_symbols.linenr = '№'
    let g:airline_powerline_fonts = 1
    " powerline symbols
    "let g:airline_left_sep = '⮀'
    "let g:airline_left_alt_sep = '⮁'
    "let g:airline_right_sep = '⮂'
    "let g:airline_right_alt_sep = '⮃'
    "let g:airline_symbols.branch = '⭠'
    "let g:airline_symbols.readonly = '⭤'
    "let g:airline_symbols.linenr = '⭡'
    " let g:airline#extensions#tabline#left_alt_sep = '⮁'
    " let g:airline#extensions#tabline#left_sep = '⮀'
    let g:ycm_confirm_extra_conf = 0
    let g:ycm_add_preview_to_completeopt = 1
    "let g:ycm_autoclose_preview_window_after_completion = 1
    "let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:signify_vcs_list = [ 'svn', 'git' ]
    let g:signify_line_highlight = 0
    let g:signify_update_on_bufenter = 1
    let g:signify_vcs_cmds = {
            \ 'svn': '...../bin/svn diff --diff-cmd %d -x -U0 -- %f' }
    let g:indent_guides_enable_on_vim_startup = 0
    let g:clighter_heuristic_compile_args = 1
    let g:clighter_enable_cross_rename = 1
    "let g:clighter_realtime = 0
    if $OSTYPE=~#'\(darwin.*\)'
      let g:clighter_autostart = 0
      let g:color_coded_enabled = 1
      let g:clighter_libclang_file='~/clang_tools/lib/libclang.dylib'
      let g:ycm_path_to_python_interpreter = '/usr/bin/python'
    else
      let g:clighter_autostart = 0
      let g:color_coded_enabled = 1
      let g:clighter_libclang_file='~/clang_tools/lib/libclang.so'
      set backspace=2 " make backspace work like most other apps"
      " get g:ycm_path_to_python_interpreter = '/usr/bin/python'
    endif
    let g:clighter_clang_options = ['-std=c++11','-I.','-I../include','-I../../include', '-I../../../include','-I../../../../include','-I../../../../../include','-I../build/include','-I../../build/include', '-I../../../build/include','-I../../../../build/include','-I../../../../../build/include','-I../build/tools/clang/include','-I../../build/tools/clang/include', '-I../../../build/tools/clang/include','-I../../../../build/tools/clang/include','-I../../../../../build/tools/clang/include','-DINTEL_CUSTOMIZATION','-DGTEST_HAS_RTTI=0','-D_DEBUG','-D__STDC_CONSTANT_MACROS','-D__STDC_FORMAT_MACROS','-D__STDC_LIMIT_MACROS','-fPIC','-isysroot /Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX10.11.sdk','-DSVN_REVISION=\\\"257862\\\"','-D_GNU_SOURCE']
    "hi Type term=NONE cterm=NONE ctermbg=NONE ctermfg=brown gui=NONE

    augroup color_coded_custom
      autocmd!
      au VimEnter,ColorScheme * hi default Member ctermfg=45 guifg=Cyan
      au VimEnter,ColorScheme * hi default Variable ctermfg=249 guifg=Grey
      au VimEnter,ColorScheme * hi default Namespace ctermfg=208 guifg=Yellow
      au VimEnter,ColorScheme * hi default EnumConstant ctermfg=34 guifg=LightGreen
    augroup END

    augroup numbers
      autocmd!
      au VimEnter * set norelativenumber
      au InsertLeave * set norelativenumber
      au WinEnter * set norelativenumber
    augroup END

    let g:startify_change_to_dir = 0
    let g:startify_files_number = 8
    let g:startify_bookmarks = ['~/.vimrc',]
    let g:startify_skiplist = ['vimrc',]
    let g:startify_custom_header = map(split(system('fortune ~/.vim/fortunes | cowsay -W 60'), '\n'), '"   ". v:val') + ['','']
    let g:rooter_patterns = ['tags', '.git', '.git/']
    let g:startify_session_persistence = 1
    let g:UltiSnipsExpandTrigger="<c-tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    set viewoptions=cursor,folds,slash,unix

    nmap <leader><leader> :bn<CR>
    vmap <leader><leader> :bn<CR>
    map <leader><leader> :bn<CR>
    nmap <leader>n :bn<CR>
    vmap <leader>n :bn<CR>
    map <leader>n :bn<CR>
    nmap <leader>p :bp<CR>
    vmap <leader>p :bp<CR>
    map <leader>p :bp<CR>

    map <leader>gd :YcmCompleter GoTo<CR>
    nmap <leader>gd :YcmCompleter GoTo<CR>
    imap <leader>gd :YcmCompleter GoTo<CR>
    "map <leader>gd :YodaGoto Declaration<CR>
    "nmap <leader>gd :YodaGoto Declaration<CR>
    "imap <leader>gd :YodaGoto Declaration<CR>
    "map <leader>gf :YodaGoto Definition<CR>
    "nmap <leader>gf :YodaGoto Definition<CR>
    "imap <leader>gf :YodaGoto Definition<CR>
    "map <leader>e :YodaShowErrors<CR>
    map <leader>v <Plug>TaskList
    nmap <leader>v <Plug>TaskList
    imap <leader>v <Plug>TaskList
    vmap y ygv<Esc>
    nmap <silent> <Leader>r :call clighter#Rename()<CR>
    set listchars=tab:»-
    set list
    let g:DoxygenToolkit_commentType="C++"
    let g:DoxygenToolkit_briefTag_pre=" "
    let g:DoxygenToolkit_paramTag_pre="\\param "
    let g:DoxygenToolkit_returnTag="\\returns "
    nnoremap <c-d> :Dox<CR>
    vnoremap <c-d> :Dox<CR>
    inoremap <c-d> <Esc>:Dox<CR>
    nnoremap <F5> :GundoToggle<CR>

    let g:yanktmp_file = "/home/abataev/.vim/tmp/.tmp_exchange"
    vmap <silent> ,y :call YanktmpYank()<CR>
    nmap <silent> ,y :call YanktmpYank()<CR>
    map <silent> ,p :call YanktmpPaste_p()<CR>
    map <silent> ,P :call YanktmpPaste_p()<CR>

    let g:languagetool_jar='~/LanguageTool-2.9/languagetool-commandline.jar'
    nnoremap <c-l> :LanguageToolCheck<CR>
    vnoremap <c-l> :LanguageToolCheck<CR>
    inoremap <c-l> <Esc>:LanguageToolCheck<CR>

    " Disable replace mode
    function! s:ForbidReplace()
      if v:insertmode!=#"i"
        call feedkeys("\<insert>", "n")
      endif
    endfunction
    augroup ForbidReplaceMode
      autocmd!
      autocmd InsertEnter  * :call s:ForbidReplace()
      autocmd InsertChange * :call s:ForbidReplace()
    augroup END

    "Show lines numbers
    set number
    set norelativenumber

    let s:numbers_exclude = ['minibufexpl', 'nerdtree', 'unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m']
    function! s:ResetNumbers()
      if index(s:numbers_exclude, &ft) >= 0
        setlocal norelativenumber
        setlocal nonumber
      endif
    endfunc

    augroup disable_numbers
      autocmd InsertEnter * :call s:ResetNumbers()
      autocmd InsertLeave * :call s:ResetNumbers()
      autocmd BufNewFile  * :call s:ResetNumbers()
      autocmd BufReadPost * :call s:ResetNumbers()
      autocmd FocusLost   * :call s:ResetNumbers()
      autocmd FocusGained * :call s:ResetNumbers()
      autocmd WinEnter    * :call s:ResetNumbers()
      autocmd WinLeave    * :call s:ResetNumbers()
    augroup END

    source ~/clang_tools/llvm/utils/vim/vimrc
" lazy method of appending this onto your .vimrc ":w! >> ~/.vimrc"
" ------------------------------------------------------------------
" this block of commands has been autogenerated by solarized.vim and
" includes the current, non-default Solarized option values.
" To use, place these commands in your .vimrc file (replacing any
" existing colorscheme commands). See also ":help solarized"

" ------------------------------------------------------------------
" Solarized Colorscheme Config
" ------------------------------------------------------------------
let g:solarized_termcolors=256    "default value is 16
let g:solarized_hitrail=1    "default value is 0
syntax enable
set background=light
colorscheme solarized
" ------------------------------------------------------------------

" The following items are available options, but do not need to be
" included in your .vimrc as they are currently set to their defaults.

" let g:solarized_termtrans=0
" let g:solarized_degrade=0
" let g:solarized_bold=1
" let g:solarized_underline=1
" let g:solarized_italic=1
" let g:solarized_contrast="normal"
" let g:solarized_visibility="normal"
" let g:solarized_diffmode="normal"
" let g:solarized_menu=1

