" Ian's minimal init.vim to work with lua in the future

" lua initialization {{{
lua require("plugins")

" }}}

" general {{{
" basic
set tgc
set title
set titlestring=nvim:\ %f%m%r
set showmatch
set expandtab
set tabstop=4
set shiftwidth=4
set nojoinspaces
set splitbelow
set splitright
set ignorecase
set smartcase
set cursorline
set fileencoding=utf-8
set wrap
set linebreak
set tw=0
set clipboard+=unnamedplus
set listchars=tab:\ \ ,trail:·
set list

" addition for performance
set completeopt=menuone,noinsert,noselect
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set synmaxcol=180
set re=1
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c

filetype plugin indent on
syntax on

" spellcheck
set spelllang=en,es
augroup writting
    autocmd!
    autocmd FileType markdown,vimwiki,tex setlocal spell tw=80
augroup END

" number toggle
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * setlocal relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * setlocal norelativenumber
augroup END

" colorscheme
set background=dark
colorscheme gruvbox8_hard

" statusline
set statusline=
set statusline+=%f\ 
set statusline+=%r
set statusline+=%m
set statusline+=%=
set statusline+=%y\ 
set statusline+=%3p%%\ 
set statusline+=%3l:%2c\ 


" providers
let g:python3_host_prog = '/usr/bin/python'
let g:ruby_host_prog = '/usr/bin/ruby'
let g:npm_host_prog = '/usr/bin/npm'
let g:ruby_host_prog = '/usr/bin/gem'

" }}}

" keybindings {{{
" leader key
let mapleader = ","

" removing arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" init.vim
nnoremap <silent> <leader>ve :e $MYVIMRC<CR>
nnoremap <silent> <leader>vs :source $MYVIMRC<CR>

" tab movement
nnoremap <silent> <leader>tp :tabp<CR>
nnoremap <silent> <leader>tn :tabn<CR>
nnoremap <silent> <leader>tc :tabe<CR>
nnoremap <silent> <leader>tx :tabclose<CR>

" split
nnoremap <leader>sr :vsplit<CR>
nnoremap <leader>sd :split<CR>

" buffer movement
nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>

" <tab> mapping
imap <expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
imap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" html keybindings
augroup htmlMaps
    au!
    " preview html file on firefox
    au FileType html nnoremap <F5> :silent update<Bar>silent !firefox %:p &<CR>
augroup END

" python keybindings
augroup pythonMaps
    au!
    " run python script currently on the shell
    au FileType python nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<CR>
augroup END

" }}}

" folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
nnoremap <space> za
" }}}

" generic fold {{{
" }}}

" vim:foldmethod=marker:foldlevel=0