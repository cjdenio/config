" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tmsvg/pear-tree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'bkad/CamelCaseMotion'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/argtextobj.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'

Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sbdchd/neoformat'

Plug 'wakatime/vim-wakatime'

" Languages
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go'
Plug 'evanleck/vim-svelte'

call plug#end()

colorscheme dracula

let g:camelcasemotion_key = '<leader>'

let mapleader = " "

nnoremap <leader>fs :w<CR>

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

set nu rnu

autocmd BufWinEnter * silent NERDTreeMirror

let NERDTreeWinPos="right"
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"

" coc-related mappings
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)

" Set JSON for captain-definition files
autocmd BufNewFile,BufRead captain-definition,.prettierrc set ft=json

set termguicolors

let g:pear_tree_repeatable_expand = 0
