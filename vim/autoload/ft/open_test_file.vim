function! ft#open_test_file#OpenPythonTestFile()
    " Works for lcda structure
    " SRC: path/to/src/file.py
    " TEST: tests/path/to/src/test_file.py

    let filename=expand('%:t')
    let dirname=expand('%:h')

    execute 'rightbelow vsplit ' . "tests/" . dirname . "/test_" . filename
endfunction


function! ft#open_test_file#OpenJavascriptTestFile()
    " Works for lcdajs structure
    " SRC: src/path/to/file.js
    " TEST: test/path/to/fileSpec.js

    let filename=expand('%:r') " take file path without ext

    " prepend `test/`
    " remove `src/` from path
    " append `Spec.js`
    let testfilename="test/" . strpart(filename, 4) . "Spec.js"

    execute 'rightbelow vsplit ' . testfilename

endfunction
