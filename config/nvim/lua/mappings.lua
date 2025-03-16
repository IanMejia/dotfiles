-- mappings
local g = vim.g
local vim = vim

local map = vim.api.nvim_set_keymap
local vmap = vim.keymap.set
local opts = { noremap = true, silent = true }

g.mapleader = ','
g.maplocalleader = '\\'

-- buffers
map('n', '<leader>bd', ':BufferClose<CR>', opts)
map('n', '<leader>bb', ':BufferOrderByBufferNumber<CR>', opts)
map('n', '<leader>bg', ':BufferPick<CR>', opts)
map('n', '<C-j>', ':bn<CR>', opts)
map('n', '<C-k>', ':bp<CR>', opts)

-- remove arrows
map('n', '<Up>', '<Nop>', opts)
map('n', '<Down>', '<Nop>', opts)
map('n', '<Left>', '<Nop>', opts)
map('n', '<Right>', '<Nop>', opts)

-- init.lua
map('n', '<leader>ve', ':e $MYVIMRC<CR>', opts)
map('n', '<leader>vs', ':source $MYVIMRC<CR>', opts)

-- tab movement
map('n', '<leader>tp', ':tabp<CR>', opts)
map('n', '<leader>tn', ':tabn<CR>', opts)
map('n', '<leader>tc', ':tabe<CR>', opts)
map('n', '<leader>tx', ':tabclose<CR>', opts)

-- split
map('n', '<leader>sr', ':vsplit<CR>', opts)
map('n', '<leader>sd', ':split<CR>', opts)

-- termmode
map('t', '<Esc>', '<C-\\><C-n>', opts)

-- nvim-tree
map('n', '<C-n>', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>f', ':NvimTreeFindFile<CR>', opts)

-- folding
map('n', '<space>', 'za', opts)

-- <tab>
map('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', { expr = true })
map('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', { expr = true })

-- telescope
map('n', '<leader>tf', ':Telescope find_files<CR>', opts)
map('n', '<leader>tg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>tb', ':Telescope buffers<CR>', opts)
map('n', '<leader>th', ':Telescope help_tags<CR>', opts)

map('n', '<Space>td', ':Telescope diagnostics<CR>', opts)
map('n', '<Space>lr', ':Telescope lsp_references<CR>', opts)
map('n', '<Space>ld', ':Telescope lsp_definitions<CR>', opts)
map('n', '<Space>tt', ':Telescope lsp_type_definitions<CR>', opts)
map('n', '<Space>li', ':Telescope lsp_implementations<CR>', opts)
map('n', '<Space>ic', ':Telescope lsp_incoming_calls<CR>', opts)
map('n', '<Space>oc', ':Telescope lsp_outgoing_calls<CR>', opts)

map('n', '<leader>gb', ':Telescope git_branches<CR>', opts)

-- codecompanion
vmap({ 'n', 'v' }, '<leader>a', '<cmd>CodeCompanionChat Toggle<CR>', opts)
vmap('v', 'ga', '<cmd>CodeCompanionChat Add<CR>', opts)

-- dap
map('n', '<leader>dc', ':lua require"dap".continue()<CR>', opts)
map('n', '<leader>dr', ':lua require"dap".repl.open()<CR>', opts)
map('n', '<leader>db', ':lua require"dap".toggle_breakpoint()<CR>', opts)
map('n', '<leader>dsn', ':lua require"dap".step_over()<CR>', opts)
map('n', '<leader>dsi', ':lua require"dap".step_into()<CR>', opts)
map('n', '<leader>dsb', ':lua require"dap".step_back()<CR>', opts)
map('n', '<leader>dso', ':lua require"dap".step_out()<CR>', opts)

-- git
map('n', '<leader>gg', ':Git<CR>', opts)
map('n', '<leader>gp', ':Git push<CR>', opts)
map('n', '<leader>gpp', ':Git -c push.default=current push<CR>', opts)

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
map('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
map('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
map('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)
map('n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
map('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
