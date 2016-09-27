" http://stackoverflow.com/a/5703164/770019

function! has#colorscheme(name)
    let colorPattern = 'colors/' . a:name . '.vim'
    return !empty(globpath(&rtp, colorPattern))
endfunction
