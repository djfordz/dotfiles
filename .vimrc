" Make Vim more useful, but less Vi compatible
set nocompatible
execute pathogen#infect()
execute pathogen#helptags()

syntax on
filetype plugin indent on
set ai
set si

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" omg folding is the worst
set nofoldenable

" expand tabs to 4 spaces
set shiftwidth=4
set tabstop=4
set smarttab
set expandtab

" faster tab navigation
nnoremap <S-tab> :tabprevious<CR>
nnoremap <tab> :tabnext<CR>

" use system clipboard by default
set clipboard=unnamed

" searching options
set incsearch
set showcmd
set ignorecase
set smartcase

" disable backups
set nobackup
set nowritebackup
set noswapfile

" disable annoying beep on errors
set noerrorbells
if has('autocmd')
  autocmd GUIEnter * set vb t_vb=
endif

" font options
set background=dark
colorscheme jellybeans
set gfn=Inconsolata:h14

" keep at least 5 lines below the cursor
set scrolloff=5

" window options
set showmode
set showcmd
set ruler
set ttyfast
set backspace=indent,eol,start
set laststatus=2

" always show tab line to avoid annoying resize
set showtabline=2

" enable mouse support
set mouse=a

" better tab completion on commands
set wildmenu
set wildmode=list:longest

" close buffer when tab is closed
set nohidden

" Spell check
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap ctermfg=44 term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare ctermfg=44 term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal ctermfg=44 term=underline cterm=underline
highlight Search guifg=Black guibg=Red gui=bold

" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow
" Highlight errors
highlight SyntasticError guibg=#2f0000

" supertab config
set ofu=syntaxcomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" line numbers
set number

" shortcuts to common commands
let mapleader = ","
nnoremap <leader>a :Ack 
nnoremap <leader>e :tabnew<CR>:CommandT<CR>
nnoremap <leader>l :NERDTreeToggle<CR>
nnoremap <leader>o :CommandT<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>s :vsplit<CR>
nnoremap <leader>w :tabclose<CR>
map <leader>ns :setlocal nospell<CR>
map <leader>ss :setlocal spell<CR>
map <Leader>sp :set paste<CR>
map <Leader>np :set nopaste<CR>

" ; is better than :, and kj is better than ctrl-c
nnoremap ; :
" also autosave when going to insert mode
inoremap kj <Esc>:w<CR>

" Write a file with sudo (w!!)
cmap w!! w !sudo tee % >/dev/null

" Escape (kj)
inoremap jk <Esc>

" snippets
map <Leader>sn :rightbelow vnew ~/.vim/bundle/vim-snippets/UltiSnips/php.snippets<CR>
map <Leader>sh :rightbelow vnew ~/.vim/bundle/vim-snippets/UltiSnips/sh.snippets<CR>
map <leader>sj :rightbelow vnew ~/.vim/bundle/vim-snippets/UltiSnips/javascript.snippets<CR>
map <leader>sc :rightbelow vnew ~/.vim/bundle/vim-snippets/UltiSnips/cpp.snippets<CR>
map <Leader>pp :set paste<CR>o<esc>"*]p:set nopaste<cr> " paste from clipboard

"paste from system clipboard in insert mode (Ctrl+v)
imap <C-V> <ESC>"+gpa
imap <C-C> <ESC>"+yE
" Yank WORD to system clipboard in normal mode
nmap <leader>y "+yE
" Yank selection to system clipboard in visual mode
vmap <leader>y "+y

" Return to last edit position when opening files 
augroup LastPosition
  autocmd! BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal! g`\"" |
    \ endif
 augroup END

" Scroll up/down lines from 'scroll' option, default half a screen
map <C-j> <C-d>
map <C-k> <C-u>

" Treat wrapped lines as normal lines
nnoremap j gj
nnoremap k gk

" Disable annoying ex mode (Q)
map Q <nop>

" "Persistent undo. Requires Vim 7.3 
set undodir=$HOME/.vim/undo/            " where to store undofiles
set undofile                            " enable undofile
set undolevels=1000                      " max undos stored
set undoreload=10000                    " buffer stored undos

let g:tagbar_right = 0
let g:tagbar_width = 30
let g:tagbar_status_func = 'TagbarStatusFunc'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_mode_map = {
    \ 'mode': 'active',
    \ 'active_filetypes':
    \ ['c', 'cpp', 'perl', 'python', 'php', 'javascript'] }
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" stuff
set tags+=/home/djfordz/.vim/tags

autocmd BufWritePost *
      \ if filereadable('tags') |
      \   call system('ctags -a '.expand('%')) |
      \ endif

autocmd Filetype php setlocal omnifunc=phpcomplete#Complete
autocmd Filetype cpp setlocal omnifunc=cppcomplete#Complete

"Go compiler
"let g:golang_goroot = "$HOME/go/bin"
