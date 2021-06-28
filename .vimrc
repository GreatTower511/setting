function! s:WithoutBundles()
endfunction

function! s:LoadBundles()
  NeoBundle 'Shougo/neobundle.vim'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle "ctrlpvim/ctrlp.vim"
  NeoBundle 'bronson/vim-trailing-whitespace'
  NeoBundle 'croaker/mustang-vim'
  NeoBundle 'othree/yajs.vim'
  NeoBundle 'maxmellon/vim-jsx-pretty'
  NeoBundle 'nathanaelkane/vim-indent-guides'
  NeoBundle "kana/vim-smartinput"
  NeoBundle 'Shougo/neocomplete.vim'
  NeoBundle 'leafgarland/typescript-vim'
  NeoBundle 'rking/ag.vim'
  NeoBundle 'junegunn/fzf.vim'
  NeoBundle 'slim-template/vim-slim'
endfunction

function! s:InitNeoBundle()
  if isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    filetype plugin indent off
    if has('vim_starting')
      set runtimepath+=~/.vim/bundle/neobundle.vim/
    endif
    try
      call neobundle#begin(expand('~/.vim/bundle/'))
      call s:LoadBundles()
      call neobundle#end()
    catch
      call s:WithoutBundles()
    endtry
  else
    call s:WithoutBundles()
  endif

  filetype indent plugin on
  syntax enable
  colorscheme mustang
  let g:hybrid_custom_term_colors = 1
  set background=dark
endfunction

function! HardMode ()
  noremap <Up> <Nop>
  noremap <Down> <Nop>
  noremap <Left> <Nop>
  noremap <Right> <Nop>
endfunction

function! EasyMode ()
  noremap <Up> <Up>
  noremap <Down> <Down>
  noremap <Left> <Left>
  noremap <Right> <Right>
endfunction

let NERDTreeShowHidden = 1
map <C-r> gt
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap  <C-a><C-a> <C-w>10<
nnoremap  <C-x><C-x> <C-w>10>
nnoremap  <C-s> :w<CR>
nnoremap  [q :cnext<CR>
nnoremap  ]q :cprevious<CR>
nnoremap  [Q :<C-u>cfirst<CR>
nnoremap  ]Q :<C-u>clast<CR>
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
command! HardMode call HardMode()
command! EasyMode call EasyMode()
call HardMode()
set cursorline
set cursorcolumn
set virtualedit=onemore
set showmatch
set wildmode=list:longest
set number
set backspace=indent,eol,start
set list listchars=tab:\▸\-
call s:InitNeoBundle()
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))

set colorcolumn=80

set rtp+=/usr/local/opt/fzf

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"起動時に有効
let g:neocomplete#enable_at_startup = 1
"ポップアップメニューで表示される候補の数
let g:neocomplete#max_list = 50
"キーワードの長さ、デフォルトで80
let g:neocomplete#max_keyword_width = 80
let g:neocomplete#enable_ignore_case = 1
highlight Pmenu ctermbg=6
highlight PmenuSel ctermbg=3
highlight PMenuSbar ctermbg=0
" Ctrl-n で次の候補、Ctrl-p で前の候補
"inoremap <expr><CR>  pumvisible() ? neocomplete#close_popup() : “<CR>”

" vimdiffの色設定
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21
