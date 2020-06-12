" vim-plug needs and plugins {{{
call plug#begin('~/.vim/plugged')

" Plugins go here

" Fast file switching
Plug 'kien/ctrlp.vim'

" Go support
" Plug 'fatih/vim-go'

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
" Doesn't play nicely with vim-go lately
" Plug 'scrooloose/syntastic'

" Enhancements for when running in tmux
Plug 'edkolev/tmuxline.vim'

" Allows using vim to generate prompt lines
Plug 'edkolev/promptline.vim'

" Diff showing stuff
Plug 'mhinz/vim-signify'

" Show diff information in the gutter
" Caused some weird issues, disabled for now
" Plug 'airblade/vim-gitgutter'

" Go completion support
" Deprecated with gopls
" Plug 'mdempsky/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

" Git handling inside vim
Plug 'tpope/vim-fugitive'

" Let tab do smart things with omnicomplete
" Plug 'ervandew/supertab'

" Don't run folding logic when not needed, fixes ultra slow omnicomplete
" Plug 'Konfekt/FastFold'

" Better view/session restoring/saving
Plug 'kopischke/vim-stay'

" Handle lines/columns in paths, e.g. from stacktraces
Plug 'kopischke/vim-fetch'

" Smart tabularizing; also needed for vim-markdown
Plug 'godlygeek/tabular'

" Better Markdown handling
Plug 'plasticboy/vim-markdown'

" Map useful stuff to []
Plug 'tpope/vim-unimpaired'

" HCL formatting
Plug 'fatih/vim-hclfmt'

" Automatic session management
Plug 'tpope/vim-obsession'

" Better JSON support
Plug 'elzr/vim-json'

" Task support
Plug 'joonty/vim-do'

" Deoplete
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" deoplete-go
" Plug 'deoplete-plugins/deoplete-go', { 'do': 'make' }

" Needed for deoplete
" Plug 'roxma/nvim-yarp'
" Plug 'roxma/vim-hug-neovim-rpc'

" CoC
" Use release branch (Recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
if !has('nvim')
    set viminfo='100,<100,%,n~/.viminfo " extend amount of saved info, only for regular vim
endif
" }}}


" Whitespace settings {{{
set wrap                " wrap lines
set linebreak           " only wrap at characters in 'breakat'
set nolist              " list disables linebreak
set whichwrap&          " don't have left/right move to new lines
set tabstop=4           " number of visual spaces per TAB
set softtabstop=4       " number of spaces in tab when editing
set shiftwidth=4        " without this it does two tab stops recently, not sure why
" }}}


" UI settings {{{
set number                " show line numbers
"set relativenumber        " show other line numbers relative to the current
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
" Probably this doesn't do anything anymore as it seems nvim has removed &term
"    if &term == 'xterm' || &term == 'screen' || &term == 'screen-256color' || &term == 'putty-256color'
"        set t_Co=256      " enable 256 colors
"    endif
endif

set list                  " show whitespace
set listchars=tab:\|\     " use pipes for tab

if $TERM != 'putty-256color'
    set termguicolors
endif

set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox
" colorscheme badwolf       " awesome colorscheme
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

" Make 'jk' exit from insert mode
inoremap jk <Esc>
" }}}


" Leader settings {{{
" For whatever reason, 'let mapleader=...' is *not* working for me;
" nmap/vmap work just fine
nmap , \
vmap , \

" open ag.vim
nnoremap <leader>a :Ag
" }}}

" Faster startup
let g:python3_host_prog = '/home/jeff/.venv/bin/python3'

" Required for some plugins
set encoding=utf-8


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


" vim-go {{{
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_interfaces = 1
let g:go_fmt_command = "goimports"
let g:go_metalinter_command = ""
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'ineffassign', 'misspell']
let g:go_metalinter_path = "./..."
"let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck', 'ineffassign', 'misspell']
let g:go_metalinter_deadline = "10s"
"let g:go_list_type = "quickfix"
"let g:go_fmt_fail_silently = 1
augroup gogroup
  autocmd!
  autocmd FileType go nmap <Leader>gb <Plug>(go-build)
  autocmd FileType go nmap <Leader>gt <Plug>(go-test)
  autocmd FileType go nmap <Leader>gd <Plug>(go-doc)
  autocmd FileType go nmap <Leader>gdb <Plug>(go-doc-browser)
  autocmd FileType go nmap <Leader>gdv <Plug>(go-doc-vertical)
  autocmd FileType go nmap <Leader>gdsc <Plug>(go-describe)
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <Leader>e <Plug>(go-rename)
augroup END
" }}}


" Airline {{{
set laststatus=2    " always show the status line

" prevents a long delay when switching into insert mode when using vim-airline
set ttimeoutlen=50
" }}}

" signify
let g:signify_vcs_list = ['git']

" Syntastic {{{
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_check_on_wq = 0
"let g:syntastic_go_checkers = ['go', 'golint', 'govet', 'errcheck']
""let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
""let g:syntastic_always_populate_loc_list = 1
""let g:syntastic_auto_loc_list = 1
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
" Highlight YAML frontmatter
let g:vim_markdown_frontmatter = 1
" Highlight JSON frontmatter
let g:vim_markdown_json_frontmatter = 1
" Stop folding, I trigger it too often accidentally
let g:vim_markdown_folding_disabled = 1
" Use 2, not 4, spaces on new item for indentation
let g:vim_markdown_new_list_item_indent = 2
augroup markdowngroup
  autocmd!
  autocmd FileType markdown set tabstop=4
  autocmd FileType markdown set shiftwidth=4
  autocmd FileType markdown set expandtab
  " Try to fix badness around Markdown and bullets
  " https://github.com/plasticboy/vim-markdown/issues/232#issuecomment-246173676
  autocmd FileType markdown set formatoptions-=q | set formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*\[-*+]\\s\\+
augroup END

" }}}

" Use deploete
let g:deoplete#enable_at_startup = 1

" deoplete-go
" let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
" let g:deoplete#sources#go#pointer = 1
" let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

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

" CoC {{{
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" }}}


" vim:foldmethod=marker:foldlevel=0
