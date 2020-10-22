-- plugins list arranged via packer --

vim.cmd [[packadd packer.nvim]]
local packer = require('packer')

local plugins = {
    {
        -- the best possible gruvbox ever
        'lifepillar/vim-gruvbox8'
    },
    {
        -- latex the right way
        'lervag/vimtex',
        ft = {'tex'}
    },
    {
        -- recurrent dependency [?]
        'wbthomason/packer.nvim',
        opt = true
    },
    {
        -- an interesting plugin for syntax
        'nvim-treesitter/nvim-treesitter',
        config = 'require [[config/treesitter]]'
    },
    {
        -- every editor hates julia
        'JuliaEditorSupport/julia-vim'
    },
    {
        'neovim/nvim-lspconfig',
        config = 'require [[config/lsp]]'
    },
    {
        -- completion engine
        'nvim-lua/completion-nvim'
    },
    --{
    --},
    --{
    --},
}

return packer.startup(function()
         for _,val in pairs(plugins) do
           packer.use(val)
         end
       end)
