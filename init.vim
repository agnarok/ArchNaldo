	" Pluggins
call plug#begin()
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'jacoborus/tender.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'
Plug 'agude/vim-eldar'
Plug 'mhinz/vim-startify'
Plug '~/ArchNaldo/vim-plugs'
call plug#end()

" ---------- Colorscheme ----------
set termguicolors
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
syntax enable
colorscheme mycolor 
" ---------- Colorscheme ----------

" ---------- Mappings ----------
" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
	nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" Toggle File Tree
nnoremap <Space><Tab> <cmd>CHADopen<cr>
" ---------- Mappings ----------

" ---------- Settings ----------
"  Necessary to user buffer properly
set hidden
set mouse=a
"Removes the funcking '~'
set fillchars=vert:\│,eob:\  
" ---------- Settings ----------	

" ---------- On Startup -----------
" Start CHADTree. If a file is specified, move the cursor to its window.
autocmd VimEnter * if !argc() | CHADopen 

" ---------- On Startup -----------
