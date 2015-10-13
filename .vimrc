" vim-plug needs and plugins {{{
call plug#begin('~/.vim/plugged')

" Plugins go here

Plug 'kien/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'rking/ag.vim'
Plug 'sjl/gundo.vim'
Plug 'flazz/vim-colorschemes'
Plug 'majutsushi/tagbar'
Plug 'nvie/vim-togglemouse'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'edkolev/tmuxline.vim'
Plug 'edkolev/promptline.vim'
Plug 'mhinz/vim-signify'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'tpope/vim-fugitive'
Plug 'ervandew/supertab'

call plug#end()
" }}}


" Misc global settings {{{
syntax enable           " enable syntax processing
set modeline            " turn on modeline processing
set modelines=4         " look at beginning or end of file
set hidden              " allow buffers to live in the background with changes
set history=1000        " remember a lot of history
set title               " change the terminal's title
set visualbell          " don't beep
set noerrorbells        " don't beep
set viminfo='100,<100,%,n~/.viminfo
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
set showcmd               " show command in bottom bar
set cursorline            " highlight current line
filetype plugin indent on " load filetype-specific and plugin-specific indent files
set wildmenu              " visual autocomplete for command menu
set lazyredraw            " redraw only when we need to
set showmatch             " highlight matching [{()}]
set pastetoggle=<F2>      " use F2 to switch into paste mode
set mouse=a               " allow capturing the mouse for scrolling

if has('gui_running')
    "set guioptions-=T    " Remove the toolbar
    set lines=40          " 40 lines of text instead of 24
else
    if &term == 'xterm' || &term == 'screen'
        set t_Co=256      " enable 256 colors
    endif
endif

colorscheme badwolf       " awesome colorscheme
" }}}


" Search settings {{{
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore case when searching
set smartcase           " but be smart about capitalization

" turn off search highlight with ', '
nnoremap <leader><space> :nohlsearch<CR>
" }}}


" Folding settings {{{
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max

" space open/closes folds
nnoremap <space> za

set foldmethod=syntax   " fold based on syntax definitions
" }}}


" Movement settings {{{

" move vertically by visual line rather than real line numbers
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" $/^ doesn't do anything
nnoremap $ <nop>
nnoremap ^ <nop>

" highlight last inserted text
nnoremap gV `[v`]

" restore cursor when entering vim; from
" http://stackoverflow.com/questions/8854371/vim-how-to-restore-the-cursors-logical-and-physical-positions
au BufWinLeave * mkview
au VimEnter * loadview
" }}}


" Leader settings {{{
"let mapleader=","
nmap , \
vmap , \


" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" save session/windows
nnoremap <leader>s :mksession<CR>

" open ag.vim
nnoremap <leader>a :Ag
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
nnoremap <silent> <leader>tt :TagbarToggle<CR>
"}}}


" Go {{{
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
augroup gogroup
	autocmd!
	autocmd FileType go nmap <Leader>gb <Plug>(go-doc-browser)
	autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
	autocmd FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
	autocmd FileType go nmap <Leader>i <Plug>(go-info)
	autocmd FileType go nmap <Leader>e <Plug>(go-rename)
augroup END
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
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"
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
