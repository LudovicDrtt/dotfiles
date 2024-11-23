" Set compatibility to Vim only
set nocompatible

" Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'lervag/vimtex'
Plugin 'tpope/vim-fugitive'
Plugin 'SirVer/ultisnips'
Plugin 'vim-python/python-syntax'
Plugin 'dpelle/vim-Grammalecte'
call vundle#end()

" Filetype detection
filetype plugin indent on

" Set syntax highlighting
syntax on

" Automatically wrap text that extends beyond the screen length
set wrap


" Uncomment below to set the max textwidth. Use a value corresponding to the
" width of your screen.
set textwidth=0 " Don't linebreak automatically by default
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set autoindent
set showcmd 

" Make new file appear to the right in vertical split
set splitright

" Status bar
set laststatus=2

" Disable menu, scrollbar, menubar
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar

" Enable mouse
set mouse=a

" Show line numbers
set number

" Search highlight
set hlsearch

" Incremental search
set incsearch

" Rend la touche <Esc> plus rapide
set ttimeout
set ttimeoutlen=100

"call plug#begin()
"Plug 'flazz/vim-colorschemes'
"Plug 'Townk/vim-autoclose'
"Plug 'vim-scripts/AutoComplPop'
"Plug 'vimwiki/vimwiki'
"call plug#end()

" Use true colors if possible
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Set color theme
set termguicolors
set background=dark
colorscheme onehalfdark " Additional colorscheme

" Search files in subdirectories
set path +=**

" Show completion possibilities
set wildmenu


" Modifie les touches pour correspondre au bépo
source  ~/.vimrc.bepo

" Désactive le surlignage sur la recherche actuelle avec <C-l>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" Ajoute la commande DiffOrig pour visualiser les changements avec le fichier
" d'origine
command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
    \ | wincmd p | diffthis

" Ajoute le plugin matchit (distribué avec Vim) qui améliore %
packadd! matchit

" Commence a scroller 5 lignes avant le bas de la fenêtre
"set so=5

let g:tex_flavor = 'latex'

" Grammalecte french syntax checker
let g:grammalecte_cli_py='/home/ludovic/Logiciels/Grammalecte/grammalecte-cli.py'
let g:grammalecte_disable_rules="apostrophe_typographique apostrophe_typographique_après_t espaces_début_ligne espaces_milieu_ligne espaces_fin_de_ligne typo_points_suspension1 typo_tiret_incise nbsp_avant_double_ponctuation nbsp_avant_deux_points nbsp_après_chevrons_ouvrants nbsp_avant_chevrons_fermants1 unit_nbsp_avant_unités1 unit_nbsp_avant_unités2 unit_nbsp_avant_unités3"

" Snippets
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

" Use <leader>u in normal mode to refresh UltiSnips snippets
nnoremap <leader>u <Cmd>call UltiSnips#RefreshSnippets()<CR>
