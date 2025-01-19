" @author nate zhou
" @since 2023,2024,2025

let mapleader=" "   " set space as leader key

colorscheme unixchad
syntax on
set encoding=utf-8
set title           " terminal title
set background=dark
set mouse=          " disable mouse clicks
set clipboard=unnamedplus

set nohlsearch
set ignorecase      " case insensitive searching
set smartcase       " search case insensitive; if upper exists sensitive;

set number
set relativenumber
set cc=80
set cursorline
set cursorcolumn
match ExtraWhitespace /\s\+$/ " space at the end of lines
highlight ExtraWhitespace ctermbg=gray guibg=gray " highlight all trailing spaces
set statusline+=%f\ %h%m%r%=\ %{FugitiveStatusline()}\ %-8.(%l,%c%)\ %P

" don't yank to clipboard with c
nnoremap c "_c
" ex mode type Q as q!
cnoremap Q q!

set expandtab		" expand tab input with spaces
set tabstop=4		" spaces per tab
set shiftwidth=4	" spaces per indentation level
set smartindent		" aware indentations for newline insert

" keybindings
" move focus to next split instead of resizing
nnoremap <Tab> <C-W>w
" split open (<leader>q quit a split)
map <leader>x :split<CR>
map <leader>v :vsplit<CR>
" split movement with ctrl+h/j/k/l
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" split resize with ctrl+y/u/i/o
map <C-y> :vertical resize -2<CR>
map <C-u> :resize +2<CR>
map <C-i> :resize -2<CR>
map <C-o> :vertical resize +2<CR>

map <leader>s :set spell!<CR>
map <leader>w :set wrap!<CR>
map <leader>C :set cursorcolumn!<CR>
map <leader>h :set hlsearch!<CR>
map <leader>t :tabnew<CR>
map <leader>p :tabprev<CR>
map <leader>n :tabnext<CR>

map <leader>f :FZF<CR>
map <leader>g :G<CR>
map <leader>dx :Gdiffsplit<CR>
map <leader>dv :Gvdiffsplit<CR>
map <leader><Tab> :NERDTreeToggle<CR>
map <leader>ct :ColorizerToggle<CR>
map <leader>cr :ColorizerReloadAllBuffers<CR>

" don't comment on new line
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Enable spell check for Git commit
augroup git_commit_spell
    autocmd!
    autocmd FileType gitcommit setlocal spell spelllang=en_us
augroup END

" Set column count to 72 for Git commit
augroup git_commit_cc
    autocmd!
    autocmd FileType gitcommit setlocal cc=72
augroup END

" vim-plug
call plug#begin()
"Plug 'ap/vim-css-color' " CSS color preview
Plug 'norcalli/nvim-colorizer.lua' " better color support
Plug 'tpope/vim-fugitive' " Git integration
Plug 'preservim/nerdtree'
call plug#end()

" nvim-colorizer
set termguicolors
"lua require'colorizer'.setup()
autocmd VimEnter * ColorizerToggle
