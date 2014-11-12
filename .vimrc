execute pathogen#infect()
filetype plugin indent on

let g:go_fmt_fail_silently = 1
au FileType go nmap <LocalLeader>i :GoImports<CR>
au FileType go nmap <LocalLeader>a <Plug>(go-import)

set noswapfile
set expandtab
set nobackup
set nocompatible
set nowrap
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

map <LocalLeader>s {!}sort -d<CR>

hi Comment ctermfg=darkgray

set tags=./tags;
