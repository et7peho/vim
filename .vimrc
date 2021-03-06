set nocompatible
filetype off

set rtp+=~/vim/bundle/Vundle.vim
call vundle#begin()
" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles

" Show tags
Bundle 'majutsushi/tagbar'
"some default settings
Bundle 'tpope/vim-sensible'
"Qouting
Bundle 'tpope/vim-surround'
"Git wrapper
Bundle 'tpope/vim-fugitive'

"Bundle 'vim-scripts/cscope.vim'
Bundle 'joe-skb7/cscope-maps.git'
"Bundle 'scrooloose/syntastic'
Bundle 'scrooloose/nerdtree'
"Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'tbknl/vimproject'
Bundle 'vivien/vim-linux-coding-style'

"Bundle 'tpope/vim-speeddating'
"Could be good to have
"Bundle 'jreybert/vimagit'
""Git plugin compare with above

"Bundle 'nanotech/jellybeans.vim'
""Colourscheme

Bundle 'powerline/powerline' , {'rtp': 'powerline/bindings/vim/'}

""Tagbar problems
"Bundle 'jceb/vim-orgmode'
"Bundle 'slim-template/vim-slim'
""Maybe gone
"Bundle 'wincent/command-t'
""evaluate
"Bundle 'FooSoft/vim-argwrap'
""More check"

"source /usr/local/share/gtags/gtags.vim
call vundle#end()
filetype plugin indent on

let mapleader=","

colorscheme murphy

set cursorline
set expandtab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=128
set ttyscroll=10
set encoding=utf-8
set tabstop=2
set nowrap
set number
set expandtab
set nowritebackup
set noswapfile
set nobackup
set hlsearch
set ignorecase
set smartcase

" Automatic formatting
autocmd BufWritePre *.c :%s/\s\+$//e
autocmd BufWritePre *.h :%s/\s\+$//e
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.tex :%s/\s\+$//e
autocmd BufWritePre Makefile :%s/\s\+$//e
autocmd BufWritePre .vimrc :%s/\s\+$//e
autocmd BufWritePre vimrc :%s/\s\+$//e
autocmd BufWritePre *.org :%s/\s\+$//e
"autocmd BufWritePre ,org :%s/\s\+$//e

au BufNewFile * set noeol
au BufRead,BufNewFile *.go set filetype=go

" No show command
autocmd VimEnter * set nosc

" Quick ESC
imap jj <ESC>

" Jump to the next row on long lines
map <Down> gj
map <Up>   gk
nnoremap j gj
nnoremap k gk

" format the entire file
nmap <leader>fef ggVG=

" Open new buffers
nmap <leader>s<left>   :leftabove  vnew<cr>
nmap <leader>s<right>  :rightbelow vnew<cr>
nmap <leader>s<up>     :leftabove  new<cr>
nmap <leader>s<down>   :rightbelow new<cr>

" Tab between buffers
noremap <tab> <c-w><c-w>

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" Resize buffers
if bufwinnr(1)
   nmap Ä <C-W><<C-W><
   nmap Ö <C-W>><C-W>>
   nmap ö <C-W>-<C-W>-
   nmap ä <C-W>+<C-W>+
endif

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']


" CtrlP
nnoremap <silent> t :CtrlP<cr>
let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 600
let g:ctrlp_max_depth = 5

" Go programming
"set rtp+=/usr/local/Cellar/go/1.0.3/misc/vim

" Quit with :Q
command -nargs=0 Quit :qa!
syntax on

" fugitive git bindings
nnoremap <space>ga :Git add %:p<CR><CR>
nnoremap <space>gs :Gstatus<CR>
nnoremap <space>gc :Gcommit -v -q<CR>
nnoremap <space>gt :Gcommit -v -q %:p<CR>
nnoremap <space>gd :Gdiff<CR>
nnoremap <space>ge :Gedit<CR>
nnoremap <space>gr :Gread<CR>
nnoremap <space>gw :Gwrite<CR><CR>
nnoremap <space>gl :silent! Glog<CR>:bot copen<CR>
nnoremap <space>gp :Ggrep<Space>
nnoremap <space>gm :Gmove<Space>
nnoremap <space>gb :Git branch<Space>
nnoremap <space>go :Git checkout<Space>
nnoremap <space>gps :Dispatch! git push<CR>
nnoremap <space>gpl :Dispatch! git pull<CR>

set autochdir
"set tags=tags;
set tabstop=3
set softtabstop=3
" size of an "indent"
set shiftwidth=3
" make "tab" insert indents instead of tabs at the beginning of a line
set smarttab

" always uses spaces instead of tab characters
set expandtab
nmap <F8> :TagbarToggle<CR>
map <C-n> :NERDTreeToggle<CR>


autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
"autocmd BufRead,BufNewFile *.md setlocal spell
"set complete+=kspell
"setlocal spell spelllang=en_us
" from
" " http://vim.wikia.com/wiki/Automatically_open_the_quickfix_window_on_:make
" " Command Make will call make and then cwindow which
" " " opens a 3 line error window if any errors are found.
" " " If no errors, it closes any open cwindow.
command -nargs=* Make make <args> | cwindow 3
map <Leader>j :Make<CR>
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow
"set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
"set errorformat=%f:%l:\ %m

"Below Need more love
" Syntastic
let g:syntastic_mode_map = { 'mode': 'active' }
"let g:syntastic_ruby_exec = '~/.rvm/rubies/ruby-2.0.0-p0/bin/ruby'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
"syntastic-checkers-c
"
set number
set relativenumber
noremap Y y$
nnoremap <leader>q :ArgWrap<CR>
function! LoadCscope()
   let db = findfile("cscope.out", ".;")
   if (!empty(db))
      let path = strpart(db, 0, match(db, "/cscope.out$"))
      set nocscopeverbose " suppress 'duplicate connection' error
      exe "cs add " . db . " " . path
      set cscopeverbose
   endif
endfunction
au BufEnter /* call LoadCscope()
