nnoremap <SPACE> <Nop>
let mapleader=" "

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Plug 'rust-lang/rust.vim'

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'

" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Extensions to built-in LSP, for example, providing type inlay hints
Plug 'nvim-lua/lsp_extensions.nvim'

" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'

" Command T
" Plug 'wincent/command-t', {
"     \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
"     \ }

Plug 'vim-syntastic/syntastic'

Plug 'preservim/nerdtree'

Plug 'ap/vim-buftabline'

Plug 'jeffkreeftmeijer/vim-numbertoggle'

Plug 'puremourning/vimspector'

Plug 'mbbill/undotree'

Plug 'gruvbox-community/gruvbox'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-symbols.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

syntax enable
filetype plugin indent on


"
nnoremap <C-t> :NERDTreeToggle<CR>

nmap <leader>1 <Plug>BufTabLine.Go(1)
nmap <leader>2 <Plug>BufTabLine.Go(2)
nmap <leader>3 <Plug>BufTabLine.Go(3)
nmap <leader>4 <Plug>BufTabLine.Go(4)
nmap <leader>5 <Plug>BufTabLine.Go(5)
nmap <leader>6 <Plug>BufTabLine.Go(6)
nmap <leader>7 <Plug>BufTabLine.Go(7)
nmap <leader>8 <Plug>BufTabLine.Go(8)
nmap <leader>9 <Plug>BufTabLine.Go(9)
nmap <leader>0 <Plug>BufTabLine.Go(10)

nnoremap <leader>u :UndotreeToggle<CR>

colorscheme gruvbox

" Trim whitespace on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup my_commands
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup End
