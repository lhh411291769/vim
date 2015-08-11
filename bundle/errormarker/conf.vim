nmap <silent> <unique> `<space> :ErrorAtCursor<CR>
" hi ErrorMsg cterm=bold ctermbg=DarkRed gui=bold guibg=DarkRed
" hi WarningMsg cterm=bold ctermbg=LightRed gui=bold guibg=LightRed
let errormarker_errortext = "Er"
let errormarker_warningtext = "Wa"
let errormarker_warningtypes = "wW"
let errormarker_errorgroup = "ErrorMsg"
let errormarker_warninggroup = "Todo"
"let &errorformat="%f:%l:%c: %t %n: %m," . &errorformat
"let &errorformat="%f:%l:%c: %t%*[^:]:%m," . &errorformat
"f:file l:line c:column t:warningtypes m:message
let errormarker_erroricon = "/usr/share/icons/gnome/16x16/status/dialog-error.png"   "gvim
let errormarker_warningicon = "/usr/share/icons/gnome/16x16/status/dialog-warning.png" "gvim


"个人添加， 是否有问题尚未知
function QfSearchError(pattern)
    execute "botright copen 10"
    execute "redraw"
    let results = []
    execute "silent! g/" . a:pattern . "/call add(results, getline('.'))"
    if empty(results)
        execute "cclose"
    else 
        execute "normal G"
        execute "normal zb"
    endif
endfunction

au QuickfixCmdPost make call QfSearchError("error:")

au FileType c,cpp setlocal makeprg=make\ -j4
