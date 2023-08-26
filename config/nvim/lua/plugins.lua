-- plugins list arranged via packer --
vim.cmd [[packadd packer.nvim]]
local packer = require 'packer'

require 'impatient'

local plugins = {
    {
        'lewis6991/impatient.nvim'
    },
    {
        -- recurrent dependency [?]
        'wbthomason/packer.nvim',
        opt = true
    },
    {
        'nvim-tree/nvim-web-devicons',
    },
    {
        -- debuging seems nice(ish)
        'mfussenegger/nvim-dap',
        config = function() require [[config/dap]] end,
    },
    {
        -- repls and arbitrary calls
        'Olical/conjure',
    },
    {
        'catppuccin/nvim', as = 'catppuccin',
        config = function() vim.cmd('colorscheme catppuccin-mocha') end
    },
    {
        'ggandor/leap.nvim',
        config = function() require('leap').add_default_mappings() end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        config = function() require [[config/treesitter]] end,
        run = function() vim.cmd [[TSUpdate]] end
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects'
    },
    {
        -- latex the right way
        'lervag/vimtex'
    },
    {
        'vimwiki/vimwiki'
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
        'hrsh7th/nvim-cmp',
        requires = {
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'hrsh7th/cmp-cmdline' },
            { 'saadparwaiz1/cmp_luasnip' },
        },
        config = function() require [[config/cmp]] end

    },
    {
        'L3MON4D3/LuaSnip'
    },
    {
        'mrjones2014/nvim-ts-rainbow',
        config = function() require [[config/rainbow]] end
    },
    {
        'nvim-lualine/lualine.nvim',
        config = function() require [[config/lualine]] end
    },
    {
        'romgrk/barbar.nvim',
    },
    {
        'ray-x/go.nvim',
        config = function() require 'go'.setup() end
    },
    {
        'simrat39/rust-tools.nvim',
        config = function() require [[config/rusttools]] end
    },
    {
        'akinsho/flutter-tools.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require [[config/fluttertools]] end
    },
    {
        'NTBBloodbath/rest.nvim',
        requires = { "nvim-lua/plenary.nvim" },
        config = function() require [[config/rest]] end,
    },
    {
        'hkupty/iron.nvim',
        config = function() require [[config/iron]] end,
    },
    {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } }
    },
    {
        'kyazdani42/nvim-tree.lua',
        config = function() require 'nvim-tree'.setup {} end
    },
    {
        'kylechui/nvim-surround',
        config = function() require 'nvim-surround'.setup {} end,
    },
    {
        'norcalli/nvim-colorizer.lua',
    },
    {
        'tpope/vim-fugitive',
    },
    {
        'tpope/vim-sexp-mappings-for-regular-people',
        requires = 'guns/vim-sexp'
    },
    {
        'tpope/vim-repeat'
    },
    {
        'jalvesaq/Nvim-R',
    },
}
return packer.startup(function()
    for _, val in pairs(plugins) do
        packer.use(val)
    end
end)
