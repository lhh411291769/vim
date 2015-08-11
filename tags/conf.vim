nnoremap <silent> <leader>td :call DoSelectTagDB()<CR>

set tags=./tags 
set tags+=~/.vim/tags/include.tags
set tags+=~/.vim/tags/cpp.tags

func! DoSelectTagDB() 
    let tagdir = $tags
    if len(tagdir) == 0
        echomsg 'set env tags dir, export tags='
        return
    endif
    let subdirs = [ ]
    if vimshell#util#has_vimproc()
        let dirs = vimproc#readdir(tagdir)
        let i = 0
        for subdir in dirs
            let i = i + 1
            let subdir = substitute(subdir, '\/$', '', '')
            if isdirectory(subdir)
                echomsg ' ' . i . ' ' . subdir
                call add(subdirs, subdir)
            endif
        endfor

        let select = str2nr(input("Select TagDB: ", ' '), 10)         
        echomsg ' '

        if select > i || select == 0
            echomsg ' Input error!'
            return
        endif

        let select = select -1

        let dbfile = subdirs[select] . '/db.vim'
        if filereadable(dbfile)
            exec 'source' dbfile
        else 
            echomsg ' Not found db.vim!'
        endif
    endif
endfunc
