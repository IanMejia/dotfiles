-- plugins list arranged via packer --
local vim = vim

vim.cmd [[packadd packer.nvim]]
local packer = require('packer')

local plugins = {
    {
        -- recurrent dependency [?]
        'wbthomason/packer.nvim',
        opt = true
    },
    {
        -- the best possible gruvbox ever
        'lifepillar/vim-gruvbox8'
    },
    {
        'nvim-treesitter/nvim-treesitter',
        run = 'TSUpdate'
    },
    {
        -- latex the right way
        'lervag/vimtex',
        ft = {'tex'}
    },
    {
        -- every editor hates julia
        'JuliaEditorSupport/julia-vim'
    },
    {
        'neovim/nvim-lspconfig'
        --config = 'require [[config/lsp]]'
    },
    {
        -- completion engine
        'nvim-lua/completion-nvim',
        requires = {{'SirVer/ultisnips', opt = true}, {'honza/vim-snippets', opt = true}},
    },
    {
        'luochen1990/rainbow',
        config = 'vim.cmd[[let g:rainbow_active = 1]]'
    },
    {
        -- a statusline
        'glepnir/galaxyline.nvim',
        branch = 'main',
        config = 'require [[config/galaxyline]]',
        -- file icons
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    },
    --{
    --},
}

return packer.startup(function()
         for _,val in pairs(plugins) do
           packer.use(val)
         end
       end)
