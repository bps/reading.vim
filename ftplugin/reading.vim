if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

setlocal nomodifiable wrap linebreak cursorline
nnoremap <buffer> <silent> j :call search('^\zs.*\S', 'W')<CR>
nnoremap <buffer> <silent> k 0:call search('^\zs.*\S', 'bW')<CR>
nmap <buffer> <silent> <Space> jz<CR>
augroup reading
    au!
    au BufEnter * call <SID>enter_reading_buffer()
    au BufLeave * call <SID>leave_reading_buffer()
    au ColorScheme * if &filetype == "reading" | call <SID>show_cursor() | call <SID>hide_cursor() | endif
augroup END

function! s:enter_reading_buffer()
    if &filetype == "reading"
        let g:reading_orig_sb = &showbreak
        let &showbreak = ""
        let g:reading_orig_so = &scrolloff
        set scrolloff=0
        call s:hide_cursor()
    endif
endfunction

function! s:leave_reading_buffer()
    if exists("g:reading_orig_sb")
        let &showbreak = g:reading_orig_sb
        unlet g:reading_orig_sb
    endif
    if exists("g:reading_orig_so")
        let &scrolloff = g:reading_orig_so
        unlet g:reading_orig_so
    endif
    if exists("g:reading_hi_cursor") && exists("g:reading_hi_matchparen")
        call s:show_cursor()
    endif
endfunction

function! s:get_highlights_for_group(group)
    redir => l:hi_group
    silent execute "hi ".a:group
    redir END
    return substitute(l:hi_group, '\v^.*xxx\s+', '', '')
endfunction

function! s:hide_cursor()
    if exists("g:reading_hi_cursor") && exists("g:reading_hi_matchparen")
        " Shouldn't call this twice in a row
        return 1
    endif
    let g:reading_hi_cursor = s:get_highlights_for_group('Cursor')
    let g:reading_hi_matchparen = s:get_highlights_for_group('MatchParen')
    hi! link Cursor CursorLine
    hi! link MatchParen CursorLine
endfunction

function! s:show_cursor()
    if exists("g:reading_hi_cursor") && exists("g:reading_hi_matchparen")
        execute "hi! Cursor ".g:reading_hi_cursor
        execute "hi! MatchParen ".g:reading_hi_matchparen
        unlet g:reading_hi_cursor
        unlet g:reading_hi_matchparen
    endif
endfunction

" We already missed the BufEnter event the first time, so do it now
call s:enter_reading_buffer()
