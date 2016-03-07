" Folding
set foldmethod=indent
set foldlevelstart=1
set foldnestmax=5

setlocal tabstop=2
setlocal shiftwidth=2
setlocal softtabstop=2

" Do not cross
set colorcolumn=101

nnoremap <leader>ot :call ft#open_test_file#OpenJavascriptTestFile() <CR>
