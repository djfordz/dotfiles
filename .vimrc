" This must be first, because it changes other options as a side effect.
set nocompatible
execute pathogen#infect()
execute pathogen#helptags()
filetype plugin indent on                   " detect file plugin+indent
syntax on                                   " syntax highlighting
colorscheme jellybeans 
highlight Search guifg=Black guibg=Red gui=bold

" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow
" force behavior and filetypes, and by extension highlighting 
augroup FileTypeRules
autocmd!
autocmd BufNewFile,BufRead *.md set ft=markdown tw=79
autocmd BufNewFile,BufRead *.tex set ft=tex tw=79
autocmd BufNewFile,BufRead *.txt set ft=sh tw=79
augroup END
" 256 colors for maximum jellybeans bling. See commit log for info 
if (&term =~ "xterm") || (&term =~ "screen")
  set t_Co=256
endif
" Custom highlighting, where NONE uses terminal background 
function! CustomHighlighting()
   highlight Normal ctermbg=NONE
   highlight NonText ctermbg=NONE
   highlight LineNr ctermbg=NONE
   highlight SignColumn ctermbg=NONE
   highlight SignColumn guibg=#151515
   highlight CursorLine ctermbg=235
endfunction

call CustomHighlighting()

let mapleader = ","
map <leader>nt :execute 'NERDTreeToggle ' . getcwd()<CR>
map <leader>nn :NERDTree %<CR>
map <leader>ns :setlocal nospell<CR>
map <leader>ss :setlocal spell<CR>
map <leader>nl :set invnumber<CR>
map <Leader>fc :call OpenFactoryFile()<CR>
map <leader>f :CommandT<CR>
map <Leader>vi :tabe ~/.vimrc<CR>
map <Leader>sp :set paste<CR>
map <Leader>np :set nopaste<CR>
map <Leader>vr :rightbelow vnew
map <Leader>sr :rightbelow vnew ~/.vim/bundle/vim-snippets/snippets/ruby.snippets<CR>
map <Leader>sj :rightbelow vnew ~/.vim/bundle/vim-snippets/snippets/javascript.snippets<CR>
map <Leader>sc :rightbelow vnew ~/.vim/bundle/vim-snippets/snippets/coffee.snippets<CR>
map <Leader>ser :rightbelow vnew ~/.vim/bundle/vim-snippets/snippets/eruby.snippets<CR>
map <Leader>wd :set textwidth=78<CR>
map <Leader>ww ggVG<CR> " Visual block the whole page
map <Leader>wv ggVGgq<CR> " Format entire page with textwidth=78
map <Leader>c :w<cr>:call CopyToOSClipboard()<CR>
map <Leader>rg :reg<CR>
map <Leader>dt :w<cr>:call RunCurrentTest('!ts spec/dummy/bin/rspec')<CR>
map <Leader>dl :w<cr>:call RunCurrentLineInTest('!ts spec/dummy/bin/rspec')<CR>
map <Leader>st :w<cr>:call RunCurrentTest('!ts bin/rspec')<CR>
map <Leader>sl :w<cr>:call RunCurrentLineInTest('!ts bin/rspec')<CR>
map <Leader>rt :w<cr>:call RunCurrentTest('!ts be rspec')<CR>
map <Leader>rl :w<cr>:call RunCurrentLineInTest('!ts be rspec')<CR>
map <Leader>zr :w<cr>:call RunCurrentTest('!ts zeus rspec')<CR>
map <Leader>zl :w<cr>:call RunCurrentLineInTest('!ts zeus rspec')<CR>
map <Leader>rn :call RenameFile()<cr>
map <Leader>pp :set paste<CR>o<esc>"*]p:set nopaste<cr> " paste from clipboard

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>ee :e <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>se :split <C-R>=expand("%:p:h") . '/'<CR>
map <Leader>ve :vnew <C-R>=expand("%:p:h") . '/'<CR>

" DirDiff settings
let g:DirDiffExcludes = "system,CVS,*.class,*.exe,.*.swp"
let g:DirDiffIgnore = 'Id:,Revision:,Date:,File:,\\\$Id'
let g:DirDiffAddArgs = "-w"
" Catch the transition to diff mode
au FilterWritePre * if &diff | exe 'noremap <space> ]cz.' | exe 'noremap <S-space> [cz.' | endif
au FilterWritePre * if &diff | exe 'noremap <leader>dg :diffget<CR>' | exe 'noremap <leader>dp :diffput<CR>' | endif
au FilterWritePre * if &diff | exe 'nmap <leader>du :wincmd l<CR>:normal u<CR>:wincmd h<CR>' | endif
au FilterWritePre * if &diff | exe 'set diffopt=filler,context:1000,iwhite' | exe 'execute "normal \<c-w>\<c-w>"' | endif

