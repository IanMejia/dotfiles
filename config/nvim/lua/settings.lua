-- settings
local g = vim.g
local cmd = vim.cmd
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local function opt(scope, key, value)
  scopes[scope][key] = value
  --if scope ~= 'o' then scopes['o'][key] = value end
end

local indent = 4

-- plugins
cmd('filetype plugin indent on')
cmd('syntax on')

-- general
opt('b', 'shiftwidth', indent)
opt('b', 'tabstop', indent)
opt('o', 'autoindent', true)
opt('o', 'clipboard', 'unnamedplus')
opt('o', 'expandtab', true)
opt('o', 'fileencoding', 'utf-8')
opt('o', 'ignorecase', true)
opt('o', 'joinspaces', false)
opt('o', 'linebreak', true)
opt('o', 'lisp', true)
opt('o', 'shortmess', vim.o.shortmess .. 'c')
opt('o', 'showmatch', true)
opt('o', 'showmode', false)
opt('o', 'smartcase', true)
opt('o', 'spelllang', 'en,es')
opt('o', 'splitbelow', true)
opt('o', 'splitright', true)
opt('o', 'termguicolors', true)
opt('o', 'title', true)
opt('o', 'wrap', true)
opt('w', 'conceallevel', 1)
opt('w', 'list', true)
opt('w', 'listchars', 'tab:<->,trail:·')
opt('w', 'relativenumber', true)

-- improve performance
opt('o', 'backup', false)
opt('o', 'cmdheight', 1)
opt('o', 'completeopt', 'menu,noinsert,noselect')
opt('o', 'cursorcolumn', false)
opt('o', 'cursorline', false)
opt('o', 'hidden', true)
opt('o', 'lazyredraw', true)
opt('o', 're', 1)
opt('o', 'scrolljump', 5)
opt('o', 'shiftround', true)
opt('o', 'synmaxcol', 180)
opt('o', 'updatetime', 300)
opt('o', 'writebackup', false)
opt('o', 'background', 'dark')

-- folding
opt('o', 'foldlevelstart', 10)
opt('w', 'foldenable', true)
opt('w', 'foldmethod', 'syntax')
opt('w', 'foldnestmax', 10)

-- Providers
g.python3_host_prog = '/usr/bin/python'

-- Plugin settings
--- gruvbox
g.gruvbox_contrast_dark = 'hard'

--- nvim tree
g.nvim_tree_hide_dotfiles = 1

--- vimtex
g.latex_to_unicode_auto = 1
g.latex_to_unicode_tab = 0
g.tex_conceal = 'abdmg'
g.tex_flavor = 'latex'
g.vimtex_compiler_progname = 'nvr'
g.vimtex_view_method = 'zathura'
