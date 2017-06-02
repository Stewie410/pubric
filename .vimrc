if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin calls
call plug#begin()
Plug 'tpope/vim-sensible'

" Colorschemes
Plug 'nightsense/vim-crunchbang'
Plug 'exitface/synthwave.vim'
Plug 'dikiaap/minimalist'
Plug 'carakan/new-railscasts-theme'

" Airline Colorschemes
Plug 'vim-airline/vim-airline-themes'

" Utilities
Plug 'majutsushi/tagbar'
Plug 'chrisbra/csv.vim'
Plug 'vim-syntastic/syntastic'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-signify'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jmcantrell/vim-virtualenv'
Plug 'edkolev/tmuxline.vim'
Plug 'lervag/vimtex'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

" Vanilla vim settings
set number
set relativenumber
set t_Co=256
set encoding=utf-8
set mouse=r
set ruler
set showcmd
syntax on
colorscheme ron

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Airline
set laststatus=2

" Airline fall-backs
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.notexists = '∄'
"let g:airline_symbols.whitepsace = 'Ξ'

" Airline Features
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline_detect_paste = 1
let g:airline_detect_crypt = 1
let g:airline_detect_iminsert = 0
let g:airline_inactive_collapse = 1

" Airline Extensions
let g:airline#extensions#tabline#enabled = 1

" Airline Theme
"let g:airline_theme = 'dark'
"let g:airline_theme = 'term'
let g:airline_theme = 'wombat'