set ssop-=options  " do not store global and local values in a session" 
set diffexpr=MyDiff()
function MyDiff()
   let opt = ""
   if &diffopt =~ "icase"
     let opt = opt . "-i "
   endif
   if &diffopt =~ "iwhite"
     let opt = opt . "--ignore-all-space "
   endif
   silent execute "!diff -a --binary " . opt . v:fname_in . " " . v:fname_new .
    \  " > " . v:fname_out
endfunction
" End DirDiff settings
" Indenting options
set comments +=fb:*,fb:[-],fb:[+]
set fo +=n
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" Interface general
set cursorline                              " hilight cursor line
set more                                    " ---more--- like less
set number                                  " line numbers
set scrolloff=3                             " lines above/below cursor
set showcmd                                 " show cmds being typed
set title                                   " window title
set vb t_vb=                                " disable beep and flashing
set wildignore=*.a,*.o,*.so,*.pyc,*.jpg,
    \*.jpeg,*.png,*.gif,*.pdf,*.git,
    \*.swp,*.swo                    " tab completion ignores
set wildmenu                                " better auto complete
set wildmode=longest,list                   " bash-like auto complete
" General settings {{{
set hidden                                      " buffer change, more undo
set iskeyword+=_,$,@,%,#                        " not word dividers
set laststatus=2                                " always show statusline
set linebreak                                   " don't cut words on wrap
set listchars=tab:>\                            " > to highlight <tab>
set list                                        " displaying listchars
set mouse=a                                     " ena mouse
set noshowmode                                  " hide mode cmd line
set noexrc                                      " don't use other .*rc(s)
set nostartofline                               " keep cursor column pos
set nowrap                                      " don't wrap lines
set numberwidth=5                               " 99999 lines
set shortmess+=I                                " disable startup message
set splitbelow                                  " splits go below w/focus
set splitright                                  " vsplits go right w/focus
set ttyfast                                     " for faster redraws etc
set ttymouse=xterm2                             " experimental

map <C-h> :nohl<cr>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
" Make 'Y' consistent with 'C' & 'D'
nnoremap Y y$
" Search and replace 
set gdefault                                " default s//g (global)
set incsearch                               " live-search
" Matching 
set matchtime=2                             " time to blink match {}
set matchpairs+=<:>                         " for ci< or ci>
set showmatch                               " tmpjump to match-bracket
" Return to last edit position when opening files 
augroup LastPosition
  autocmd! BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \     exe "normal! g`\"" |
    \ endif
 augroup END
" Files 
set autochdir                                   " always use curr. dir.
set autoread                                    " refresh if changed
set confirm                                     " confirm changed files
set noautowrite                                 " never autowrite
set nobackup                                    " disable backups
" Persistent undo. Requires Vim 7.3 
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
" Text formatting 
set autoindent                                  " preserve indentation
set backspace=indent,eol,start                  " smart backspace
set cinkeys-=0#                                 " don't force # indentation
set expandtab                                   " no real tabs
set ignorecase                                  " by default ignore case
set nrformats+=alpha                            " incr/decr letters C-a/-x
set shiftround                                  " be clever with tabs
set shiftwidth=4                                " default 8
set smartcase                                   " sensitive with uppercase
set smarttab                                    " tab to 0,4,8 etc.
set softtabstop=4                               " "tab" feels like <tab>
set tabstop=4                                   " replace <TAB> w/4 spaces
set noswapfile
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set complete+=kspell
set tabstop=4
set expandtab
set winheight=999 " new window always opens fully expanded
set hlsearch
set scrolljump=5
set nofoldenable " Say no to code folding...
let $BASH_ENV = "~/.bash_profile"

map <C-h> :nohl<cr>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
" Make 'Y' consistent with 'C' & 'D'
nnoremap Y y$

