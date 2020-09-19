" Modifie les touches pour correspondre au bépo
source  ~/.vimrc.bepo

" Set compatibility to Vim only
set nocompatible

" Set syntax highlighting
syntax on

" Automatically wrap text that extends beyond the screen length
set wrap


" Uncomment below to set the max textwidth. Use a value corresponding to the
" width of your screen.
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround


" Status bar
set laststatus=2

" Disable menu, scrollbar, menubar
set guioptions-=m  "menu bar
set guioptions-=T  "toolbar
set guioptions-=r  "scrollbar

" Show line numbers
set number

" Search highlight
set hlsearch

" Incremental search
set incsearch

call plug#begin()
Plug 'flazz/vim-colorschemes'
Plug 'Townk/vim-autoclose'
Plug 'vim-scripts/AutoComplPop'
Plug 'vimwiki/vimwiki'
call plug#end()

" Set color theme
set background=dark
color Tomorrow-Night

" Search files in subdirectories
set path +=**

" Show completion possibilities
set wildmenu

" -----------------------------
"  Vimwiki
" -----------------------------
let g:vimwiki_list = [{'path': '~/Nextcloud/Documents/Notes/',
                      \ 'template_path': '~/Nextcloud/Documents/Notes HTML/templates/', 
                      \ 'template_default': 'default',
                      \ 'syntax': 'markdown', 'ext': '.md',
                      \ 'path_html': '~/Nextcloud/Documents/Notes HTML/',
                      \ 'custom_wiki2html': '~/Nextcloud/Documents/Notes/.wiki2html.sh',
                      \ 'template_ext': '.html'}]
