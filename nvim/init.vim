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
    " git support
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    " nerdtree
    Plug 'preservim/nerdtree'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'preservim/nerdcommenter'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'

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

" wildmenu
set wildmenu
set wildmode=longest,list,full
" ignore some folders/ file types in wildmenu
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Key mappings
" Source vim init file
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>

" copy the full file
nnoremap <leader>y gg"+yG
" Move a line up or down
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv
" Replace the word at cursor with another word
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
" copy full path
nnoremap <leader>fp :let @+ = expand("%:p")<CR>

" Shortcutting split navigation, saving a keypress:
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>
" Go back to previous file
nmap <leader>bb <C-^>
nmap <leader>bn :bn<CR>

" nerdtree
nnoremap <leader>gv :GFiles<CR>
nnoremap <leader>pv :NERDTreeFind<bar> :vertical resize 45<CR>
noremap <silent> <leader>e :NERDTreeToggle<CR>
" nerdtree settings
let g:NERDTreeIgnore = ['^node_modules$'] " ignore node_modules to increase load speed
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeStatusline = '' " set to empty to use lightline
" Close window if NERDTree is the last one
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" NERDTree Syntax Highlight
" " Enables folder icon highlighting using exact match
let g:NERDTreeHighlightFolders = 1
" " Highlights the folder name
let g:NERDTreeHighlightFoldersFullName = 1
" " Color customization
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'
" " This line is needed to avoid error
let g:NERDTreeExtensionHighlightColor = {}
" " Sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['css'] = s:blue
" " This line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor = {}
" " Sets the color for .gitignore files
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange
" " This line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor = {}
" " Sets the color for files ending with _spec.rb
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red
" " Sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFolderSymbolColor = s:beige
" " Sets the color for files that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue

" NERDTree Git Plugin
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
