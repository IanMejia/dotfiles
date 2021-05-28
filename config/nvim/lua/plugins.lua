-- plugins list arranged via packer --
vim.cmd [[packadd packer.nvim]]
vim.cmd [[colorscheme gruvbox]]
local packer = require'packer'

local plugins = {
    {
        -- recurrent dependency [?]
        'wbthomason/packer.nvim',
        opt = true
    },
    {
        -- debuging seems nice(ish)
        'mfussenegger/nvim-dap',
        config = function() require [[config/dap]] end,
    },
    {
        'npxbr/gruvbox.nvim',
        requires = {'rktjmp/lush.nvim'}
    },
    {
        'nvim-treesitter/nvim-treesitter',
        config = function() require [[config/treesitter]] end,
        run = function() vim.cmd[[TSUpdate]] end
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
        -- completion engine
        'hrsh7th/nvim-compe',
        config = function() require [[config/compe]] end
    },
    {
        'norcalli/snippets.nvim',
        config = function() require [[config/snippets]] end
    },
    {
        'p00f/nvim-ts-rainbow',
        config = function() require [[config/rainbow]] end
    },
    {
        -- a statusline
        'glepnir/galaxyline.nvim',
        branch = 'main',
        config = function() require [[config/galaxyline]] end,
        -- file icons
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    },
    {
        'fatih/vim-go'
    },
    {
        'akinsho/flutter-tools.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require [[config/fluttertools]] end
    },
    {
        'hkupty/iron.nvim',
        config = function() require [[config/iron]] end
    },
    {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    },
    {
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons', opt = true}
    },
    {
        'tpope/vim-fugitive',
    },
    {
        'tpope/vim-surround',
    },
    {
        'norcalli/nvim-colorizer.lua',
    },
}
return packer.startup(function()
         for _,val in pairs(plugins) do
           packer.use(val)
         end
       end)
