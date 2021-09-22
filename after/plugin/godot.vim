func! GodotSettings() abort
    setlocal foldmethod=expr
    nnoremap <buffer> <F4> :GodotRunLast<CR>
    nnoremap <buffer> <F5> :GodotRun<CR>
    nnoremap <buffer> <F6> :GodotRunCurrent<CR>
    nnoremap <buffer> <F7> :GodotRunFZF<CR>
    nnoremap <leader>fsw Telescope coc workspace_symbols<cr>
    nnoremap <leader>fsd Telescope coc document_symbols<cr>
    nnoremap <leader>s Telescope coc document_symbols<cr>
    nnoremap <leader>fe Telescope coc workspace_symbols<cr>
    nnoremap <leader>fr Telescope coc references<cr>
    nnoremap <leader>fdd Telescope coc diagnostics<cr>
    nnoremap <leader>fdw Telescope coc workspace_diagnostics<cr>
endfunc
augroup godot | au!
    au FileType gdscript call GodotSettings()
augroup end
