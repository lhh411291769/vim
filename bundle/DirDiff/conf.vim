nnoremap [DirDiff]   <Nop>
nmap ] [DirDiff]

map <unique> [DirDiff]dg <Plug>DirDiffGet
map <unique> [DirDiff]dp <Plug>DirDiffPut
map <unique> [DirDiff]dj <Plug>DirDiffNext
map <unique> [DirDiff]dk <Plug>DirDiffPrev

let g:DirDiffExcludes = "CVS,*.class,.*.swp,.svn"
let g:DirDiffIgnore = "Id:,Revision:,Date:"
let g:DirDiffWindowSize = 16
let g:DirDiffAddArgs = "-w -B"

" let g:DirDiffSort = 1
" let g:DirDiffIgnoreCase = 0
