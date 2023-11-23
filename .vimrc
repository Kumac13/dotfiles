" vim-plugin

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'arzg/vim-colors-xcode'
  Plug 'godlygeek/tabular'
  Plug 'tyru/open-browser.vim'
  Plug 'easymotion/vim-easymotion'
  Plug 'ghifarit53/tokyonight-vim'
  Plug 'ruanyl/vim-gh-line'
  Plug 'machakann/vim-sandwich'
  Plug 'Kumac13/sfdx.vim'
  Plug 'Kumac13/vimo.vim'
  Plug 'ejholmes/vim-forcedotcom' " user for syntax highlight and format
  Plug 'LeafCage/vimhelpgenerator'
  Plug 'previm/previm'
  Plug 'pacha/vem-tabline'
  Plug 'github/copilot.vim'
  " lsp & ddc
  Plug 'prabirshrestha/vim-lsp'
  Plug 'mattn/vim-lsp-settings'
  Plug 'Shougo/ddc.vim'
  Plug 'shun/ddc-vim-lsp'
  Plug 'Shougo/ddc-ui-native'
  Plug 'Shougo/ddc-around'
  Plug 'Shougo/ddc-matcher_head'
  Plug 'Shougo/ddc-sorter_rank'
  Plug 'Shougo/ddc-converter_remove_overlap'
  Plug 'Shougo/pum.vim'
  Plug 'Shougo/ddc-ui-native'
  Plug 'LumaKernel/ddc-file'
  Plug 'vim-denops/denops.vim'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
  Plug 'hrsh7th/vim-eft'
  Plug 'gotchane/vim-git-commit-prefix'
  Plug 'lambdalisue/fern.vim'
call plug#end()
"===== Set =====
set nonumber
set splitright
set splitbelow
set wildmenu
set showtabline=2
set shortmess-=S
set ambiwidth=double
set noswapfile

"===== Color =====
set termguicolors
colorscheme tokyonight
let g:tokyonight_disable_italic_comment = 1
let g:lightline = {'colorscheme': 'tokyonight'}

" others
set laststatus=0
set showcmd
set ruler
if !has('mac')
  set clipboard+=unnamed
  set clipboard=unnamedplus
else
  set clipboard+=unnamed
endif

set viminfofile=NONE
set ff=unix

"===== Preference =====
" Encoding
set encoding=utf-8
set fenc=utf-8

" File
filetype on
filetype plugin indent on
set hidden
set nobackup
set nowritebackup
set wildmode=list:longest
set history=2000
set shell=fish
set backspace=indent,eol,start
autocmd BufWritePre * :%s/\s\+$//e

" Indent
set expandtab
set shiftwidth=2
set tabstop=2
set autoindent
set smartindent

augroup fileTypeIndent
  autocmd!
  autocmd BufNewFile,BufRead *.java setlocal tabstop=4 shiftwidth=4
augroup END

" Search
set hlsearch
set incsearch

" Key Mapping
inoremap <silent> jj <ESC>

" Key Mapping for Leader
nnoremap <silent> <Leader>q :q<CR>
nnoremap <silent> <Leader>w :w<CR>

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
nnoremap <silent> [b :bp<CR>
nnoremap <silent> ]b :bn<CR>

" Keymapping for open-browser.vim
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
nnoremap <Leader>o :<C-u>excute "OpenBrowser" "file:///".expand('%:p:gs?\\?/?')<CR>

" Cursor
let &t_SI.="\e[6 q"
let &t_EI.="\e[2 q"

" Markdown
let g:vim_markdown_new_list_item_indent=2
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['csharp=cs'] " codeblockで別の言語を有効にする
let g:vim_markdown_strikethrough = 1 " 取り消し線

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" ===== Rust =====
let g:rustfmt_autosave = 1

" ===== fzf.vim =====
nnoremap <Leader>f :GFiles<CR>
nnoremap <leader>rg :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>c :Commits<CR>
nnoremap <leader>bc :BCommits<CR>
nnoremap <leader>cm :Commands<CR>
nnoremap <leader>h :History:<CR>

" ===== easymotion =====
map <Leader> <Plug>(easymotion-prefix)
" let g:EasyMotion_do_mapping = 0 " Disable default mapping

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
" nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

map <Leader>j <Plug>(easymotion-w)
map <Leader>k <Plug>(easymotion-b)

"===== Fern =====
nnoremap <leader>n :Fern .

