" (Neo)VIM run commands
" by bnjmn
" Works with vim8 and neovim


if has('nvim')
    let g:plug_home = expand('<sfile>:p:h') . '/neoplugs'
else 
    let g:plug_home = expand('<sfile>:p:h') . '/vimplugs'
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
Plug 'tpope/vim-obsession'

"Plug 'tpope/vim-vinegar'
"Plug 'justinmk/vim-dirvish'
"Plug 'scrooloose/nerdtree'


" others
Plug 'scrooloose/nerdcommenter'
"Plug 'sjl/gundo.vim'
"Plug 'mbbill/undotree'
"Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'

Plug 'airblade/vim-gitgutter'
Plug 'jmcantrell/vim-virtualenv'
Plug 'Arkham/vim-quickfixdo'
Plug 'mileszs/ack.vim'                        " depends on system ack
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Installed with brew
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

if has('nvim')
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'zchee/deoplete-jedi'
    Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
    Plug 'neomake/neomake'
    "Plug 'w0rp/ale'
endif

" colors
Plug 'ap/vim-css-color'
Plug 'altercation/vim-colors-solarized'
Plug 'gilgigilgil/anderson.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'joshdick/onedark.vim'


" syntax
Plug 'lepture/vim-jinja'
Plug 'groenewege/vim-less'
Plug 'kchmck/vim-coffee-script'
Plug 'hail2u/vim-css3-syntax'
Plug 'stephpy/vim-yaml'
Plug 'cespare/vim-toml'
Plug 'tmhedberg/SimpylFold'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'Raimondi/delimitMate'
Plug 'wavded/vim-stylus'


Plug 'AndrewRadev/splitjoin.vim'

call plug#end()

let mapleader = "\<Space>"
let maplocalleader = "\\"

" See docs/python_setup.md (must create virtualenvs)
let g:python_host_prog = $PYENV_ROOT . '/versions/neovim2/bin/python'
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python'

""""""""""""""""""""""""""
" PLUGIN Settings
""""""""""""""""""""""""""

" Ack!
nnoremap <leader>a :Ack!<Space>
nnoremap <leader>A :AckFromSearch<CR>

" Requires ag (silver surfer) installed
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  "let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" NerdCommenter
let g:NERDCustomDelimiters = {
  \ 'jinja': { 'left': '{#', 'right': '#}' },
  \ 'scss': { 'left': '/* ', 'right': ' */' },
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
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
nnoremap <leader>pc :pclose<CR>

let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

" SimpylFold

let g:SimpylFold_docstring_preview = 1
let g:SimpylFold_fold_docstring = 0
let g:SimpylFold_fold_import = 0

autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" Markdown
let g:vim_markdown_folding_disabled = 1


""""""""""""""""""""""""""
" GENERAL Settings
""""""""""""""""""""""""""

set background=dark
if has#colorscheme('onedark')
    colorscheme onedark
elseif has#colorscheme('solarized')
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
set textwidth=80

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

nnoremap <leader>ff :FZF --reverse<CR>
let g:fzf_layout = { 'down': '~40%' }

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.jy set filetype=python
autocmd BufNewFile,BufReadPost *.eco,*.html set filetype=html
autocmd BufNewFile,BufRead *.nunj set filetype=jinja

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

tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l


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


function! MyChangeTabStops(current, new)
    let &l:tabstop = a:current
    let &l:softtabstop = a:current
    set noexpandtab
    retab!
    let &l:tabstop = a:new
    let &l:softtabstop = a:new
    set expandtab
    retab
endfunction

command! -nargs=* MyChangeTabStops call MyChangeTabStops(<f-args>)


nnoremap <leader>ot :call OpenTestFile()<CR>
