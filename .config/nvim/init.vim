" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
"
call plug#begin('~/.local/share/nvim/plugged')

" plugins
Plug 'morhetz/gruvbox'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'ddollar/nerdcommenter'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-fugitive'
Plug 'cespare/vim-toml'
Plug 'leafgarland/typescript-vim'
Plug 'sheerun/vim-polyglot'
Plug 'rafaeldelboni/vim-gdscript3'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

"*****************************************************************************
"" Basic Settings
"*****************************************************************************
" Theme
syntax on
syntax enable
filetype plugin indent on
colorscheme gruvbox
set background=dark
set colorcolumn=80
set number

" relative number in insert mode
autocmd InsertEnter * :set nonumber relativenumber
autocmd InsertLeave * :set number norelativenumber

" system shared clipboard
set clipboard=unnamedplus

set nowrap
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set showmatch

" show invisibles
set listchars=tab:>-,trail:~,extends:>,precedes:<
set list

" auto jumo at last position !
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"*****************************************************************************
"" Mappings
"*****************************************************************************

" leader key
let mapleader=" "
if has('nvim')
	tnoremap <Esc> <C-\><C-n>
endif
nnoremap <Leader><Leader> :e#<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>

"" reload vimrc
nnoremap <C-x><C-r>        :so $MYVIMRC<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

nmap <Leader>h :topleft vnew<CR>
nmap <Leader>l :botright vnew<CR>
nmap <Leader>k :topleft new<CR>
nmap <Leader>j :botright new<CR>

"" Vmap for maintain Visual Mode after shifting > and <
vnoremap < <gv
vnoremap > >gv
vnoremap <S-h> <gv
vnoremap <S-l> >gv


"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" fugitive git bindings
nnoremap <Leader>ga :Git add %:p<CR><CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gc :Gcommit -v -q<CR>
nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gw :Gwrite<CR><CR>
nnoremap <Leader>gl :BCommits<CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gb :Git branch<Space>
nnoremap <Leader>go :Git checkout<Space>
nnoremap <Leader>gv :Gbrowse<CR>
nnoremap <Leader>gps :Gpush<CR>
nnoremap <Leader>gpl :Gpull<CR>

" alternative tab navigation
nnoremap <A-1> 1gt
nnoremap <A-2> 2gt
nnoremap <A-3> 3gt
nnoremap <A-4> 4gt
nnoremap <A-5> 5gt
nnoremap <A-6> 6gt
nnoremap <A-7> 7gt
nnoremap <A-8> 8gt
nnoremap <A-9> 9gt
nnoremap <A-0> 10gt

function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" Debug colorscheme
nnoremap <Leader>sI :call <SID>SynStack()<CR>



"********************
"" plugins
"********************

" lightline
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightLineFilename'
      \ }
      \ }
function! LightLineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

set laststatus=2
set wildignore+=*.o

" nerdcommenter
filetype plugin on
map <Leader>/ :call NERDComment(0,"toggle")<CR>

" Mundo
map <Leader>u :MundoToggle<CR>

" NERDTree
map <Leader><Tab> <plug>NERDTreeTabsToggle<CR>
let NERDTreeMapActivateNode='l'

" load fzf
nnoremap <silent> <Leader>t :Files<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>f :BLines<CR>


"*****************************************************************************
"" Custom configs
"*****************************************************************************

" shell
autocmd FileType sh setlocal ts=2 sw=2 expandtab

" c
autocmd FileType c setlocal tabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 expandtab


" html
" for html files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab


" javascript
let g:javascript_enable_domhtmlcss = 1
set cole=0

" vim-javascript
" augroup vim-javascript
"   autocmd!
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2
" augroup END

" typescript
autocmd FileType typescript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2

" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" automatically trim whitespaces on save
fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

autocmd BufWritePre * :call TrimWhitespace()


" coc config
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <A-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <A-j> <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

let g:coc_snippet_next = '<tab>'

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
