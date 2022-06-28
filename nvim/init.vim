let mapleader=" "

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin("~/.config/nvim/plugged")
  " Plugin Section
    Plug 'morhetz/gruvbox'
    Plug 'EdenEast/nightfox.nvim'
    Plug 'tpope/vim-surround'
    Plug 'junegunn/fzf', {'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'mbbill/undotree'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/gv.vim'
    Plug 'preservim/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'Xuyuanp/nerdtree-git-plugin'
    Plug 'ryanoasis/vim-devicons'
    Plug 'ap/vim-css-color'
    Plug 'mattn/emmet-vim'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'AndrewRadev/tagalong.vim'
    Plug 'sbdchd/neoformat'
    Plug 'mbbill/undotree'
    Plug 'itchyny/lightline.vim'
    Plug 'w0rp/ale'
    Plug 'vim-test/vim-test'
call plug#end()
" Everything after this line will be the config section

" Colorscheme
" colorscheme gruvbox
colorscheme nightfox
set background=dark

" Interface setup
set number
set relativenumber
set scrolloff=8
set nohlsearch
set clipboard+=unnamedplus
set encoding=UTF-8
syntax enable

if !exists('g:syntax_on')
    syntax enable
endif
filetype plugin on

set foldmethod=syntax
set foldnestmax=10
set nofoldenable
" if we use lightline, we can remove the showmod
set noshowmode

set autochdir
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
" Set undotree
set undodir=~/.vim/undodir
set undofile

" Incremental searching, start searching while typing
set incsearch
" Set a line at 80 characters (pep8)
" set colorcolumn=80
" highlight ColorColumn ctermbg=0 guibg=lightgrey
" Disable undodir
set undodir=~/.config/nvim/undodir
set undofile " save undotree to a file


" Key Map
" Open GitFiles
nnoremap <leader>gv :GFiles<CR>
nnoremap <leader>pv :NERDTreeFind<bar> :vertical resize 45<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>F :Ag<CR>

" Map show undotree
nnoremap <leader>u :UndotreeShow<CR>

" Source vim init file
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" Copy to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
vnoremap <leader>p "_dP

" Delete previous
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" Move a line up or down
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

" Open Regex
nnoremap <leader>ps :Rg<Space>
" Open Explorer in a resized window sidebar
nnoremap <leader>ke :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ghw :h <C-R>=expand("<cword>")<CR><CR>

" Replace the word at cursor with another word
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>

" Format the whole file
nnoremap <leader>af :Neoformat<CR>

" Enable autocompletion:
set wildmode=longest,list,full
set wildmenu

"Ignrore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/.git/*

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" Shortcutting split navigation, saving a keypress:
nnoremap <C-h> :wincmd h<CR>
nnoremap <C-j> :wincmd j<CR>
nnoremap <C-k> :wincmd k<CR>
nnoremap <C-l> :wincmd l<CR>
" Replace all is aliased to S.
nnoremap S :%s//g<Left><Left>
" Resize windows
nnoremap <C-=> :vertical resize +5<CR>
nnoremap <C--> :vertical resize -5<CR>
nnoremap <leader>rp :resize 100<CR>

" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1 " hide helper
let g:NERDTreeIgnore = ['^node_modules$'] " ignore node_modules to increase load speed
let g:NERDTreeStatusline = '' " set to empty to use lightline
" " Toggle
noremap <silent> <leader>e :NERDTreeToggle<CR>
" " Close window if NERDTree is the last one
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

" Nerd Commenter
" " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" " Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" " Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" " Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1
" " Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" " Map ++ to call NERD Commenter and use iTerm key bindings
" " to bind Ctmd+/ to ++
vmap <C-/> <plug>NERDCommenterToggle
nmap <C-/> <plug>NERDCommenterToggle

" ALE (Asynchronous Lint Engine)
let g:ale_fixers = {
 \ 'javascript': ['eslint']
 \ }
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1

" COC
" " COC extension
let g:coc_user_config = {}
let g:coc_global_extensions = [
      \ 'coc-emmet',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-json',
      \ 'coc-prettier',
      \ 'coc-tsserver',
      \ 'coc-snippets',
      \ 'coc-lua',
      \ 'coc-angular',
      \ 'coc-python',
      \ 'coc-vetur',
      \ 'coc-stylelint',
      \ 'coc-eslint']
" " To go back to previous state use Ctrl+O
nmap <silent><leader>gd <Plug>(coc-definition)
nmap <silent><leader>gy <Plug>(coc-type-definition)
nmap <silent><leader>gi <Plug>(coc-implementation)
nmap <silent><leader>gr <Plug>(coc-references)

" " Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" " go back to previous file
nmap <leader>bb <C-^>
nmap <leader>bn :bn<CR>

" " Vue
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
autocmd BufWritePre *.vue Prettier
autocmd BufWritePre *.ts Prettier

" " emmet
let g:user_emmet_leader_key="<C-E>"

" " coc.nvim auto complete
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
