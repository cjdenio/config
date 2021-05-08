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
Plug 'mhinz/vim-startify'

Plug 'airblade/vim-gitgutter'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sbdchd/neoformat'

Plug 'wakatime/vim-wakatime'

Plug 'sheerun/vim-polyglot'

Plug 'adelarsq/vim-matchit'

Plug 'mg979/vim-visual-multi'

call plug#end()

colorscheme dracula

let g:camelcasemotion_key = '<leader>'

let mapleader = " "

nnoremap <leader>fs :w<CR>

augroup fmt
  autocmd!
  au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END

set nu rnu
set ignorecase
set cursorline

autocmd BufWinEnter * silent NERDTreeMirror

let NERDTreeWinPos="right"
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1

" Start NERDTree when Vim is started without file arguments.
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"

" coc-related mappings
nmap <leader>rn <Plug>(coc-rename)
nmap <silent> gd <Plug>(coc-definition)

" Set JSON for captain-definition files
autocmd BufNewFile,BufRead captain-definition,.prettierrc set ft=json

set termguicolors

let g:pear_tree_repeatable_expand = 0

command! -bar Lazygit tabedit term://lazygit | startinsert
command! -bar BelTerm belowright 15split +term
command! -bar VTerm belowright vsplit +term
command! -bar TTerm tabedit +term

command! -range=1 Term
      \ BelTerm
      \ | let num = 0
      \ | while num <= <count> - 2
      \ |   let num = num + 1
      \ |   VTerm
      \ | endwhile
      \ | wincmd k

command! Reload source $MYVIMRC

autocmd VimEnter *
      \   if !argc()
      \ |   Startify
      \ |   NERDTree
      \ |   wincmd w
      \ | endif

autocmd TermOpen * setlocal nonumber norelativenumber nocursorline

" :tnoremap <Esc> <C-\><C-n>

set mouse=a

map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-U>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-D>

let g:who = {
      \ 'caleb': 'CALEB'
      \ }

function Caleb()
  echo g:who['caleb']
endfunction

nnoremap <Leader>c :call Caleb()<CR>

nnoremap <Leader>h :noh<CR>

let g:startify_change_to_dir = 0
