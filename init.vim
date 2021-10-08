" My leader is space!
let mapleader=" "

" Pluggins
call plug#begin()
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mhinz/vim-startify'
Plug '~/ArchNaldo/vim-plugs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
call plug#end()

" ---------- Colorscheme ----------
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax enable
colorscheme mycolor 
" ---------- Colorscheme ----------

" ---------- Mappings ----------
" Move to previous/next
nnoremap <silent>    <A-left> :BufferPrevious<enter>
nnoremap <silent>    <A-right> :BufferNext<enter>

" Re-order to previous/next
nnoremap <silent>    <A-,> :BufferMovePrevious<enter>
nnoremap <silent>    <A-.> :BufferMoveNext<enter>

" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<enter>
nnoremap <silent>    <A-2> :BufferGoto 2<enter>
nnoremap <silent>    <A-3> :BufferGoto 3<enter>
nnoremap <silent>    <A-4> :BufferGoto 4<enter>
nnoremap <silent>    <A-5> :BufferGoto 5<enter>
nnoremap <silent>    <A-6> :BufferGoto 6<enter>
nnoremap <silent>    <A-7> :BufferGoto 7<enter>
nnoremap <silent>    <A-8> :BufferGoto 8<enter>
nnoremap <silent>    <A-9> :BufferLast<enter>

"COC.NVIM
nnoremap <silent><expr> <C-space> coc#refresh()

" GoTo code navigation.
nmap <silent> 	gd 	<Plug>(coc-definition)
nmap <silent> 	gy 	<Plug>(coc-type-definition)
nmap <silent> 	gi 	<Plug>(coc-implementation)
nmap <silent> 	gr 	<Plug>(coc-references)
nmap <silent> <Leader>r <Plug>(coc-rename)
nnoremap <silent> <C-space> :call <SID>show_documentation()<CR>

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Close buffer
nnoremap <silent> <A-c>	:BufferClose<enter>

" Toggle File Tree
nnoremap <silent> <leader><tab> :NERDTreeToggle<enter>

" Save File
nnoremap <leader>s :w<enter>

" Close Window
nnoremap <leader>q :q<enter>

" FZF mappings
nnoremap <leader>f :Files<enter>
nnoremap <leader>a :Files ~/<enter>
nnoremap <Leader>h :History<enter>
nnoremap <leader>b :Buffers<enter>
nnoremap <leader>t :Ag<enter>
" Mappings to move lines
nnoremap <A-down> :m .+1<CR>==
nnoremap <A-up> :m .-2<CR>==
inoremap <A-down> <Esc>:m .+1<CR>==gi
inoremap <A-up> <Esc>:m .-2<CR>==gi
vnoremap <A-down> :m '>+1<CR>gv=gv
vnoremap <A-up> :m '<-2<CR>gv=gv
" ---------- Mappings ----------

" ---------- Settings ----------
"  Necessary to user buffer properly
set encoding=utf-8
set number 
set hidden

" Changing indentation
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2
set autoindent

"Removes the funcking '~'
set fillchars=vert:\│,eob:\  
set updatetime=300
set nobackup
set nowritebackup
set cmdheight=2
" ---------- Settings ----------	

" ---------- On Startup -----------
" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight') 
" Set correct root dir for python projects
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']

"---------- On Startup -----------

" ---------- Functions ----------
" Check back space COC function
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Show documentation in preview popup
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" ---------- Functions ----------
