syntax on
set autoindent
set smartindent
set cindent
set shiftwidth=4
set tabstop=4
set nobackup
set nowrapscan
set ignorecase
set hlsearch
set number
set nocompatible
set backspace=eol,start,indent
set ruler
set cursorline
set laststatus=2
set incsearch
set fencs=ucs-bom,utf-8,euc-kr.latin1
set fileencoding=utf-8
set tenc=utf-8
set background=dark
set history=1000
set t_Co=256
highlight Comment term=bold cterm=bold ctermfg=4
set wrap
set noswapfile
set lbr

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'taglist-plus'
Plugin 'bling/vim-airline'
Plugin 'vim-syntastic/syntastic'
Plugin 'nanotech/jellybeans.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'surround.vim'
Plugin 'iwataka/ctrlproj.vim'
Plugin 'Quich-Filter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'SirVer/ultisnips'
Plugin 'mattn/emmet-vim'
Plugin 'HTML.zip'
Plugin 'rking/ag.vim'
Plugin 'chrisbra/NrrwRgn'
Plugin 'MultipleSearch'
Plugin 'majutsushi/tagbar'
Plugin 'xuhdev/SingleCompile'
Plugin 'mhinz/vim-signify'
Plugin 'tommcdo/vim-lion'
Plugin 'tpope/vim-fugitive'
Plugin 'elzr/vim-json'
Plugin 'AutoComplPop'

call vundle#end()

filetype plugin indent on
colorscheme jellybeans

au FileType * setl fo-=cro

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|public$\|log$\|tmp$\|vendor$',
  \ 'file': '\.(exe|so|dll)$'
\ }

let Tlist_Use_Right_Window = 1
let Tlist_Auto_Open = 0
let Tlist_Exit_OnlyWindow = 0
let Tlist_Inc_Winwidth = 0
let Tlist_Ctags_Cmd = "/usr/bin/ctags"

map <F3> <C-w><C-v>
map <F4> <C-w><C-w>
map <F5> :NERDTreeToggle<cr>
map <F6> :TlistToggle<cr>
