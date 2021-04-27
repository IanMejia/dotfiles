-- mappings
local g = vim.g

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

g.mapleader = ','

-- remove arrows
map('n', '<Up>', '<Nop>')
map('n', '<Down>','<Nop>')
map('n', '<Left>', '<Nop>')
map('n', '<Right>', '<Nop>')

-- init.lua
map('n', '<leader>ve', ':e $MYVIMRC<CR>', {silent=true})
map('n', '<leader>vs', ':source $MYVIMRC<CR>', {silent=true})

-- tab movement
map('n', '<leader>tp', ':tabp<CR>', {silent=true})
map('n', '<leader>tn', ':tabn<CR>', {silent=true})
map('n', '<leader>tc', ':tabe<CR>', {silent=true})
map('n', '<leader>tx', ':tabclose<CR>', {silent=true})

-- split
map('n', '<leader>sr', ':vsplit<CR>', {silent=true})
map('n', '<leader>sd', ':split<CR>', {silent=true})

-- buffer
map('n', '<C-j>', ':bn<CR>', {silent=true})
map('n', '<C-k>', ':bp<CR>', {silent=true})

-- termmode
map('t', '<Esc>', '<C-\\><C-n>')

-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>')
map('n', '<leader>', ':NvimTreeFindFile<CR>')

-- folding
map('n', '<space>', 'za')

-- <tab>
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
