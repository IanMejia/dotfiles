-- settings
local g = vim.g
local cmd = vim.cmd
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}
local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

local indent = 4

-- plugins
cmd('filetype plugin indent on')
cmd('syntax on')

-- general
opt('b', 'autoindent', true)
opt('b', 'expandtab', true)
opt('b', 'lisp', true)
opt('b', 'shiftwidth', indent)
opt('b', 'spelllang', 'en,es')
opt('b', 'tabstop', indent)
opt('o', 'background', 'dark')
opt('o', 'clipboard', 'unnamedplus')
opt('o', 'guifont', 'Fira Code Regular')
opt('o', 'ignorecase', true)
opt('o', 'joinspaces', false)
opt('o', 'mouse', "")
opt('o', 'shortmess', vim.o.shortmess .. 'c')
opt('o', 'showmatch', true)
opt('o', 'showmode', false)
opt('o', 'smartcase', true)
opt('o', 'splitbelow', true)
opt('o', 'splitright', true)
opt('o', 'termguicolors', true)
opt('o', 'title', true)
opt('w', 'conceallevel', 2)
opt('w', 'linebreak', true)
opt('w', 'list', true)
opt('w', 'listchars', 'tab:  ,trail:·')
opt('w', 'number', true)
opt('w', 'relativenumber', true)
opt('w', 'signcolumn', 'yes')
opt('w', 'wrap', true)

-- improve performance
opt('b', 'synmaxcol', 180)
opt('o', 'backup', false)
opt('o', 'cmdheight', 1)
opt('o', 'completeopt', 'menuone,noinsert,noselect')
opt('o', 'hidden', true)
opt('o', 'lazyredraw', true)
opt('o', 're', 1)
opt('o', 'scrolljump', 5)
opt('o', 'shiftround', true)
opt('o', 'updatetime', 300)
opt('o', 'writebackup', false)
opt('w', 'cursorcolumn', false)
opt('w', 'cursorline', false)

-- folding
opt('o', 'foldlevelstart', 10)
opt('w', 'foldenable', true)
opt('w', 'foldmethod', 'syntax')
opt('w', 'foldnestmax', 10)

-- Providers
g.loaded_node_provider = 0
g.loaded_perl_provider = 0
g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0

-- Plugin settings
--- vimtex
g.vimtex_compiler_progname = 'nvr'
g.vimtex_view_method = 'zathura'

--- nvim-r
g.R_assign = 2
