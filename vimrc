call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'altercation/vim-colors-solarized'

call plug#end()

set nocompatible " get rid of Vi compatibility mode. SET FIRST!
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
autocmd FileType make setlocal noexpandtab " In Makefiles DO NOT use spaces instead of tabs
set ofu=syntaxcomplete#Complete  " Enable omnicompletion (to use, hold Ctrl+X then Ctrl+O while in Insert mode.

" Prettify JSON files
autocmd BufRead,BufNewFile *.json set filetype=json
autocmd Syntax json sou ~/.vim/syntax/json.vim

" Prettify Markdown files
augroup markdown
	au!
	au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

set number " show line numbers
set numberwidth=6 " make the number gutter 6 characters wide
syntax on " enable syntax highlighting (previously syntax on)
set cul " highlight current line

" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list

set tabstop=4 " tab spacing
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set expandtab " use spaces instead of tabs

" Highlight characters that go over 80 columns (by drawing a border on the 81st)
if exists('+colorcolumn')
	set colorcolumn=121
	highlight ColorColumn ctermbg=red
else
	highlight OverLength ctermbg=red ctermbg=white guibg=#592929
	match OverLength /\%81v.\+/
endif

