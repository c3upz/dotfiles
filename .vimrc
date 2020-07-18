"****************************************************************
"--------------------------PLUGINS-------------------------------
"****************************************************************
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tweekmonster/gofmt.vim'
Plug 'miyakogi/seiya.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'mbbill/undotree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', {'do': {-> fzf#install()}}
Plug 'fszymanski/fzf-gitignore', {'do': ':UpdateRemotePlugins'}
Plug 'vim-ruby/vim-ruby'
Plug 'scrooloose/nerdtree'

Plug 'patstockwell/vim-monokai-tasty'

"  I AM SO SORRY FOR DOING COLOR SCHEMES IN MY VIMRC, BUT I HAVE
"  TOOOOOOOOOOOOO
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'phanviet/vim-monokai-pro'
Plug 'flazz/vim-colorschemes'
Plug 'itchyny/lightline.vim'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
call plug#end()


"****************************************************************
"--------------------------GENERAL-------------------------------
"****************************************************************
syntax on
"following two lines dictate how the cursor acts in nvim
set guicursor=n-v-c:block,i-ci-ve:ver100,r-cr:hor20,o:hor50\,a:blinkwait250-blinkoff250-blinkon250,sm:block-blinkwait175-blinkoff150-blinkon175
set guicursor=n:blinkon0
set noshowmatch
set relativenumber " line numbers are relative to position in document
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap " text does not wrap... aka text will go off screen if it exceeds the windows width
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set laststatus=2
set ic

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
set noshowmode
set colorcolumn=0
highlight ColorColumn ctermbg=0 guibg=lightgrey


"let g:gruvbox_contrast_dark = 'hard'
" --- The Greatest plugin of all time.  I am not bias
let g:vim_be_good_floating = 1


" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1
"colorscheme onedark

"set background=dark
"colorscheme gruvbox
colo vim-monokai-tasty
highlight Normal ctermfg=grey ctermbg=black

" seiya extension makes it so nvim background is clear and therefore
" background color will be controled by the terminals settings 
let g:seiya_target_groups = has('nvim') ? ['guibg'] : ['ctermbg']
"let g:airline_powerline_fonts = 1
let g:seiya_auto_enable=1

let g:lightline = {
  \ 'colorscheme': 'molokai',
  \ 'active': {
  \   'right': [['lineinfo'], ['fileformat', 'filetype']]
  \ },
  \ 'component_function': {
  \   'filename': 'LightLineFilename'
  \ },
  \ 'component': {
  \   'lineinfo': "[%l:%-v] [%{printf('%03d/%03d',line('.'),line('$'))}]",
  \ }
  \ }

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "

let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25 
" FZF remaps
" Find files with fzf
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>
nnoremap <silent> <leader>nt :tabnext<cr>
nnoremap <silent> <leader>pt :tabprevious<cr>
nnoremap <silent> <leader>ct :tabc<cr>


function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <C-space> coc#refresh()

" hitting 'jj' will exit insert mode
inoremap jj <esc>
" Disable Ex mode
nmap Q <Nop>
" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>rr <Plug>(coc-rename)
nmap <leader>g[ <Plug>(coc-diagnostic-prev)
nmap <leader>g] <Plug>(coc-diagnostic-next)
nmap <silent> <leader>gp <Plug>(coc-diagnostic-prev-error)
nmap <silent> <leader>gn <Plug>(coc-diagnostic-next-error)
nnoremap <leader>cr :CocRestart

