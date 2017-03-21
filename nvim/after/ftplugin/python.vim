" Do not cross
setlocal colorcolumn=100
highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
match OverLength /\%106v.*/

setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal cindent
setlocal smarttab
setlocal formatoptions=croql
setlocal number

nnoremap <leader>ot :call ft#open_test_file#OpenPythonTestFile() <CR>

" quick python helpers
iabbrev pyta import pytest<cr>@pytest.mark.a 
iabbrev pytdb import ipdb; ipdb.set_trace()


autocmd! BufWritePost * Neomake

let g:neomake_python_enabled_makers = ['flake8']
" Default to 100 line length
let g:neomake_python_flake8_maker = { 'args': ['--max-line-length=99'], }

let g:pymode_indent = 0

map <C-Y> :call yapf#YAPF()<cr>
imap <C-Y> <c-o>:call yapf#YAPF()<cr>
