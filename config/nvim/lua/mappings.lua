-- mappings
local g = vim.g

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

g.mapleader = ','
g.maplocalleader = '\\'
local opts = {silent=true, noremap=true}

-- buffers
map('n', '<leader>bd', ':BufferClose<CR>', opts)
map('n', '<leader>bb', ':BufferOrderByBufferNumber<CR>', opts)
map('n', '<leader>bg', ':BufferPick<CR>', opts)
map('n', '<C-j>', ':bn<CR>', {silent=true})
map('n', '<C-k>', ':bp<CR>', {silent=true})

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


-- termmode
map('t', '<Esc>', '<C-\\><C-n>')

-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>f', ':NvimTreeFindFile<CR>', opts)

-- folding
map('n', '<space>', 'za')

-- <tab>
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})

-- telescope
map('n', '<leader>ff', ':Telescope find_files<CR>')
map('n', '<leader>fg', ':Telescope live_grep<CR>')
map('n', '<leader>fb', ':Telescope buffers<CR>')
map('n', '<leader>fh', ':Telescope help_tags<CR>')

map('n', '<Space>ld', ':Telescope diagnostics<CR>', opts)
map('n', '<Space>ca', ':Telescope lsp_code_actions<CR>', opts)
map('n', '<Space>lr', ':Telescope lsp_references<CR>', opts)
map('n', '<Space>ld', ':Telescope lsp_definitions<CR>', opts)
map('n', '<Space>ld', ':Telescope lsp_type_definitions<CR>', opts)
map('n', '<Space>li', ':Telescope lsp_implementations<CR>', opts)

-- dap
map('n', '<leader>dc', ':lua require"dap".continue()<CR>')
map('n', '<leader>dr', ':lua require"dap".repl.open()<CR>')
map('n', '<leader>db', ':lua require"dap".toggle_breakpoint()<CR>')
map('n', '<leader>dsn', ':lua require"dap".step_over()<CR>')
map('n', '<leader>dsi', ':lua require"dap".step_into()<CR>')

-- git
map('n', '<leader>gg', ':Git<CR>')
map('n', '<leader>gp', ':Git push<CR>')
map('n', '<leader>gpp', ':Git -c push.default=current push<CR>')

-- rest
map('n', '<leader>rr', '<cmd>lua require("rest-nvim").run()<CR>', opts)

-- lsp
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
map('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
map('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
map('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
map('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
map('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
map('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
map('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
map('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
