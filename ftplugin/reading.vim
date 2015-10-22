if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

setlocal nomodifiable wrap linebreak
nnoremap <buffer> j 2j
nnoremap <buffer> k 2k
augroup reading
    au!
    au BufEnter * call <SID>enter_reading_buffer()
    au BufLeave * call <SID>leave_reading_buffer()
augroup END

function! s:enter_reading_buffer()
    if &filetype == "reading"
        let g:reading_orig_sb = &showbreak
        let &showbreak = ""
        let g:reading_orig_scrolloff = &scrolloff
        set scrolloff=0
    endif
endfunction

function! s:leave_reading_buffer()
    if exists("g:reading_orig_sb")
        let &showbreak = g:reading_orig_sb
        unlet g:reading_orig_sb
    endif
    if exists("g:reading_orig_scrolloff")
        let &scrolloff = g:reading_orig_scrolloff
        unlet g:reading_orig_scrolloff
    endif
endfunction

" We already missed the BufEnter event the first time, so do it now
call s:enter_reading_buffer()
