" vim-plugin
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'davidhalter/jedi-vim' " for python coding
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tyru/open-browser.vim' 

call plug#end()

"===== Look ===== 
set number 

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

" Key Mapping
inoremap <silent> jj <ESC>
cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'  

" Keymapping for unipaired.vim
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

" Keymapping for open-browser.vim
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
nnoremap <Leader>o :<C-u>excute "OpenBrowser" "file:///".expand('%:p:gs?\\?/?')<CR>


" Encoding
set encoding=utf-8
set fenc=utf-8

" Cursor
let &t_SI.="\e[6 q"
let &t_EI.="\e[2 q"

" Markdown
let g:vim_markdown_new_list_item_indent=2
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['csharp=cs'] " codeblockで別の言語を有効にする
let g:vim_markdown_strikethrough = 1 " 取り消し線

" ====== Command  ======
command! Terminal call popup_create(term_start([&shell], #{ hidden: 1, term_finish: 'close'}), #{ border: [], minwidth: winwidth(0)/2, minheight: &lines/2 })
