 set nocompatible               " be iMproved

" ---------------------- Bundle stuff ----------------------------------
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

" let Vundle manage Vundle - required!
Plugin 'VundleVim/Vundle.vim'

" ----------------------------------------------------------------------

Plugin 'altercation/vim-colors-solarized'

Plugin 'vimwiki'

Plugin 'dhruvasagar/vim-table-mode'

Plugin 'RDoc'

Plugin 'localvimrc'
let g:localvimrc_sandbox=0
let g:localvimrc_ask=0

Plugin 'vim-ruby/vim-ruby'

Plugin 'a.vim'

Plugin 'snipMate'

Plugin 'kovisoft/slimv'
let g:lisp_rainbow=1
let g:slimv_preferred = 'clisp'

Plugin 'thoughtbot/vim-rspec'

Plugin 'Markdown'

Plugin 'dgsuarez/vim-ticard'

Plugin 'openscad.vim'

Plugin 'jrozner/vim-antlr'

Plugin 'rust-lang/rust.vim'

Plugin 'autozimu/LanguageClient-neovim'

Plugin 'framallo/taskwarrior.vim'

" ----------------------------------------------------------------------
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" ----------------------------------------------------------------------

syntax on

set nobackup
set foldmethod=syntax
set cino=:0l1st0(0W4
set cscopeprg=mlcscope
set textwidth=76

colorscheme solarized

runtime macros/matchit.vim
runtime ftplugin/man.vim
nmap K :Man <cword><CR>
set hls

nmap <C-M-Space> <Plug>VimwikiToggleListItem

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

autocmd FileType ruby set sw=2 ts=2 expandtab
autocmd FileType antlr4 set sw=2 ts=2 expandtab
autocmd FileType c set sw=4 ts=4 expandtab

" --------------------------------------
" Start of LanguageClient configuration
" --------------------------------------
"
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'ruby': ['solargraph', 'stdio'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" --------------------------------------
" End of LanguageClient configuration
" --------------------------------------
