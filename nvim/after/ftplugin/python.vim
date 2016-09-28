" Do not cross
set colorcolumn=81

nnoremap <leader>ot :call ft#open_test_file#OpenPythonTestFile() <CR>

" quick python helpers
iabbrev pyta import pytest<cr>@pytest.mark.a 
iabbrev pytdb import ipdb; ipdb.set_trace()
