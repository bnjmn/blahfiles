" N(eo)VIM run commands
" by bnjmn


if has('nvim')
    let g:plug_home = expand('<sfile>:p:h') . '/plugged'
else
    let g:plug_home = expand('<sfile>:p:h') . '/pluggedVim'
endif
call plug#begin()

" tpope
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-abolish'

" others
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim'
Plug 'airblade/vim-gitgutter'
Plug 'jmcantrell/vim-virtualenv'
Plug 'Arkham/vim-quickfixdo'
Plug 'mileszs/ack.vim'                        " depends on system ack
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif

" colors
Plug 'ap/vim-css-color'
Plug 'altercation/vim-colors-solarized'
Plug 'gilgigilgil/anderson.vim'

" syntax
Plug 'lepture/vim-jinja'
Plug 'groenewege/vim-less'
Plug 'kchmck/vim-coffee-script'
Plug 'hail2u/vim-css3-syntax'
Plug 'pangloss/vim-javascript'

call plug#end()

""""""""""""""""""""""""""
" PLUGIN Settings
""""""""""""""""""""""""""

" Ack!
nnoremap <leader>a :Ack! 
nnoremap <leader>A :AckFromSearch<CR>


" NerdCommenter
let g:NERDCustomDelimiters = {
  \ 'jinja': { 'left': '{#', 'right': '#}' },
  \ }


" Deoplete
let g:deoplete#enable_at_startup = 1

" deoplete Tab navigation
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ deoplete#mappings#manual_complete()
function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

" Close scratch preview
"autocmd CompleteDone * pclose
"autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
"autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"nnoremap <leader>pc :pclose<CR>


let mapleader = "\<Space>"
let maplocalleader = "\\"

set background=dark
if has#colorscheme('solarized')
    colorscheme solarized
else
    colorscheme pablo
endif

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set backspace=indent,eol,start
set nojoinspaces

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
" to the window, to the
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
autocmd BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm,*.nunj set filetype=jinja

autocmd Filetype gitcommit setlocal spell textwidth=72

" Window Movement Mappings - Make switching windows easier
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

if has('nvim')
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
    "tnoremap <Esc> <C-\><C-n>
endif


" Resize panes more than one line at a time
nnoremap <silent> + :exe "resize " . (winheight(0) * 10/9)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 9/10)<CR>
nnoremap <silent> > :exe "vertical resize " . (winwidth(0) * 10/9)<CR>
nnoremap <silent> < :exe "vertical resize " . (winwidth(0) * 9/10)<CR>


if !exists("*OpenTestFile")
    " Implement filetype specific in `./autoload/ft/open_test_file.vim`
    " TODO: Remove need to duplicate mapping in ft file
    function OpenTestFile()
        echo "Not Implemented"
    endfunction
endif

nnoremap <leader>ot :call OpenTestFile()<CR>
