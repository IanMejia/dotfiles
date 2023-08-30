-- Lazy validation
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
vim.loader.enable()


local plugins = {
    {
        -- debuging seems nice(ish)
        'mfussenegger/nvim-dap',
        config = function() require 'config.dap' end,
    },
    {
        -- repls and arbitrary calls
        'Olical/conjure',
        ft = { 'clojure', 'lisp', 'commonlistp' }
    },
    {
        'catppuccin/nvim',
        priority = 1000,
        lazy = false,
        config = function() vim.cmd('colorscheme catppuccin-mocha') end
    },
    {
        'ggandor/leap.nvim',
        lazy = false,
        config = function() require('leap').add_default_mappings() end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        opts = function() require 'config.treesitter' end,
        -- run = function() vim.cmd [[TSUpdate]] end
    },
    {
        'neovim/nvim-lspconfig',
        lazy = false,
        config = function() require 'config.lsp' end,
    },
    {
        'hrsh7th/nvim-cmp',
        lazy = false,
        dependencies = {
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function() require 'config.cmp' end

    },
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        config = function() require 'config.lualine' end
    },
    {
        'ray-x/go.nvim',
        ft = 'go',
        opts = {}
    },
    {
        'simrat39/rust-tools.nvim',
        opts = function() require 'config.rusttools' end,
        ft = "rust"
    },
    {
        'NTBBloodbath/rest.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        -- config = function() require [[config/rest]] end,
        opts = {}
    },
    {
        'nvim-telescope/telescope.nvim',
        lazy = false,
        dependencies = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' },
    },
    {
        'kyazdani42/nvim-tree.lua',
        lazy = false,
        opts = {}
    },
    {
        'kylechui/nvim-surround',
        lazy = false,
        opts = {}
    },
    {
        'romgrk/barbar.nvim',
        lazy = false
    },
    {
        'tpope/vim-sexp-mappings-for-regular-people',
        dependencies = 'guns/vim-sexp'
    },
    {
        'akinsho/flutter-tools.nvim',
        ft = "flutter",
        opts = {}
    },
    {
        'hkupty/iron.nvim',
        config = function() require 'config.iron' end,
    },
    {
        'tpope/vim-fugitive',
        cmd = "Git",
    },
    -- {
    --     -- every editor hates julia
    --     'JuliaEditorSupport/julia-vim',
    --     ft = {'julia', 'jl'},
    --     lazy = true
    -- },

    'tpope/vim-repeat',
    'jalvesaq/Nvim-R',
    'norcalli/nvim-colorizer.lua',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'vimwiki/vimwiki',
    'nvim-tree/nvim-web-devicons',

    -- latex the right way
    'lervag/vimtex',
}

require('lazy').setup(plugins, {
    defaults = { lazy = true },
    performance = {
        cache = { enabled = true },
        rtp = {
            disabled_plugins = {
                'gzip',
                'matchit',
                'matchparen',
                'netrwPlugin',
                'rplugin',
                'tarPlugin',
                'tohtml',
                'tutor',
                'zipPlugin',
            },
        },
    },
})