" ----- Window & Tab movement -----
" Switch/toggle between split windows
map <leader>w <c-w>w
" Go to left vertical split
map <leader>h <c-w>h<c-w><cr>
" Go to right vertical split
map <leader>l <c-w>l<c-w><cr>
" Map up and down to horizontal split
map <S-j> <C-W>j<C-W>_
map <S-k> <C-W>k<C-W>_
" remap the tab movement
map <S-l> gt
map <S-h> gT
" For Win32 Ctrl-y gets remapped to Ctrl-r (redo) Don't want that -- need to edit mswin.vim
set wmh=0 " split don't have that xtra line
" ---- Toggle between the last two active tabs
let g:lasttab = 1
nmap <Leader>t :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" ---- Show tab number on the tabline
if exists("+showtabline") 
     function MyTabLine() 
         let s = '' 
         let t = tabpagenr() 
         let i = 1 
         while i <= tabpagenr('$') 
             let buflist = tabpagebuflist(i) 
             let winnr = tabpagewinnr(i) 
             let s .= '%' . i . 'T' 
             let s .= (i == t ? '%1*' : '%2*') 
             let s .= ' ' 
             let s .= i . ')' 
             "let s .= winnr . '/' . tabpagewinnr(i,'$') 
             let s .= ' %*' 
             let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#') 
             let file = bufname(buflist[winnr - 1]) 
             let file = fnamemodify(file, ':p:t') 
             if file == '' 
                 let file = '[No Name]' 
             endif 
             let s .= file 
             let i = i + 1 
         endwhile 
         let s .= '%T%#TabLineFill#%=' 
         let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X') 
         return s 
     endfunction 
     set stal=2 
     set tabline=%!MyTabLine() 
endif 

map Q gq

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunCurrentTest(rspec_type)
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!bin/cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner(a:rspec_type)
      exec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner(a:rspec_type)
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest(rspec_type)
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  exec a:rspec_type g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
endfunction

function! OpenFactoryFile()
if filereadable("test/factories.rb")
  execute ":sp test/factories.rb"
else
  execute ":sp spec/factories.rb"
end
endfunction

function! CopyToOSClipboard()
  exec(":silent !cat % | pbcopy")
  :redraw!
endfunction

fun! SetTextFile()
  let in_minimul_dir = match(expand("%"), 'www\/minimul\/data') != -1
  if in_minimul_dir
    return
  end
  setlocal textwidth=78
endfun

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Only auto-comment newline for block comments {{{
augroup AutoBlockComment
autocmd! FileType c,cpp setlocal comments -=:// comments +=f://
augroup END
if has("patch-7.3.541")
    set formatoptions+=j
endif
" General {{{
set wrap linebreak nolist

" Scroll up/down lines from 'scroll' option, default half a screen
map <C-j> <C-d>
map <C-k> <C-u>

" Treat wrapped lines as normal lines
nnoremap j gj
nnoremap k gk

" Disable annoying ex mode (Q)
map Q <nop>

" Buffers, preferred over tabs now with bufferline.
nnoremap gn :bnext<CR>
nnoremap gN :bprevious<CR>
nnoremap gd :bdelete<CR>
nnoremap gf <C-^>
" Toggle syntax highlighting {{{
function! ToggleSyntaxHighlighthing()
 if exists("g:syntax_on")
   syntax off
 else
   syntax on
   call CustomHighlighting()
 endif
endfunction

nnoremap <leader>s :call ToggleSyntaxHighlighthing()<CR>
" Toggle tagbar (definitions, functions etc.)
map <F1> :TagbarToggle<CR>

" Toggle pastemode, doesn't indent
set pastetoggle=<F3>

" Syntastic - toggle error list. Probably should be toggleable.
noremap <silent><leader>lo :Errors<CR>
noremap <silent><leader>lc :lcl<CR>
" CtrlP - don't recalculate files on start (slow)
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode = 'ra'

" TagBar
let g:tagbar_left = 0
let g:tagbar_width = 30

" Syntastic - This is largely up to your own usage, and override these
"             changes if be needed. This is merely an exemplification.
"             TODO: not be filetype, but filename?
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_compiler_options = ' -std=c++0x'
let g:syntastic_mode_map = {
    \ 'mode': 'passive',
    \ 'active_filetypes':
    \ ['c', 'cpp', 'perl', 'python', 'php'] }

" Lightline {{{
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
            \ "\<C-v>" : 'V-B',
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE (thanks Gary Bernhardt)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

"""""""""""""""""""""""""""""""""

let g:SuperTabDefaultCompletionType = "context"
autocmd FileType *
    \ if &omnifunc != '' |
    \   call SuperTabChain(&omnifunc, "<c-p>") |
    \ endif
