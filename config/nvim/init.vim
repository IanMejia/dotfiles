" Ian's init.vim
" The whole configuration of languages revolves around the usage of coc.

" plugins {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" language support
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'fatih/vim-go'
Plug 'JuliaEditorSupport/julia-vim'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'jalvesaq/Nvim-R', { 'for': 'r' }
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }

" various
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mcchrish/nnn.vim'
Plug 'segeljakt/vim-silicon', { 'on': ['Silicon', 'SiliconHighlight'] }
Plug 'honza/vim-snippets'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'

" visual
Plug 'morhetz/gruvbox'
Plug 'luochen1990/rainbow'
Plug 'itchyny/lightline.vim'

call plug#end()

" }}}

" plugin config {{{
" nnn
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }

" lightline
let g:lightline = {'colorscheme': 'gruvbox'}

" rainbow
let g:rainbow_active = 1

" latex config
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method= 'zathura'
let g:tex_flavor='latex'
let g:tex_conceal='abdmg'
let g:latex_to_unicode_tab = 0
let g:latex_to_unicode_auto = 1
set conceallevel=1

" coc
let g:coc_global_extensions = [
            \ 'coc-flutter',
            \ 'coc-julia',
            \ 'coc-go',
            \ 'coc-python',
            \ 'coc-lua',
            \ 'coc-r-lsp',
            \ 'coc-sh',
            \ 'coc-json',
            \ 'coc-snippets',
            \ 'coc-pairs',
            \ 'coc-marketplace',
            \ 'coc-lists',
            \ 'coc-markdownlint',
            \ 'coc-vimlsp',
            \]

" silicon
let g:silicon = {
            \ 'window-controls': v:false,
            \ 'round-corner': v:false,
            \ 'pad-vert': 0,
            \ 'pad-horiz': 0,
            \ }

" fzf
let g:fzf_layout = {'window': 'call CreateCenteredFloatingWindow()'}
let $FZF_DEFAULT_OPTS="--reverse --info=inline"

if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
    set grepprg=rg\ --vimgrep
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" }}}

" general {{{
" basic
set tgc
set title
set titlestring=nvim:\ %f%m%r
set showmatch
set noshowmode
set expandtab
set tabstop=4
set shiftwidth=4
set showtabline=2
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
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set synmaxcol=180
set re=1

" coc's optional configuration
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
    autocmd FileType markdown setlocal spell
    autocmd FileType markdown setlocal tw=80
    autocmd FileType tex setlocal spell
    autocmd FileType tex setlocal tw=80
augroup END

" colorscheme
set background=dark
let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox

" number toggle
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" providers
let g:python3_host_prog = '/usr/bin/python'
let g:python_host_prog = '/usr/bin/python2'

let g:ruby_host_prog = '/usr/bin/ruby'
let g:npm_host_prog = '/usr/bin/npm'
let g:ruby_host_prog = '/usr/bin/gem'

" }}}

" explorer {{{
" netrw
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=2
let g:netrw_altv=1
let g:netrw_winsize=25
" }}}

" folding {{{
set foldenable
set foldlevelstart=10
set foldnestmax=10
set foldmethod=syntax
nnoremap <space> za
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

" coc
nmap <leader>rn <Plug>(coc-rename)

" terminal mappings
noremap <silent> <A-t> :call FloatingTerminal()<CR>
tnoremap <silent> <A-t> <C-\><C-n>

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

" custom functions {{{
" floating window creation
function! CreateCenteredFloatingWindow()
    let opts = {
                \ 'width': float2nr(&columns * 0.666),
                \ 'height': float2nr(&lines * 0.666),
                \ 'row': float2nr(&lines * 0.166),
                \ 'col': float2nr(&columns * 0.166),
                \ 'relative': 'editor'
                \ }

    let buf = nvim_create_buf(v:false, v:true)
    let s:float_term_win = nvim_open_win(buf, v:true, opts)
    " Styling
    call setwinvar(s:float_term_win, '&winhl', 'Normal:Floating')
endfunction

" floating terminal
function! FloatingTerminal()
    call CreateCenteredFloatingWindow()
    if a:0 == 0
        terminal
    else
        call termopen(a:1)
    endif
    set nonumber
    set norelativenumber
    set signcolumn=no
    set nocursorline
    startinsert
    let s:term_win = win_getid()
endfunction

" }}}

" generic fold {{{
" }}}

" vim:foldmethod=marker:foldlevel=0
