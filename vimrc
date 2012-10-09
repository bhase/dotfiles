 set nocompatible               " be iMproved

" ---------------------- Bundle stuff ----------------------------------
 
 filetype off                   " required!

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

Bundle 'clang-complete'
" Complete options (disable preview scratch window)
set completeopt="menu,menuone,longest,preview"
" Limit popup menu height
set pumheight=15

Bundle 'Solarized'
let g:solarized_termcolors=16
let g:solarized_termtrans=1
colorscheme solarized

Bundle 'table_format.vim'

Bundle 'SuperTab-continued.'
let g:SuperTabDefaultCompletionType = "context"

Bundle 'vimwiki'

Bundle 'RDoc'

Bundle 'localvimrc'
let g:localvimrc_sandbox=0
let g:localvimrc_ask=0

Bundle 'a.vim'

" ----------------------------------------------------------------------

runtime macros/matchit.vim
runtime ftplugin/man.vim
nmap K :Man <cword><CR>
set hls

if has("gui_running")
	nmap <C-space>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-space>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-space>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-space>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-space>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-space>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-space>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-space>d :cs find d <C-R>=expand("<cword>")<CR><CR>
else
	nmap <C-@>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>c :cs find c <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nmap <C-@>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nmap <C-@>i :cs find i <C-R>=expand("<cfile>")<CR>$<CR>
	nmap <C-@>d :cs find d <C-R>=expand("<cword>")<CR><CR>
endif
