" vim-plugin
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'arzg/vim-colors-xcode'
Plug 'godlygeek/tabular'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tyru/open-browser.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'rust-lang/rust.vim'
Plug 'skanehira/gh.vim'
Plug 'mattn/emmet-vim'
Plug 'iberianpig/tig-explorer.vim'
Plug 'easymotion/vim-easymotion'
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

call plug#end()

"===== Look ===== 
set number 

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'minimalist'

" colorscheme
syntax on
colorscheme xcodedark
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none 

" terminal
set splitbelow

" others
set laststatus=2
set showcmd
set ruler
set clipboard+=unnamed

" HTML
augroup HTMLANDXML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
augroup END

"===== Preference ===== 
" File
filetype on
filetype plugin indent on
set hidden
set nobackup
set nowritebackup
set wildmode=list:longest
set history=2000
set shell=fish

" Indent
set shiftwidth=2
set tabstop=2

" Search
set hlsearch
set incsearch

" Key Mapping
inoremap <silent> jj <ESC>

" Key Mapping for Insert Mode
inoremap <C-a> <Home>
cnoremap <C-a> <Home>
inoremap <C-e> <End>
cnoremap <C-e> <End>
inoremap <C-p> <Up>
cnoremap <C-p> <Up>
inoremap <C-n> <Down>
cnoremap <C-n> <Down>
inoremap <C-b> <Left>
cnoremap <C-b> <Left>
inoremap <C-f> <Right>
cnoremap <C-f> <Right>

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

" ===== coc.vim =====
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" ===== Rust =====
let g:rustfmt_autosave = 1

" ===== fzf.vim =====
nnoremap <Leader>f :Files<CR>
nnoremap <leader>rg :Rg<CR>

" ===== tig-explorer.vim =====
" open tig
nnoremap <Leader>t :TigOpenProjectRootDir<CR>

" ===== easymotion =====
map <Leader> <Plug>(easymotion-prefix)
" let g:EasyMotion_do_mapping = 0 " Disable default mapping

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" ===== defx.vim =====
nnoremap <Leader>d :Defx<CR>
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> <CR> defx#do_action('open')
  nnoremap <silent><buffer><expr> c
  \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> m
  \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
  \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> l
  \ defx#do_action('open')
  nnoremap <silent><buffer><expr> E
  \ defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P
  \ defx#do_action('preview')
  nnoremap <silent><buffer><expr> o
  \ defx#do_action('open_tree', 'toggle')
  nnoremap <silent><buffer><expr> K
  \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N
  \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M
  \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C
  \ defx#do_action('toggle_columns',
  \                'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S
  \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d
  \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> r
  \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> !
  \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x
  \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
  \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .
  \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
  \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> h
  \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~
  \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q
  \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space>
  \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> *
  \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j
  \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
  \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> <C-l>
  \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g>
  \ defx#do_action('print')
  nnoremap <silent><buffer><expr> cd
  \ defx#do_action('change_vim_cwd')
endfunction

