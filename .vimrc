filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab

" Line numbers
set nu

set encoding=utf-8
syntax on

set nocompatible              " be iMproved, required
" filetype off                  " required

" Localleader to \\
let Localleader="\\"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')

" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugin list
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tmhedberg/SimpylFold'
Plugin 'cburroughs/pep8.py'
Plugin 'nvie/vim-flake8'
Plugin 'ervandew/supertab'
Plugin 'lervag/vimtex'
Plugin 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" End vundle
call vundle#end()            " required
filetype plugin indent on    " required

" Call Flake8 on Python Save
" autocmd BufWritePost *.py call Flake8()

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" disable some syntastic comments
let g:syntastic_quiet_messages = { "regex": [
        \ '\mpossible unwanted space at "{"',
        \ ] }

" Vimtex
let g:tex_flavor = 'latex'
if !exists('g:ycm_semantic_triggers')
    let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme
let g:vimtex_view_automatic = 1 " Opens PDF
let g:vimtex_view_general_viewer = "evince"
