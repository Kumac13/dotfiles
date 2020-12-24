" vim-plugin
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'arzg/vim-colors-xcode'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'davidhalter/jedi-vim' " for python coding
Plug 'Yggdroot/indentLine'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"===== Look ===== 
set number 

" NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'deus'

" colorscheme
syntax on
colorscheme xcodedark

" others
set laststatus=2
set showcmd
set ruler
set clipboard+=unnamed

"===== Preference ===== 
" File
filetype on
set hidden

set wildmode=list:longest
set history=2000
set shell=fish

" indentCode用の設定
let g:indentLine_setColors = 0
let g:indentLine_fileTypeExclude = ['help', 'markdown']

" Key Mapping
inoremap <silent> jj <ESC>

" encoding
set encoding=utf-8
set fenc=utf-8

" Insert
let &t_SI.="\e[6 q"
let &t_EI.="\e[2 q"

" Markdown
let g:vim_markdown_new_list_item_indent=2

" ====== Command  ======
command! Terminal call popup_create(term_start([&shell], #{ hidden: 1, term_finish: 'close'}), #{ border: [], minwidth: winwidth(0)/2, minheight: &lines/2 })
