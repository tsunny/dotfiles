execute pathogen#infect()

let mapleader = ','     " Set the leader

" Encoding stuff
set encoding=utf8

" Visual stuff
colorscheme scheakur
set number              " Set line number
set numberwidth=5
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]

syntax enable           " Enable syntax highlighting

" Tab related settings
set expandtab           " tabs are spaces
set softtabstop=4       " number of spaces in tab when editing
set tabstop=4           " number of visual spaces per TAB

" Misc
set visualbell    " stop that ANNOYING beeping

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Search related settings
set ignorecase          " searches are case insensitive.
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
nnoremap <leader><space> :nohlsearch<CR> " turn off search highlight

" Indentation
" set cindent             " Automatically use cindent, Not a good thing
" because it applies the indentation when the code is pasted.. very bad
" Enable filetype plugins
nnoremap <leader>p :set invpaste paste?<CR>
set pastetoggle=<leader>p
"set showmode

filetype plugin on
filetype indent on


" Auto-complete features
" set comments=sl:/*,mb:*,elx:*/  " intelligent comments
set wildmenu            " visual autocomplete for command menu


" Key bindings stuff


" Window management configs
set splitright          " vertical split on the right side

" Airline Stuff

set laststatus=2
let g:airline_theme = 'sol'
let g:airline#extensions#tabline#enabled = 1        " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'    " Show just the filename
let g:airline_powerline_fonts = 1

set hidden                  " This allows buffers to be hidden if you've modified a buffer.  This is almost a must if you wish to use buffers in this way.

" To open a new empty buffer " This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<CR>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>L :bprevious<CR>
" Close the current buffer and move to the previous one " This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>


" CtrlP settings
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']



" Window management functions
nnoremap <C-W>O :call MaximizeToggle()<CR>
nnoremap <C-W>o :call MaximizeToggle()<CR>
nnoremap <C-W><C-O> :call MaximizeToggle()<CR>

" Functions

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

