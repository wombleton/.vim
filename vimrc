" Automatically load ~/.vim/bundle plugin, syntax and colorscheme files with
" pathogen
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" change the mapleader from \ to ,
let mapleader = ","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>rv :so $MYVIMRC<CR>

filetype plugin on
filetype indent on

" Jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Auto-reload modified files (with no local changes)
set autoread

" Turn off backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Spaces not tabs
set tabstop=2
set shiftwidth=2
set expandtab

" Remove trailing whitespace whenever saving files
if has("autocmd")
  au BufWritePre *.rb :%s/\s\+$//e
  au BufWritePre *.js :%s/\s\+$//e
  au BufWritePre *.coffee :%s/\s\+$//e
  au BufWritePre *.java :%s/\s\+$//e
  au BufWritePre *.css :%s/\s\+$//e
  au BufWritePre *.scss :%s/\s\+$//e
  au BufWritePre *.less :%s/\s\+$//e
endif

" Incremental search
set incsearch

" Smart case matching
set smartcase

" Show matching brackets
set showmatch

" Always show line numbers
set number

" Always show status line
set laststatus=2

" Let's see some useful info in the status line
set statusline=%F\ %m%r%w%y\ %=(%L\ loc)\ [#\%03.3b\ 0x\%02.2B]\ \ %l,%v\ \ %P

" Use a dark background
set background=dark

" Use solarized colorscheme
colorscheme neopro

" Riak configs are erlang
if has("autocmd")
  au BufNewFile,BufRead /etc/riak/* setf erlang
endif

" Fix long lines causing pattern matching OOM errors
set maxmempattern=32768

" Allow modelines
set modeline

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
"
" src: http://vim.wikia.com/wiki/Modeline_magic
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d filetype=%s :",
        \ &tabstop, &shiftwidth, &textwidth, &filetype)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
" vim: set ts=2 sw=2 tw=78 filetype=vim :
set vb t_vb=

au BufNewFile,BufRead *.ejs set filetype=html

autocmd FileType tmpl setlocal shiftwidth=4 tabstop=4
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
autocmd FileType ruby setlocal shiftwidth=2 tabstop=2

" buffer
nmap <leader>n<left>   :leftabove  vnew<CR>
nmap <leader>n<right>  :rightbelow vnew<CR>
nmap <leader>n<up>     :leftabove  new<CR>
nmap <leader>n<down>   :rightbelow new<CR>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>

nmap <C-P> :CtrlP<CR>
nmap <C-O> :CtrlPClearCache<CR>
nmap <C-B> :CtrlPMRU<CR>
