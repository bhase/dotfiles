 set nocompatible               " be iMproved
 filetype off                   " required!
 
 set t_Co=16

 set rtp+=~/.vim/bundle/vundle/
 call vundle#rc()

 " let Vundle manage Vundle
 " required! 
 Bundle 'gmarik/vundle'

 " My Bundles here:
 "
 " original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
 " vim-scripts repos
" Bundle 'L9'
" Bundle 'FuzzyFinder'
 " non github repos
" Bundle 'git://git.wincent.com/command-t.git'
 " ...

 filetype plugin indent on     " required!
 "
 " Brief help
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

syntax on

set nobackup
set foldmethod=syntax
set cino=:0l1st0(0W4
set cscopeprg=mlcscope
set textwidth=76
"filetype plugin on

Bundle 'clang-complete'
" Complete options (disable preview scratch window)
set completeopt="menu,menuone,longest,preview"
" Limit popup menu height
set pumheight=15

Bundle 'Solarized'
let g:solarized_termcolors=16
colorscheme solarized

Bundle 'table_format.vim'

Bundle 'SuperTab-continued.'
let g:SuperTabDefaultCompletionType = "context"

runtime macros/matchit.vim
