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

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'

Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sbdchd/neoformat'

Plug 'wakatime/vim-wakatime'

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
