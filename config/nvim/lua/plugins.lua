-- plugins list arranged via packer --
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
        'neovim/nvim-lspconfig'
        --config = 'require [[config/lsp]]'
    },
    {
        -- completion engine
        'nvim-lua/completion-nvim',
        requires = {{'SirVer/ultisnips'}, {'honza/vim-snippets'}}
    },
    {
        'luochen1990/rainbow',
        config = function() vim.cmd[[let g:rainbow_active = 1]] end
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
        'hkupty/iron.nvim',
        config = function() require [[config/iron]] end
    },
    {
        'jalvesaq/Nvim-R',
        branch = 'stable'
    },
    --{
    --},
}

return packer.startup(function()
         for _,val in pairs(plugins) do
           packer.use(val)
         end
       end)
