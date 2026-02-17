" Set up vim-plug. Note: do `:PlugInstall` in vim after adding plugins here
call plug#begin()
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
call plug#end()
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.tsx

" Show a colored line at 100 characters:
":set colorcolumn=100
":highlight ColorColumn ctermbg=lightgrey guibg=lightgrey

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Toby
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:inoremap jk <esc>
:inoremap jj <esc>
:inoremap kk <esc>
:inoremap hhh <esc>
:inoremap lll <esc>

let mapleader = " "

" Clear search highlighting on escape
nnoremap <leader><space> :noh<return><esc>

" Don't break words with linewrap
set linebreak

set statusline=\ 
set statusline+=%{HasPaste()}
set statusline+=今回\ %F%m%r%h\ %w\ \ 
set statusline+=付近\ %r%{getcwd()}
set statusline+=%h
set statusline+=%=
set statusline+=方向\ %l\ /\ %L\ :\ %c\ 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Sets how many lines of history VIM has to remember
set history=10000
"
" " Enable filetype plugins
" filetype plugin on
" filetype indent on
"
" " Set to auto read when a file is changed from the outside
set autoread
"
" " With a map leader it's possible to do extra key combinations
" " like <leader>w saves the current file
" let mapleader = ","
" let g:mapleader = ","
"
" " Fast saving
" nmap <leader>w :w!<cr>
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Set 5 lines to the cursor - when moving vertically using j/k
set so=5
"
" " Turn on the WiLd menu
" set wildmenu
"
" " Ignore compiled files
" set wildignore=*.o,*~,*.pyc
"
" "Always show current position
set ruler
"
" " Height of the command bar
" set cmdheight=2
"
" " A buffer becomes hidden when it is abandoned
set hid
"
" " Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
"
" " Ignore case when searching
" set ignorecase
"
" " When searching try to be smart about cases 
" set smartcase
"
" " Highlight search results
set hlsearch
"
" " Makes search act like search in modern browsers
" set incsearch
"
" " Don't redraw while executing macros (good performance config)
set lazyredraw
"
" " For regular expressions turn magic on
" set magic
"
" " Show matching brackets when text indicator is over them
set showmatch
" " How many tenths of a second to blink when matching brackets
set mat=2
"
" " No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Enable syntax highlighting
syntax enable
"
" colorscheme desert
" set background=dark
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Use spaces instead of tabs
set expandtab
"
" " Be smart when using tabs ;)
set smarttab
"
" " 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4
"
" " Linebreak on 500 characters
" set lbr
" set tw=500
"
set ai "Auto indent
set si "Smart indent
" set wrap "Wrap lines
"
"
""""""""""""""""""""""""""""""
" " => Visual mode related
""""""""""""""""""""""""""""""
" " Visual mode pressing * or # searches for the current selection
" " Super useful! From an idea by Michael Naumann
" vnoremap <silent> * :call VisualSelection('f')<CR>
" vnoremap <silent> # :call VisualSelection('b')<CR>
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk
"
" " Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?
"
" " Disable highlight when <leader><cr> is pressed
" map <silent> <leader><cr> :noh<cr>
"
" " Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
"
" " Close the current buffer
" map <leader>bd :Bclose<cr>
"
" " Close all the buffers
" map <leader>ba :1,1000 bd!<cr>
"
" " Useful mappings for managing tabs
" map <leader>tn :tabnew<cr>
" map <leader>to :tabonly<cr>
" map <leader>tc :tabclose<cr>
" map <leader>tm :tabmove
"
" " Opens a new tab with the current buffer's path
" " Super useful when editing files in the same directory
" map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
"
" " Switch CWD to the directory of the open buffer
" map <leader>cd :cd %:p:h<cr>:pwd<cr>
"
" Remember info about open buffers on close
" set viminfo^=%
"
"
""""""""""""""""""""""""""""""
" " => Status line
""""""""""""""""""""""""""""""
" " Always show the status line
set laststatus=2
"
" " Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ Line:\ %l
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Remap VIM 0 to first non-blank character
map 0 ^
"
" " Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
" nmap <M-j> mz:m+<cr>`z
" nmap <M-k> mz:m-2<cr>`z
" vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" When you press gv you vimgrep after the selected text
" vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Open vimgrep and put the cursor in the right position
" map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>

" Vimgreps in the current file
" map <leader><space> :vimgrep //
" <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" " When you press <leader>r you can search and replace the selected text
" vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
"
" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
" map <leader>cc :botright cope<cr>
" map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
" map <leader>n :cn<cr>
" map <leader>p :cp<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
" map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
" map <leader>sn ]s
" map <leader>sp [s
" map <leader>sa zg
" map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Remove the Windows ^M - when the encodings gets messed up
" noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" " Quickly open a buffer for scripbble
" map <leader>q :e ~/buffer<cr>

" " Toggle paste mode on and off
" map <leader>pp :setlocal paste!<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

