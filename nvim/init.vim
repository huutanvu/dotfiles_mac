let mapleader=" "

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin("~/.config/nvim/plugged")
    Plug 'EdenEast/nightfox.nvim'
    Plug 'mbbill/undotree'
call plug#end()


" Interface setup

" colorscheme gruvbox
colorscheme nightfox
set background=dark

" copy to also to the system clipboard
set clipboard+=unnamedplus
set number
set relativenumber
set scrolloff=8
set nohlsearch
set encoding=UTF-8

" change the current working dir to the file's dir
set autochdir

" enable syntax
syntax enable

if !exists('g:syntax_on')
	syntax enable
endif
filetype plugin on

" Remove the show mode bar - use lightline instead
set noshowmode

" tab options
set tabstop=2 softtabstop=2
" Make the shift width when press > or < 4
set shiftwidth=2
" Use space instead of tab
set expandtab
" Auto indent
set smartindent
" Easier to see, wrap can cause navigation confusion
set nowrap
" Case sensitive searching
set smartcase
set noswapfile
set nobackup
" Set undotree - disable undodir - save undotree to a file
set undodir=~/.config/nvim/undodir
set undofile

" Incremental searching, start searching while typing
set incsearch

" Shortcuts
" toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>





