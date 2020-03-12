"-----------------------------------------------------------
"vundleに関する設定
"-----------------------------------------------------------
"set nocompatible
"filetype off
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()

"Plugin 'VundleVim/Vundle.vim'

" 導入したいプラグインを以下に列挙
" Plugin '[Github Author]/[Github repo]' の形式で記入
"Plugin 'airblade/vim-gitgutter'
"Plugin 'thinca/vim-quickrun'
"Plugin 'scrooloose/nerdtree'
"Plugin 'davidhalter/jedi-vim'
"call vundle#end()
"filetype plugin indent on


"-----------------------------------------------------------
"dein.vimに関する設定
"-----------------------------------------------------------
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('scrooloose/nerdtree')

call dein#add('airblade/vim-gitgutter')
call dein#add('thinca/vim-quickrun')
call dein#add('scrooloose/nerdtree')
call dein#add('davidhalter/jedi-vim')
"call dein#add('')
" (中略)

call dein#end()






"　その他のカスタム設定を以下に書く
"------------------------------------------------------------
"基本設定
"------------------------------------------------------------
scriptencoding utf-8
set fenc=utf-8
set tabstop=4 "インデントをスペース4つに設定
set shiftwidth=4
set softtabstop=4
set smarttab
syntax on "シンタックスハイライトを有効
set showmatch "相関するカッコを強調表示
set hlsearch "検索結果をハイライト 
set mouse=a "マウスの有効化
set clipboard=unnamedplus "クリップボード有効化
set autoindent "オートインデントの設定
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


"--------------------------------------------------------------
"jedi補完用の設定
"--------------------------------------------------------------
set completeopt=menuone                        " 補完候補を呼び出すとき常にポップアップメニューを使う
"autocmd! User jedi-vim call s:jedivim_hook()   " vim-plugの遅延ロード呼び出し
function! s:jedivim_hook()              " jedi-vimを使うときだけ呼び出す処理を関数化
  let g:jedi#auto_initialization    = 0 " 自動で実行される初期化処理を無効
  let g:jedi#auto_vim_configuration = 0 " 'completeopt' オプションを上書きしない
  let g:jedi#popup_on_dot           = 0 " ドット(.)を入力したとき自動で補完しない
  let g:jedi#popup_select_first     = 0 " 補完候補の1番目を選択しない
  let g:jedi#show_call_signatures   = 0 " 関数の引数表示を無効(ポップアップのバグを踏んだことがあるため)
  autocmd FileType python setlocal omnifunc=jedi#completions   " 補完エンジンはjediを使う
endfunction
