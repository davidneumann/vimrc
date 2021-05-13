" illuminate
autocmd VimEnter * hi def link LspReferenceText CursorLine
autocmd VimEnter * hi def link LspReferenceWrite CursorLine
autocmd VimEnter * hi def link LspReferenceRead CursorLine
nnoremap <silent> <leader>n <cmd>lua require"illuminate".next_reference{wrap=true}<cr>
nnoremap <silent> <leader>p <cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>
