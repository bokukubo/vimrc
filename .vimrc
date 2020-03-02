"-----------------------------------------------------------
"vundleに関する設定
"-----------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'airblade/vim-gitgutter'
Plugin 'thinca/vim-quickrun'
Plugin 'scrooloose/nerdtree'
call vundle#end()
filetype plugin indent on

"　その他のカスタム設定を以下に書く
"------------------------------------------------------------
"基本設定
"------------------------------------------------------------
scriptencoding utf-8
set fenc=utf-8
set tabstop=4 "インデントをスペース4つに設定
syntax on "シンタックスハイライトを有効
set showmatch "相関するカッコを強調表示
set hlsearch "検索結果をハイライト 
"------------------------------------------------------------
"見た目設定
"------------------------------------------------------------
set number
set cursorline
"set cusorcolum
set virtualedit=onemore
set title
"------------------------------------------------------------
"検索に関する設定
"------------------------------------------------------------
set ignorecase
set smartcase
set wrapscan
set incsearch
"------------------------------------------------------------
"見た目設定
"------------------------------------------------------------
set number
set cursorline
"set cusorcolum
set virtualedit=onemore
"------------------------------------------------------------
"インサートモード中のキー割り当て
"------------------------------------------------------------
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap <silent> jk <Esc>
inoremap <silent> ｊｋ <Esc>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>


"--------------------------------------------------------------
"オートコンパイル用の設定
"--------------------------------------------------------------
filetype plugin on
augroup setAutoCompile
    autocmd!
   "autocmd BufWritePost *.tex :!latexmk %:p
    autocmd BufWritePost *.c :!gcc %:p
    autocmd BufWritePost *.cpp :!g++ -std=c++14 %:p
   "autocmd BufWritePost *.R :!R -f %:p
augroup END
