" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs :lua require'telescope.builtin'.lsp_workspace_symbols{}<cr>
nnoremap <leader>fe :lua require'telescope.builtin'.symbols{}<cr>
nnoremap <leader>fr :lua require'telescope.builtin'.lsp_references{}<cr>
nnoremap <leader>fdd :lua require'telescope.builtin'.lsp_document_diagnostics{}<cr>
nnoremap <leader>fdw :lua require'telescope.builtin'.lsp_workspace_diagnostics{}<cr>

lua << EOF
require('telescope').setup{
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}
require('telescope').load_extension('fzy_native')
EOF
