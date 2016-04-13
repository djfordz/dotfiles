" Make Vim more useful, but less Vi compatible
set nocompatible

" Start pathogen
execute pathogen#infect()
execute pathogen#helptags()

filetype plugin indent on                   " detect file plugin+indent
syntax on                                   " syntax highlighting

" 256 colors 
if (&term =~ "xterm") || (&term =~ "screen")
  set t_Co=256
endif

" Colorscheme
set background=dark
colorscheme PaperColor

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

" set leader
let mapleader = ","

" Toggle paste mode (F2)
set pastetoggle=<F2>

" Write a file with sudo (w!!)
cmap w!! w !sudo tee % >/dev/null

" Escape (kj)
inoremap kj <Esc>

" Toggle relative line numbers (Ctrl+n)
function! g:ToggleNuMode()
  if &nu == 1
     set rnu
  else
     set nu
  endif
endfunction
nnoremap <silent><C-n> :call g:ToggleNuMode()<cr>

" Mappings "
""""""""""""
map <leader>nt :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>nn :NERDTree %<CR>
map <leader>ns :setlocal nospell<CR>
map <leader>ss :setlocal spell<CR>
map <leader>nl :set invnumber<CR>
map <leader>f :CommandT<CR>
map <Leader>sp :set paste<CR>
map <Leader>np :set nopaste<CR>
map <Leader>vr :rightbelow vnew

" snippets
map <Leader>sn :rightbelow vnew ~/.vim/bundle/vim-snippets/snippets/php.snippets<CR>
map <Leader>ss :rightbelow vnew ~/.vim/bundle/vim-snippets/snippets/sql.snippets<CR>
map <Leader>sx :rightbelow vnew ~/.vim/bundle/vim-snippets/snippets/xml.snippets<CR>
map <Leader>sjq :rightbelow vnew ~/.vim/bundle/vim-snippets/snippets/javascript/javascript-jquery.snippets<CR>
map <leader>sj :rightbelow vnew ~/.vim/bundle/vim-snippets/snippets/javascript/javascript.snippets<CR>
map <Leader>pp :set paste<CR>o<esc>"*]p:set nopaste<cr> " paste from clipboard
map <Leader>ee :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>se :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>ve :vnew <C-R>=expand("%:p:h") . '/'<CR>

"paste from system clipboard in insert mode (Ctrl+v)
imap <C-V> <ESC>"+gpa
" Yank WORD to system clipboard in normal mode
nmap <leader>y "+yE

" Yank selection to system clipboard in visual mode
vmap <leader>y "+y

" Spell check
map <leader>s :setlocal spell! spelllang=en_us<cr>


" move by screen line rather than file line (for wrapping).
nnoremap j gj
nnoremap k gk
" remap colon to semicolon.
nnoremap ; :

" set smooth scrolling
:map <C-U> <C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y><C-Y>
:map <C-D> <C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E><C-E>

" Move between windows with CTRL and navigation keys.
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l

map <C-h> :nohl<cr>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

if has('persistent_undo') && exists("&undodir")
   set undodir=$HOME/.vim/undo/            " where to store undofiles
   set undofile                            " enable undofile
   set undolevels=500                      " max undos stored
   set undoreload=10000                    " buffer stored undos
endif
" https://github.com/tejr/dotfiles/blob/master/vim/vimrc 
if !strlen($SUDO_USER)
 set directory^=$HOME/.vim/swap//        " default cwd, // full path
 set swapfile                            " enable swap files
 set updatecount=50                      " update swp after 50chars
