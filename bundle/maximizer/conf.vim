let g:maximizer_set_default_mapping = 0
let g:maximizer_default_mapping_key = '<F1>'

nnoremap <silent><F1> :MaximizerToggle<CR>
vnoremap <silent><F1> :MaximizerToggle<CR>gv
inoremap <silent><F1> <C-o>:MaximizerToggle<CR>
