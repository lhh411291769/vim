let g:EclimCompletionMethod = 'omnifunc'
let g:EclimJavaDocSearchSingleResult = "open"
let g:EclimBrowser = "firefox"
let g:EclimLocationListHeight = 24
"let g:EclimAntCompilerAdditionalErrorFormat =
"
" let g:EclimAntErrorsEnabled = 0

" let g:EclimJavaValidate=0

"severity sort: errors > warnings > info > etc.
let g:EclimValidateSortResults = 'severity'

autocmd FileType java nmap <C-RightMouse> <esc><c-o>
autocmd FileType java nmap <C-LeftMouse> <esc>:JavaSearchContext -a edit<cr>
autocmd BufEnter *.c,*.cpp,*.h silent! unmap <C-LeftMouse>

" Eclim settings
" " ,ji imports whatever is needed for current line
nnoremap <silent> <Leader>ji :JavaImport<cr>
" " ,jd opens javadoc for statement in browser
nnoremap <silent> <Leader>jd :JavaDocSearch -x declarations<cr>
" " ,<enter> searches context for statement
nnoremap <silent> <Leader><cr> :JavaSearchContext -a edit<cr>
" " ,jv validates current java file
" nnoremap <silent> <Leader>jv :Validate<cr>
" " ,jc shows corrections for the current line of java
nnoremap <silent> <Leader>jc :JavaCorrect<cr>
" " C-S-F java_format current java file
nnoremap <silent> <C-F> :%JavaFormat<cr>

nnoremap <silent> <leader>pl :ProjectList<cr>
" nnoremap <silent> <leader>pt :ProjectsTree<cr>
nnoremap <silent> <leader>pi :call DoCurrentProject(0)<CR>
nnoremap <silent> <leader>po :call DoCurrentProject(1)<CR>
nnoremap <silent> <leader>pc :call DoCurrentProject(2)<CR>
nnoremap <silent> <leader>pd :call DoCurrentProject(3)<CR>
nnoremap <silent> <leader>ps :call DoSelectProjects()<CR>

"通过当前编辑的文件, 打开所在的Android工程, 最终方便实现代码补全功能.
func! DoCurrentProject(flag) "{{{
    let curdir = getcwd()
    while len(curdir) > 12 
        let children = vimproc#readdir(curdir)
        for child in children
            let child = substitute(child, '\/$', '', '')
            if isdirectory(child)
                continue
            endif

            let filen = strpart(child, len(child) - 8)
            if '.project' ==# filen
                let lines = readfile(child)
                for i in lines
                    let content = matchstr(i, '<name>\(\w*\W*\w*\)</name>')
                    if len(content) > 0 
                        let proname = strpart(content, 6, len(content) - 13)
                        if len(proname) > 0
                            if a:flag == 0
                                echo 'Import project: ' . curdir
                                call eclim#project#util#ProjectImport(curdir)
                            elseif a:flag == 1
                                echo 'Open project: ' . proname
                                call eclim#project#util#ProjectOpen(proname)
                            elseif a:flag == 2
                                echo 'Close project: ' . proname
                                call eclim#project#util#ProjectClose(proname)
                            elseif a:flag == 3
                                echo 'Delete project: ' . proname
                                call eclim#project#util#ProjectDelete(proname)
                            else 
                                echo 'Never run here.'
                            endif
                        endif
                        return ''
                    endif
                endfor
            endif
        endfor
        let pathpos = strridx(curdir, '/')
        let curdir = strpart(curdir, 0, pathpos)
    endwhile
endfunc"}}}

func! DoSelectProjects() "{{{
    let op = str2nr(input("Select Open[1] Close[2] Delete[3] ", ' '), 10)   

    let names = eclim#project#util#GetProjectNames()
    let i = 0
    echomsg ' '
    echomsg ' ' . i . ' Select all project'
    for n in names
        let i = i + 1
        echomsg ' ' . i . ' ' . n 
    endfor

    let select = str2nr(input("Select project: ", ' '), 10)
    echomsg ' '

    let i = 0
    for proname in names
        let i = i + 1
        if select == 0
            if op == 1
                echo 'Open project: ' . proname
                call eclim#project#util#ProjectOpen(proname)
            elseif op == 2
                echo 'Close project: ' . proname
                call eclim#project#util#ProjectClose(proname)
            elseif op == 3 
                echo 'Delete project: ' . proname
                call eclim#project#util#ProjectDelete(proname)
            else 
                echomsg "Never run here."
            endif
        endif

        if i != select
            continue
        endif

        if op == 1
            echo 'Open project: ' . proname
            call eclim#project#util#ProjectOpen(proname)
            " 使用经典的目录树
            let path = eclim#project#util#GetProjectRoot(proname) 
            call g:NERDTreeCreator.CreatePrimary(path)
        elseif op == 2
            echo 'Close project: ' . proname
            call eclim#project#util#ProjectClose(proname)
        elseif op == 3 
            echo 'Delete project: ' . proname
            call eclim#project#util#ProjectDelete(proname)
        else 
            echomsg "Never run here."
        endif
    endfor
endfunc"}}}

"let g:EclimProjectStatusLine = 'eclim(p=${name}, n=${natures})'
" %{eclim#project#util#ProjectStatusLine()}%)

"自动弹出补全
"if !exists('g:neocomplcache_force_omni_patterns')
"    let g:neocomplcache_force_omni_patterns = {}
"endif
"let g:neocomplcache_force_omni_patterns.java = '\k\.\k*'

"功能命令缩短 
"加个Project命令, 主要是为command状态下  :Proj<tab>方便选择
command -nargs=?
            \ -complete=customlist,eclim#project#util#CommandCompleteProject
            \ Project :call eclim#project#util#ProjectList('<args>')


"command -nargs=?
"            \ -complete=customlist,eclim#project#util#CommandCompleteProject
"            \ PO :call eclim#project#util#ProjectOpen('<args>')
"
"command -nargs=? 
"            \ -complete=customlist,eclim#client#nailgun#CommandCompleteWorkspaces
"            \ PL :call eclim#project#util#ProjectList('<args>')
"
