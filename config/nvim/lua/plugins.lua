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
    ft = { 'clojure', 'lisp', 'commonlisp' },
    dependencies = { "PaterJason/cmp-conjure" }
  },
  {
    'windwp/nvim-autopairs',
    opts = {},
    config = function() require 'config.aupairs' end
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
    dependencies = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'RRethy/nvim-treesitter-textsubjects',
      'RRethy/nvim-treesitter-endwise',
      'windwp/nvim-ts-autotag',
    },
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require 'config.treesitter'
    end,
  },
  {
    'neovim/nvim-lspconfig',
    lazy = false,
    config = function() require 'config.lsp' end,
  },
  {
    'nvimdev/lspsaga.nvim',
    event = { "LspAttach" },
    opts = {},
  },
  {
    'hrsh7th/nvim-cmp',
    lazy = false,
    dependencies = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
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
    ft = { 'go', 'gomod' },
    config = function() require("go").setup() end,
    event = { "CmdlineEnter" },
    dependencies = {
      "ray-x/guihua.lua",
    },
    -- build = ':lua require("go.install").update_all_sync()'
  },
  {
    'simrat39/rust-tools.nvim',
    opts = function() require 'config.rusttools' end,
    ft = "rust"
  },
  {
    "rest-nvim/rest.nvim",
    ft = "http",
    dependencies = { "luarocks.nvim" },
    config = function()
      require("rest-nvim").setup()
    end,
    lazy = false,
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
    'tpope/vim-abolish',
    lazy = false
  },
  {
    "olimorris/codecompanion.nvim",
    config = function() require 'config.codecompanion' end,
    lazy = false,
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
    cmd = "IronRepl",
  },
  {
    'tpope/vim-fugitive',
    cmd = "Git",
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
    opts = {},
    lazy = false
  },
  -- {
  --   'zbirenbaum/copilot.lua',
  --   cmd = 'Copilot',
  --   event = 'InsertEnter',
  --   config = function()
  --     require('copilot').setup(
  --       {
  --         suggestion = { enabled = false },
  --         panel = { enabled = false },
  --       }
  --     )
  --   end,
  -- },
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    lazy = false
  },
  {
    'zbirenbaum/copilot-cmp',
    config = function()
      require("copilot_cmp").setup()
    end
  },
  'tpope/vim-repeat',
  'jalvesaq/Nvim-R',
  'norcalli/nvim-colorizer.lua',
  'vimwiki/vimwiki',
  'echasnovski/mini.icons',
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
