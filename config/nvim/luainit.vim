" Ian's minimal init.vim to work with lua in the future

" lua initialization {{{
lua require("plugins")

" plugin configs
" compe
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

" vimtex
let g:vimtex_compiler_engine = 'lualatex'

" nvim-tree
let g:nvim_tree_hide_dotfiles = 1

" gruvbox
let g:gruvbox_contrast_dark = "hard"

let wiki = {}
let wiki.nested_syntaxes = {'python': 'python', 'bash': 'bash'}
let g:vimwiki_list = [wiki]

" }}}

" general {{{
" basic
set autoindent
set clipboard+=unnamedplus
set expandtab
set fileencoding=utf-8
set ignorecase
set linebreak
set lisp
set list
set listchars=tab:\ \ ,trail:·
set nojoinspaces
set noshowmode
set shiftwidth=4
set showmatch
set smartcase
set splitbelow
set splitright
set tabstop=4
set tgc
set title
set titlestring=nvim:\ %f%m%r
set tw=0
set wrap

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
    "autocmd BufEnter,FocusGained,InsertLeave * setlocal relativenumber
    "autocmd BufLeave,FocusLost,InsertEnter   * setlocal norelativenumber
    autocmd InsertLeave * setlocal relativenumber
    autocmd InsertEnter * setlocal norelativenumber
augroup END

" colorscheme
set background=dark
colorscheme gruvbox

" providers
let g:python3_host_prog = '/usr/bin/python'
"let g:ruby_host_prog = '/usr/bin/ruby'
"let g:npm_host_prog = '/usr/bin/npm'
"let g:ruby_host_prog = '/usr/bin/gem'

" latex
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method= 'zathura'
let g:tex_flavor='latex'
let g:tex_conceal='abdmg'
let g:latex_to_unicode_tab = 0
let g:latex_to_unicode_auto = 1
set conceallevel=1

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
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" termmode
tnoremap <Esc> <C-\><C-n>

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

" nvim-tree
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>

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
