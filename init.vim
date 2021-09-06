set exrc
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set relativenumber
set nu
set nohlsearch
set magic
set guicursor=
set noerrorbells
set hidden
set nowrap
set smartcase
set ignorecase
set nobackup
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set showmatch
set mat=3

" more space for messages
set cmdheight=2
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

let mapleader = " "
let g:mapleader = " "

" swap semicolon and colon in normal mode
nnoremap ; :
nnoremap : ;

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
" surround word in quotes
:nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
" delete to void
"vnoremap <leader>p "_dP

" copy to system clipbard
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

vnoremap <leader>d "_d

" " Panel switching
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>k :wincmd k<CR>
map <leader>l :wincmd l<CR>
" " Split panel
nnoremap <leader>v <C-w>v
nnoremap <leader>s <C-w>s

" vipsql mappings
" Starts an async psql job, prompting for the psql arguments.
" Also opens a scratch buffer where output from psql is directed.
noremap <leader>po :VipsqlOpenSession<CR>

" Terminates psql (happens automatically if the output buffer is closed).
noremap <silent> <leader>pk :VipsqlCloseSession<CR>

" In normal-mode, prompts for input to psql directly.
nnoremap <leader>ps :VipsqlShell<CR>

" In visual-mode, sends the selected text to psql.
vnoremap <leader>ps :VipsqlSendSelection<CR>

" Sends the selected _range_ to psql.
noremap <leader>pr :VipsqlSendRange<CR>

" Sends the current line to psql.
noremap <leader>pl :VipsqlSendCurrentLine<CR>

" Sends the entire current buffer to psql.
noremap <leader>pb :VipsqlSendBuffer<CR>

" Sends `SIGINT` (C-c) to the psql process.
noremap <leader>pc :VipsqlSendInterrupt<CR>

call plug#begin('~/.config/nvim/plugged')
    Plug 'neovim/nvim-lspconfig'
    Plug 'christoomey/vim-tmux-runner'
"    Plug 'tpope/vim-fugitive'
"    Plug 'tpope/vim-surround'
"    Plug 'puremourning/vimspector'
    Plug 'mbbill/undotree'
    Plug 'szw/vim-maximizer'
"   Plug 'nvim-telescope/telescope.nvim'
    Plug 'preservim/nerdtree'
    Plug 'Raimondi/delimitMate'
    Plug 'itchyny/lightline.vim'
    Plug 'jalvesaq/Nvim-R', {'branch': 'stable'}
    Plug 'ncm2/ncm2'
    Plug 'roxma/nvim-yarp'
    Plug 'gaalcaras/ncm-R'
    Plug 'martingms/vipsql'
    Plug 'lifepillar/pgsql.vim'
    Plug 'mzarnitsa/psql'
call plug#end()

let g:sql_type_default = 'pgsql'
"let b:sql_type_override='pgsql' | set ft=sql


"nvim_lsp:python:setup{...}

let g:LanguageClient_serverCommands = {
    \ 'r': ['R', '--slave', '-e', 'languageserver::run()'],
    \ }

fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup FIETE
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END


lua << EOF
require'lspconfig'.pyright.setup{}
EOF

lua << EOF
require('psql').setup({
  database_name = 'testdb',
  user = 'sfiete',
  hostname = 'localhost',
  port = 5432,
})
EOF
