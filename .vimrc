" vim-plug needs and plugins {{{
call plug#begin('~/.vim/plugged')

" Plugins go here

" Fast file switching
Plug 'kien/ctrlp.vim'

" Go support
Plug 'fatih/vim-go'

" Search using The Silver Searcher
Plug 'rking/ag.vim'

" Graphical undo tree browsing
Plug 'sjl/gundo.vim'

" A whole bunch of color schemes
Plug 'flazz/vim-colorschemes'

" ctags-based tag bar
Plug 'majutsushi/tagbar'

" Allows pressing F12 to toggle mouse capture in terminal, great for copying
Plug 'nvie/vim-togglemouse'

" Info line
Plug 'bling/vim-airline'

" Syntax checking support (using gofmt for instance)
Plug 'scrooloose/syntastic'

" Enhancements for when running in tmux
Plug 'edkolev/tmuxline.vim'

" Allows using vim to generate prompt lines
Plug 'edkolev/promptline.vim'

" Show diff information in the gutter
Plug 'mhinz/vim-signify'

" Go completion support
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" Git handling inside vim
Plug 'tpope/vim-fugitive'

" Let tab do smart things with omnicomplete
Plug 'ervandew/supertab'

" Don't run folding logic when not needed, fixes ultra slow omnicomplete
Plug 'Konfekt/FastFold'

" Better view/session restoring/saving
Plug 'kopischke/vim-stay'

" Handle lines/columns in paths, e.g. from stacktraces
Plug 'vim-fetch'

" Smart tabularizing; also needed for vim-markdown
Plug 'godlygeek/tabular'

" Better Markdown handling
Plug 'plasticboy/vim-markdown'

" Map useful stuff to []
Plug 'tpope/vim-unimpaired'

Plug 'fatih/vim-hclfmt'

call plug#end()
" }}}


" Misc global settings {{{
syntax enable                       " enable syntax processing
set modeline                        " turn on modeline processing
set modelines=4                     " look at beginning or end of file
set hidden                          " allow buffers to live in the background with changes
set history=1000                    " remember a lot of history
set title                           " change the terminal's title
set visualbell                      " don't beep
set noerrorbells                    " don't beep
set viminfo='100,<100,%,n~/.viminfo " extend amount of saved info
" }}}


" Whitespace settings {{{
set wrap                " wrap lines
set linebreak           " only wrap at characters in 'breakat'
set nolist              " list disables linebreak
set whichwrap&          " don't have left/right move to new lines
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
" }}}


" UI settings {{{
set number                " show line numbers
set relativenumber        " show other line numbers relative to the current
set cursorline            " highlight current line
set showcmd               " show command in bottom bar
set wildmenu              " visual autocomplete for command menu
set lazyredraw            " redraw only when we need to
set showmatch             " highlight matching [{()}]
set pastetoggle=<F2>      " use F2 to switch into paste mode
set mouse=a               " allow capturing the mouse for scrolling

filetype plugin indent on " load filetype-specific and plugin-specific indent files

if has('gui_running')
    set guioptions-=T     " Remove the toolbar
    set lines=40          " 40 lines of text instead of 24
else
    if &term == 'xterm' || &term == 'screen'
        set t_Co=256      " enable 256 colors
    endif
endif

set list                  " show whitespace
set listchars=tab:\|\     " use pipes for tab

colorscheme badwolf       " awesome colorscheme
" }}}


" Search settings {{{
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore case when searching
set smartcase           " but be smart about capitalization

" turn off search highlight with leader + space
nnoremap <leader><space> :nohlsearch<CR>
" }}}


" Folding settings {{{
set nofoldenable         " plugin updates broke folding, so turning off for now
"set foldenable          " enable folding
"set foldlevelstart=10   " open most folds by default
"set foldlevel=10        " open most folds by default

" space open/closes folds
nnoremap <space> za

"set foldmethod=syntax   " Use syntax folding, dangerous without FastFold!
" }}}


" Movement settings {{{

" move vertically by visual line rather than real line numbers
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" highlight last inserted text
nnoremap gV `[v`]
" }}}


" Leader settings {{{
" For whatever reason, 'let mapleader=...' is *not* working for me;
" nmap/vmap work just fine
nmap , \
vmap , \

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" open ag.vim
nnoremap <leader>a :Ag
" }}}


" Spelling settings {{{
autocmd FileType markdown setlocal spell
autocmd FileType gitcommit setlocal spell
" }}}


" CtrlP {{{
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" Or, with hidden files
" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" }}}


" Tagbar {{{
" Use leader + tt for toggle
nnoremap <silent> <leader>tt :TagbarToggle<CR>
"}}}


" Go {{{
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_interfaces = 1
let g:go_fmt_command = "goimports"
augroup gogroup
	autocmd!
	autocmd FileType go nmap <Leader>gb <Plug>(go-doc-browser)
	autocmd FileType go nmap <Leader>gd <Plug>(go-describe)
	autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
	autocmd FileType go nmap <Leader>i <Plug>(go-info)
	autocmd FileType go nmap <Leader>e <Plug>(go-rename)
augroup END
" }}}


" Airline {{{
set laststatus=2    " always show the status line

" prevents a long delay when switching into insert mode when using vim-airline
set ttimeoutlen=50
" }}}


" Syntastic {{{
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_wq = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" }}}


" SuperTab {{{
" Let SuperTab try to do the right thing at the right time when you hit Tab
let g:SuperTabDefaultCompletionType = "context"
" }}}


" vim-stay {{{
" Suggested by the author for portability of view files
set viewoptions=cursor,folds,slash,unix
" }}}


" vim-markdown {{{
let g:vim_markdown_frontmatter=1
augroup markdowngroup
	autocmd!
	autocmd FileType markdown set tabstop=4
	autocmd FileType markdown set shiftwidth=4
	autocmd FileType markdown set expandtab
augroup END

" }}}


" Tmux {{{
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}


" Backups {{{
" enable backups, but use tmp folders rather than using <file>~
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup
" }}}


" vim:foldmethod=marker:foldlevel=0
