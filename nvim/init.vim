" N(eo)VIMRC

"call plug#begin(expand('%:p:h') . '/plugged')
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdcommenter'
Plug 'mileszs/ack.vim'                " depends on system ack
Plug 'tpope/vim-surround'
Plug 'tmhedberg/SimpylFold'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'jmcantrell/vim-virtualenv'

Plug 'groenewege/vim-less'
Plug 'kchmck/vim-coffee-script'

Plug 'altercation/vim-colors-solarized'
Plug 'gilgigilgil/anderson.vim'
Plug 'sjl/gundo.vim'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

Plug 'lepture/vim-jinja'
Plug 'maksimr/vim-jsbeautify'

Plug 'benekastah/neomake'
Plug 'Arkham/vim-quickfixdo'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-abolish'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Add plugins to &runtimepath
call plug#end()


set background=dark
"colorscheme solarized
let mapleader = "\<Space>"
let maplocalleader = "\\"

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start

syntax on
set autoindent
set smartindent

set showmatch
"set lazyredraw
nnoremap j gj
nnoremap k gk

set number
set ruler
set wildmenu
set wildmode=longest:full,full
set listchars=nbsp:ϟ,eol:¬,tab:▸.,trail:•,extends:»,precedes:«

set hlsearch
set incsearch

set tabpagemax=128

" See `:h Y`
nnoremap Y y$

" Save files faster
nnoremap <leader>w :w<CR>
nnoremap <leader>wa :wall<CR>

" Fix quick write/quit
command! Wq wq
command! WQ wq
command! W w
command! Q q
" no need for Ex mode
nnoremap Q <Nop> 

" Quickly (t)oggle common settings
nnoremap <silent> <leader>th :set hlsearch!<CR>:set hlsearch?<CR>
nnoremap <leader>tl :set list!<CR>:set list?<CR>
nnoremap <leader>tn :set number!<CR>:set number?<CR>
nnoremap <leader>tp :set paste!<CR>:set paste?<CR>
nnoremap <leader>tw :set wrap!<CR>:set wrap?<CR>
nnoremap <leader>tsp :set spell!<CR>:set spell?<CR>
" fix window height/width, keeps other windows from messing with it
nnoremap <leader>tfw :set wfh!<CR>:set wfw!<CR>:set winfixwidth?<CR>

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.jy set filetype=python
autocmd BufNewFile,BufReadPost *.eco set filetype=html

au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm,*.nunj set ft=jinja

autocmd Filetype gitcommit setlocal spell textwidth=72

" Window Movement Mappings - Make switching windows easier
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

"tnoremap <Esc> <C-\><C-n>

" Resize panes more than one line at a time
nnoremap <silent> + :exe "resize " . (winheight(0) * 10/9)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 9/10)<CR>
nnoremap <silent> > :exe "vertical resize " . (winwidth(0) * 10/9)<CR>
nnoremap <silent> < :exe "vertical resize " . (winwidth(0) * 9/10)<CR>

" quick python helpers
iabbrev pyta import pytest<cr>@pytest.mark.a 
iabbrev pytdb import ipdb; ipdb.set_trace()


if !exists("*OpenTestFile")
    " Implement filetype specific in `./autoload/ft/open_test_file.vim`
    " TODO: Remove need to duplicate mapping in ft file
    function OpenTestFile()
        echo "Not Implemented"
    endfunction
endif

nnoremap <leader>ot :call OpenTestFile()<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ack!
nnoremap <leader>a :Ack! 
nnoremap <leader>A :AckFromSearch<CR>

" YouCompleteMe
"nnoremap <silent> <leader>g  :YcmCompleter GoTo<CR>

" Close scratch preview
"autocmd CompleteDone * pclose
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"nnoremap <leader>pc :pclose<CR>

let g:ycm_autoclose_preview_window_after_insertion = 1

if filereadable(expand($HOME . "/.nvimrc.local"))
  source ~/.nvimrc.local
endif


let g:NERDCustomDelimiters = {
  \ 'jinja': { 'left': '{#', 'right': '#}' },
  \ }