"===== URL paste =====
let s:clipboard_register = has('linux') || has('unix') ? '+' : '*'
function! InsertMarkdownLink() abort
  " use register `9`
  let old = getreg('9')
  let link = trim(getreg(s:clipboard_register))
  if link !~# '^http.*'
    normal! gvp
    return
  endif

  " replace `[text](link)` to selected text
  normal! gv"9y
  let word = getreg(9)
  let newtext = printf('[%s](%s)', word, link)
  call setreg(9, newtext)
  normal! gv"9p

  " restore old data
  call setreg(9, old)
endfunction

augroup markdown-insert-link
  au!
  au FileType markdown vnoremap <buffer> <silent> p :<C-u>call InsertMarkdownLink()<CR>
augroup END

"===== tig setting =====
nnoremap <silent> <Leader>t :<C-u>silent call <SID>tig_status()<CR>
function! s:tig_status() abort
    call s:open_term('tig status')
endfunction

function! s:open_term(cmd) abort
    let split = s:split_type()

    call execute(printf('%s term ++close %s', split, a:cmd))

    setlocal bufhidden=delete
    setlocal noswapfile
    setlocal nobuflisted
endfunction

function! s:split_type() abort
    " NOTE: my cell ratio: width:height == 1:2.1
    let width = winwidth(win_getid())
    let height = winheight(win_getid()) * 2.1

    if height > width
        return 'bo'
    else
        return 'vert'
    endif
endfunction

"===== previm =====
nnoremap <silent> <Leader>pr :PrevimOpen<CR>

"===== git commit ====
function! s:select_type() abort
  let line = substitute(getline('.'), '^#\s*', '', 'g')
  let title = printf('%s: ', split(line, ' ')[0])

  silent! normal!
  silent! put! =title
  silent! startinsert!
endfunction

nnoremap <buffer> <CR><CR> <Cmd>call <SID>select_type()<CR>

"===== Prettier =====
augroup fmt
  autocmd!
  autocmd BufWrite *.cls,*.trigger PrettierAsync
augroup END

"===== ddc =====
call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('sources', ['vim-lsp','around', 'file'])
call ddc#custom#patch_global('sourceOptions', {
       \ '_': {
       \   'matchers': ['matcher_head'],
       \   'sorters': ['sorter_rank'],
       \   'converters': ['converter_remove_overlap'],
       \ },
       \ 'around': {'mark': 'Around'},
       \ 'vim-lsp': {
       \   'mark': 'LSP',
       \   'matchers': ['matcher_head'],
       \   'forceCompletionPattern': '\.|:|->|"\w+/*'
       \ },
       \ 'file': {
       \   'mark': 'file',
       \   'isVolatile': v:true,
       \   'forceCompletionPattern': '\S/\S*'
       \ }})

" Mappings
" <TAB>: completion.
inoremap <silent><expr> <TAB>
\ ddc#map#pum_visible() ? '<C-n>' :
\ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
\ '<TAB>' : ddc#map#manual_complete()

" <S-TAB>: completion back.
inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'

" Use ddc.
call ddc#enable()

" WSL yank support
if !has('mac')
  let s:clip = '/mnt/c/Windows/System32/clip.exe'
  if executable(s:clip)
    augroup WSLYank
      autocmd!
      autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
  endif
endif

"===== vim-lsp =====
let g:lsp_diagnostics_enabled = 1         " disable diagnostics support
let g:lsp_diagnostics_virtual_text_enabled = 0

"===== vim-eft ======
  nmap ; <Plug>(eft-repeat)
  xmap ; <Plug>(eft-repeat)
  omap ; <Plug>(eft-repeat)

  nmap f <Plug>(eft-f)
  xmap f <Plug>(eft-f)
  omap f <Plug>(eft-f)
  nmap F <Plug>(eft-F)
  xmap F <Plug>(eft-F)
  omap F <Plug>(eft-F)

  nmap t <Plug>(eft-t)
  xmap t <Plug>(eft-t)
  omap t <Plug>(eft-t)
  nmap T <Plug>(eft-T)
  xmap T <Plug>(eft-T)
  omap T <Plug>(eft-T)

"==== oepn relative path =====
nnoremap <leader>o :call OpenRelativePath()<CR>

function! OpenRelativePath()
  let path = expand('<cfile>')

  if !filereadable(path)
    echo "File is not exist:".path
    return
  endif

  for bufnr in range(1, bufnr('$'))
    if bufname(bufnr) == path && buflisted(bufnr)
      execute 'buffer '.bufnr
      return
    endif
  endfor

  execute 'edit '.path
endfunction

"==== vimo.vim =====
nnoremap <leader>vm :VimoMonologue<CR>
