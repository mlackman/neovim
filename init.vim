set nocompatible                " be iMproved, required
filetype off                    " required
set backspace=indent,eol,start
:let mapleader=","
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
:set ignorecase
syntax on

" default fold method
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Rendering
set ttyfast

:lua require('basic-config')

" imap jk <esc>
map å :set invpaste<cr>i
" To go normal mode in terminal
if has('nvim')
  tmap <C-o> <C-\><C-n>
endif

" call plug#begin('~/.config/nvim/plugged')
" Plug 'neomake/neomake'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'vim-test/vim-test'
"Plug 'preservim/nerdtree'
"Plug 'roxma/nvim-yarp'
"Plug 'roxma/vim-hug-neovim-rpc'
"Plug 'dart-lang/dart-vim-plugin'
" Plug 'ctrlpvim/ctrlp.vim'
"Plug 'tpope/vim-dadbod'
"Plug 'kristijanhusak/vim-dadbod-ui',
"Plug 'vimwiki/vimwiki',
" Plug 'udalov/kotlin-vim' -- not working very well
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'

"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'

" Plug 'neovim/nvim-lspconfig'
" Plug 'hrsh7th/nvim-cmp'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'stevearc/conform.nvim'

" call plug#end()

" Colors
highlight Pmenu ctermbg=gray guibg=gray
"highlight CocHintFloat ctermfg=Red  guifg=#ff0000

" File specific tabs
autocmd Filetype python setlocal ts=4 sts=4 sw=4
autocmd Filetype yaml setlocal ts=2 sts=2 sw=2
autocmd Filetype json setlocal ts=2 sts=2 sw=2 foldmethod=syntax
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype typescript setlocal ts=2 sts=2 sw=2
autocmd Filetype cucumber setlocal ts=4 sts=4 sw=4
autocmd Filetype svelte setlocal ts=2 sts=2 sw=2
autocmd Filetype vue setlocal ts=2 sts=2 sw=2
autocmd Filetype typescriptreact setlocal ts=2 sts=2 sw=2

" Remove trailing whitespace automatically
autocmd BufWritePre *.py :silent! %s#\($\n\s*\)\+\%$##
autocmd BufWritePre *.feature :silent! %s#\($\n\s*\)\+\%$##
autocmd BufWritePre *.yml :silent! %s#\($\n\s*\)\+\%$##
autocmd BufWritePre *.json :silent! %s#\($\n\s*\)\+\%$##
autocmd BufWritePre *.ts :silent! %s#\($\n\s*\)\+\%$##
autocmd BufWritePre *.ts :silent! :%s/\%U00A0/ /g

" Run NeoMake on read and write operations
" autocmd! BufReadPost,BufWritePost * Neomake

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact


"
" FZF (fast file find)
"
nmap ; :GFiles<cr>

"
" CtrlP
"
" nmap ; :CtrlP .<cr>

"
" neomake
"
" let g:neomake_serialize = 1
" let g:neomake_serialize_abort_on_error = 1

"
" COC
"
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
"nmap <leader> f  <Plug>(coc-fix-current)
" inoremap <silent><expr> <c-space> coc#refresh()
"inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<TAB>"

"
" nerdtree
"
" map ? :NERDTreeToggle<cr>
" let NERDTreeIgnore = ['\.pyc$', '__pycache__']
" let g:NERDTreeWinSize=60
" let g:NERDTreeMinimalMenu=1  " Workaround https://github.com/preservim/nerdtree/issues/1321

"
" vim-test
"

"   let test#python#nose#options='-s -d'
"   let test#python#runner = 'pytest'
"   let test#javascript#mocha#options='-r esm'
"   let test#javascript#jest#runner ='TZ=UTC jest'
"   let test#typescript#jest#runner ='TZ=UTC jest'
"   let test#kotlin#gradletest#options='--info'
"   map rc :TestFile<CR>
"   map rl :TestLast<CR>
"   map rn :TestNearest<CR>

"
" dadbod db connectio strings
"
let g:dbs = {
\ 'recommendation-prod': 'mysql://webapp@127.0.0.1:3307/cc_recommend_prod',
\ }

"
" Telescope
"
"nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
"nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>

