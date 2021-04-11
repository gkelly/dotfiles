source ~/.vimrc.local

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'vimwiki/vimwiki'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'michal-h21/vim-zettel'
Plugin 'fatih/vim-go'
Plugin 'vim-airline/vim-airline'
Plugin 'flazz/vim-colorschemes'
call vundle#end()
filetype plugin indent on

" fzf
nmap <C-P> :FZF<CR>

" vimwiki
let g:vimwiki_list = [{'syntax': 'markdown', 'ext': '.md'}]

" vim-go
let g:go_fmt_fail_silently = 1
au FileType go nmap <LocalLeader>i :GoImports<CR>
au FileType go nmap <LocalLeader>a <Plug>(go-import)

set expandtab
set hidden
set nobackup
set noswapfile
set wrap
set nowritebackup
set ruler
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2
set wildmode=longest,list

let c_space_errors = 1
let python_space_errors = 1

map <Up> <NOP>
map <Down> <NOP>
map <Left> <NOP>
map <Right> <NOP>
map <End> <NOP>
map <Home> <NOP>

set tags=./tags;
syntax on

" Always show status line.
set laststatus=2

color charon
