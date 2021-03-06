"nnoremap <silent> sj     :FufBuffer<CR>
"nnoremap <silent> sk     :FufFileWithCurrentBufferDir<CR>
"nnoremap <silent> sK     :FufFileWithFullCwd<CR>
nnoremap <silent> s<C-k> :FufFile<CR>
"nnoremap <silent> sl     :FufCoverageFile<CR>
"nnoremap <silent> sL     :FufCoverageFileChange<CR>
"nnoremap <silent> s<C-l> :FufCoverageFileRegister<CR>
"nnoremap <silent> sd     :FufDirWithCurrentBufferDir<CR>
"noremap <silent> sD     :FufDirWithFullCwd<CR>
nnoremap <silent> s<C-d> :FufDir<CR>
nnoremap <silent> sn     :FufMruFile<CR>
"nnoremap <silent> sN     :FufMruFileInCwd<CR>
nnoremap <silent> sm     :FufMruCmd<CR>
nnoremap <silent> su     :FufBookmarkFile<CR>
nnoremap <silent> sU     :FufBookmarkFileAdd<CR>
"vnoremap <silent> s<C-u> :FufBookmarkFileAddAsSelectedText<CR>
nnoremap <silent> si     :FufBookmarkDir<CR>
nnoremap <silent> sI     :FufBookmarkDirAdd<CR>
nnoremap <silent> st     :FufTag<CR>
nnoremap <silent> sT     :FufTag!<CR>
"nnoremap <silent> s<C-]> :FufTagWithCursorWord!<CR>
nnoremap <silent> s,     :FufBufferTag<CR>
nnoremap <silent> s<     :FufBufferTag!<CR>
"vnoremap <silent> s,     :FufBufferTagWithSelectedText!<CR>
"vnoremap <silent> s<     :FufBufferTagWithSelectedText<CR>
"nnoremap <silent> s}     :FufBufferTagWithCursorWord!<CR>
"nnoremap <silent> s.     :FufBufferTagAll<CR>
"nnoremap <silent> s>     :FufBufferTagAll!<CR>
"vnoremap <silent> s.     :FufBufferTagAllWithSelectedText!<CR>
"vnoremap <silent> s>     :FufBufferTagAllWithSelectedText<CR>
"nnoremap <silent> s]     :FufBufferTagAllWithCursorWord!<CR>
" nnoremap <silent> sg     :FufTaggedFile<CR>
" nnoremap <silent> sG     :FufTaggedFile!<CR>
"nnoremap <silent> so     :FufJumpList<CR>
"nnoremap <silent> sp     :FufChangeList<CR>
nnoremap <silent> sq     :FufQuickfix<CR>
"nnoremap <silent> sy     :FufLine<CR>
"nnoremap <silent> sh     :FufHelp<CR>
nnoremap <silent> se     :FufEditDataFile<CR>
"nnoremap <silent> sr     :FufRenewCache<CR>

" 1.FuzzyFinder 下载:http://www.vim.org/scripts/script.php?script_id=1984
" 2.vim-l9.vim 下载: http://www.vim.org/scripts/script.php?script_id=3252  "FuzzyFinder依赖该插件
" 3.模式
"     1 |:FufBuffer|       - Buffer mode (|fuf-buffer-mode|)
"     2 |:FufFile|         - File mode (|fuf-file-mode|)
"     3 |:FufCoverageFile| - Coverage-File mode (|fuf-coveragefile-mode|)
"     4 |:FufDir|          - Directory mode (|fuf-dir-mode|)
"     5 |:FufMruFile|      - MRU-File mode (|fuf-mrufile-mode|)
"     6 |:FufMrucmd-mode|)
"     7 |:FufBookmarkFile| - Bookmark-File mode (|fuf-bookmarkfile-mode|)
"     8 |:FufBookmarkDir|  - Bookmark-Dir mode (|fuf-bookmarkdir-mode|)
"     9 |:FufTag|          - Tag mode (|fuf-tag-mode|)
"    10 |:FufBufferTag|    - Buffer-Tag mode (|fuf-buffertag-mode|)
"    11 |:FufTaggedFile|   - Tagged-File mode (|fuf-taggedfile-mode|)
"    12 |:FufJumpList|     - Jump-List mode (|fuf-jumplist-mode|)
"    13 |:FufChangeList|   - Change-List mode (|fuf-changelist-mode|)
"    14 |:FufQuickfix|     - Quickfix mode (|fuf-quickfix-mode|)
"    15 |:FufLine|         - Line mode (|fuf-line-mode|)
"    16 |:FufHelp|         - Help mode (|fuf-help-mode|)
" 4.介绍
"   <c-n> :向下选择匹配      <c-p> :向上选择匹配
"   <c-j> :水平分割选中项    <c-k> :垂直分割选中项    <cr> :直接跳到选中项
"   <c-t> :切换到下一个模式  <c-y> :切换到上一个模式
"   <c-]> :delete select item
"   <c-\><c-\> :fuzzy matching 和 partial matching匹配模式切换 ( 模糊查找 与 部分查找 : 前者输入关键字错误时也可显示, 后者输入的部分关键字一定正确 )
let g:fuf_previewHeight = 0     "预览高度
let g:fuf_enumeratingLimit = 100 "符合条件的最多显示20个
" 'file' 'dir'
let g:fuf_modesDisable = ['help', 'buffer', 'taggedfile', 'coveragefile', 'jumplist', 'changelist', 'line'] 
let g:fuf_maxMenuWidth = 200
let g:fuf_autoPreview = 0

let g:fuf_mrufile_maxItem = 200
let g:fuf_mrucmd_maxItem = 100