" Don't swap tmp, mount or network dirs 
 augroup SwapIgnore
 autocmd! BufNewFile,BufReadPre /tmp/*,/mnt/*,/media/*
    \ setlocal noswapfile
    augroup END
else
    set noswapfile                          " dont swap sudo'ed files
endif

" Return to last edit position when opening files 
augroup LastPosition
  autocmd! BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal! g`\"" |
    \ endif
 augroup END

" Make backspace work like other apps
set backspace=2

" Display cursor position
set ruler

" Show the status line
set laststatus=2

" Automatically save before commands like :next and :make
set autowrite

" Show the editor mode
set showmode

" Show state of keyboard input
set showcmd

" Allow mouse (is this sacrilege?)
set mouse=a

" Use wildmenu for command line tab completion
set wildmenu
set wildmode=list:longest,full

" Underline the current line
set cursorline

" Allow modified buffers to go to the background
set hidden

" The TTY is fast
set ttyfast

" Set the minimum number of lines to keep above and below cursor
set scrolloff=5

""""""""""""""""
" Line Numbers "
""""""""""""""""

" Default to absolute line numbers.
set nu


""""""""
" Tabs "
""""""""

" Tabs should be 4-spaces
set tabstop=4
set shiftwidth=4

" Use spaces instead of tabs
set expandtab

"  Show > for tab
set listchars=tab:>-

" 4 spaces is a tab, so backspace will work properly
set softtabstop=4

" Follow line indentation
set autoindent


""""""""""
" Search "
""""""""""

" Turn on search highlighting
set showmatch
set hlsearch

" Ignore case in searches -- but be smart!
set ignorecase
set smartcase

" Start searching as the characters are typed
set incsearch

set wrap linebreak nolist

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

" Buffers, preferred over tabs now with bufferline.
nnoremap gn :bnext<CR>
nnoremap gN :bprevious<CR>
nnoremap gd :bdelete<CR>
nnoremap gf <C-^>

map <F1> :TagbarToggla<CR>

set pastetoggle=<F3>

noremap <silent><leader>lo :Errors<CR>
noremap <silent><leader>lc :lcl<CR>


let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode = 'ra'

let g:tagbar_left = 0
let g:tagbar_width = 30

let g:syntastic_mode_map = {
    \ 'mode': 'active',
    \ 'active_filetypes':
    \ ['c', 'cpp', 'perl', 'python', 'php'] }

let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ 'active': {
    \     'left': [
    \         ['mode', 'paste'],
    \         ['readonly', 'fugitive'],
    \         ['ctrlpmark', 'bufferline']
    \     ],
        \     'right': [
        \         ['lineinfo'],
        \         ['percent'],
        \         ['fileformat', 'fileencoding', 'filetype', 'syntastic']
        \     ]
        \ },
        \ 'component': {
        \     'paste': '%{&paste?"!":""}'
        \ },
        \ 'component_function': {
        \     'mode'         : 'MyMode',
        \     'fugitive'     : 'MyFugitive',
        \     'readonly'     : 'MyReadonly',
        \     'ctrlpmark'    : 'CtrlPMark',
        \     'bufferline'   : 'MyBufferline',
        \     'fileformat'   : 'MyFileformat',
        \     'fileencoding' : 'MyFileencoding',
        \     'filetype'     : 'MyFiletype'
        \ },
        \ 'component_expand': {
        \     'syntastic': 'SyntasticStatuslineFlag',
        \ },
        \ 'component_type': {
        \     'syntastic': 'middle',
        \ },
        \ 'subseparator': {
        \     'left': '|', 'right': '|'
        \ }
        \ }

        let g:lightline.mode_map = {
            \ 'n'      : ' N ',
            \ 'i'      : ' I ',
            \ 'R'      : ' R ',
            \ 'v'      : ' V ',
            \ 'V'      : 'V-L',
            \ 'c'      : ' C ',
            \ 's'      : ' S ',
            \ 'S'      : 'S-L',
            \ "\<C-s>" : 'S-B',
            \ '?'      : '      ' }

        function! MyMode()
            let fname = expand('%:t')
            return fname == '__Tagbar__' ? 'Tagbar' :
                    \ fname == 'ControlP' ? 'CtrlP' :
                    \ winwidth('.') > 60 ? lightline#mode() : ''
        endfunction

        function! MyFugitive()
            try
                if expand('%:t') !~? 'Tagbar' && exists('*fugitive#head')
                    let mark = '± '
                    let _ = fugitive#head()
                    return strlen(_) ? mark._ : ''
                endif
            catch
            endtry
            return ''
        endfunction

        function! MyReadonly()
            return &ft !~? 'help' && &readonly ? '≠' : '' " or ⭤
        endfunction

        function! CtrlPMark()
            if expand('%:t') =~ 'ControlP'
                call lightline#link('iR'[g:lightline.ctrlp_regex])
                return lightline#concatenate([g:lightline.ctrlp_prev, g:lightline.ctrlp_item
                    \ , g:lightline.ctrlp_next], 0)
            else
                return ''
            endif
        endfunction

        function! MyBufferline()
            call bufferline#refresh_status()
            let b = g:bufferline_status_info.before
            let c = g:bufferline_status_info.current
            let a = g:bufferline_status_info.after
            let alen = strlen(a)
            let blen = strlen(b)
            let clen = strlen(c)
            let w = winwidth(0) * 4 / 11
            if w < alen+blen+clen
                let whalf = (w - strlen(c)) / 2
                let aa = alen > whalf && blen > whalf ? a[:whalf] : alen + blen < w - clen || alen < whalf ? a : a[:(w - clen - blen)]
                let bb = alen > whalf && blen > whalf ? b[-(whalf):] : alen + blen < w - clen || blen < whalf ? b : b[-(w - clen - alen):]
                return (strlen(bb) < strlen(b) ? '...' : '') . bb . c . aa . (strlen(aa) < strlen(a) ? '...' : '')
            else
                return b . c . a
            endif
        endfunction

        function! MyFileformat()
            return winwidth('.') > 90 ? &fileformat : ''
        endfunction

        function! MyFileencoding()
            return winwidth('.') > 80 ? (strlen(&fenc) ? &fenc : &enc) : ''
        endfunction

        function! MyFiletype()
            return winwidth('.') > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
        endfunction

        let g:ctrlp_status_func = {
            \ 'main': 'CtrlPStatusFunc_1',
            \ 'prog': 'CtrlPStatusFunc_2',
            \ }

        function! CtrlPStatusFunc_1(focus, byfname, regex, prev, item, next, marked)
            let g:lightline.ctrlp_regex = a:regex
            let g:lightline.ctrlp_prev = a:prev
            let g:lightline.ctrlp_item = a:item
            let g:lightline.ctrlp_next = a:next
            return lightline#statusline(0)
        endfunction

        function! CtrlPStatusFunc_2(str)
            return lightline#statusline(0)
        endfunction

        let g:tagbar_status_func = 'TagbarStatusFunc'

        function! TagbarStatusFunc(current, sort, fname, ...) abort
            let g:lightline.fname = a:fname
            return lightline#statusline(0)
        endfunction

        function! s:syntastic()
            SyntasticCheck
            call lightline#update()
        endfunction

        augroup AutoSyntastic
            autocmd!
            execute "autocmd FileType " .
                        \join(g:syntastic_mode_map["active_filetypes"], ",") .
                        \" autocmd BufWritePost <buffer> :call s:syntastic()"
        augroup END

" PHP namespaces "
"""""""""""""""""""
function! IPhpInsertUse()
    call PhpInsertUse()
        call feedkeys('a',  'n')
    endfunction
    autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
    autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>


function! IPhpExpandClass()
        call PhpExpandClass()
            call feedkeys('a', 'n')
        endfunction
        autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
        autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>

autocmd FileType php inoremap <Leader>s <Esc>:call PhpSortUse()<CR>
autocmd FileType php noremap <Leader>s :call PhpSortUse()<CR>

  
" Temporary Files "
"""""""""""""""""""
" https://gist.github.com/tejr/5890634

" Don't backup files in temp directories or shm
if exists('&backupskip')
    set backupskip+=/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
endif

" Don't keep swap files in temp directories or shm
if has('autocmd')
    augroup swapskip
        autocmd!
        silent! autocmd BufNewFile,BufReadPre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
            \ setlocal noswapfile
    augroup END
endif

" Don't keep undo files in temp directories or shm
if has('persistent_undo') && has('autocmd')
    augroup undoskip
        autocmd!
        silent! autocmd BufWritePre
            \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
            \ setlocal noundofile
    augroup END
endif

" Don't keep viminfo for files in temp directories or shm
if has('viminfo')
    if has('autocmd')
        augroup viminfoskip
            autocmd!
            silent! autocmd BufNewFile,BufReadPre
                \ /tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*
                \ setlocal viminfo=
        augroup END
    endif
endif
