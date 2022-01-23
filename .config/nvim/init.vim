call plug#begin()
	Plug 'lervag/vimtex'
	Plug 'dense-analysis/ale'
	" Use release branch (recommend)
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

filetype plugin indent on
syntax enable

let g:tex_flavor = "latex"
let g:vimtex_view_general_viewer = 'evince'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_compiler_latexmk = {
\ 'options' : [
\   '-pdflatex=lualatex',
\   '-pdf',
\ ],
\}

set number
set title
syntax on

set tabstop=8
set softtabstop=8
set shiftwidth=8
set noexpandtab
