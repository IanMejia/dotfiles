-- plugins list arranged via packer --
vim.cmd [[packadd packer.nvim]]
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
        -- repls and arbitrary calls
        'Olical/conjure',
    },
    {
        'clojure-vim/vim-jack-in',
        requires = {{'tpope/vim-dispatch'},
		            {'radenling/vim-dispatch-neovim'}}
    },
    {
        'tpope/vim-sexp-mappings-for-regular-people',
        requires = 'guns/vim-sexp'
    },
    {
        'EdenEast/nightfox.nvim',
        config = function() require('nightfox').load() end
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
    --{
    --    -- completion engine
    --    'hrsh7th/nvim-compe',
    --    config = function() require [[config/compe]] end
    --},
    {
        'hrsh7th/nvim-cmp',
        requires = {{'hrsh7th/cmp-nvim-lsp'},
                    {'hrsh7th/cmp-buffer'},
                    {'hrsh7th/cmp-path'},
                    {'hrsh7th/cmp-cmdline'},
                    {'hrsh7th/cmp-nvim-lua'},
                    {'saadparwaiz1/cmp_luasnip'}},
        config = function() require [[config/cmp]] end

    },
    {
        'L3MON4D3/LuaSnip'
    },
    {
        'p00f/nvim-ts-rainbow',
        config = function() require [[config/rainbow]] end
    },
    {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function() require [[config/lualine]] end
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
        'NTBBloodbath/rest.nvim',
        requires = { "nvim-lua/plenary.nvim" },
        config = function()
            require("rest-nvim").setup({
            -- Open request results in a horizontal split
            result_split_horizontal = false,
            -- Skip SSL verification, useful for unknown certificates
            skip_ssl_verification = false,
            -- Highlight request on run
            highlight = {
                enabled = true,
                timeout = 150,
            },
            result = {
                -- toggle showing URL, HTTP info, headers at top the of result window
                show_url = true,
                show_http_info = true,
                show_headers = true,
            },
            -- Jump to request line on run
            jump_to_request = false,
            env_file = '.env',
            custom_dynamic_variables = {},
            yank_dry_run = true,
            })
        end,
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
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
        config = function() require'nvim-tree'.setup {} end
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
