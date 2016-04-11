" Folding
set foldmethod=indent
set foldlevelstart=1
set foldnestmax=5

setlocal tabstop=4
setlocal shiftwidth=4
setlocal softtabstop=4

" Do not cross
set colorcolumn=101

nnoremap <leader>ot :call ft#open_test_file#OpenJavascriptTestFile() <CR>
