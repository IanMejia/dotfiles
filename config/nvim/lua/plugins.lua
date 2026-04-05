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
    -- dependencies = { 'PaterJason/cmp-conjure' }
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
  --  {
  --    'ggandor/leap.nvim',
  --    lazy = false,
  --    config = function() require('leap').leap { backward = true } end,
  --  },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-locals',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'RRethy/nvim-treesitter-endwise',
      'windwp/nvim-ts-autotag',
    },
    build = ';TSUpdate',
    lazy=false,
    -- event = { 'BufReadPost', 'BufNewFile' },
    config = function()
      require 'config.treesitter'
    end,
  },
  {
    'neovim/nvim-lspconfig',
    lazy = false,
  },
  {
    'nvimdev/lspsaga.nvim',
    event = { 'LspAttach' },
    opts = {},
  },
  -- {
  --   'hrsh7th/nvim-cmp',
  --   lazy = false,
  --   dependencies = {
  --     'L3MON4D3/LuaSnip',
  --     'hrsh7th/cmp-buffer',
  --     'hrsh7th/cmp-cmdline',
  --     'hrsh7th/cmp-nvim-lsp',
  --     'hrsh7th/cmp-path',
  --     'saadparwaiz1/cmp_luasnip',
  --   },
  --   config = function() require 'config.cmp' end

  -- },
  {
    'saghen/blink.cmp',
    version = '1.*',
    dependencies = { 'fang2hou/blink-copilot', 'rafamadriz/friendly-snippets' },
    opts = {
      sources = {
        default = { 'lsp', 'buffer', 'snippets', 'path', 'copilot' },
        providers = {
          copilot = {
            name = 'copilot',
            module = 'blink-copilot',
            score_offset = 100,
            async = true,
          },
        },
      },
      keymap = {
        preset = 'super-tab',
        ['<Tab>'] = {
          function(cmp)
            if vim.b[vim.api.nvim_get_current_buf()].nes_state then
              cmp.hide()
              return (
                require('copilot-lsp.nes').apply_pending_nes()
                and require('copilot-lsp.nes').walk_cursor_end_edit()
              )
            end
            if cmp.snippet_active() then
              return cmp.accept()
            else
              return cmp.select_and_accept()
            end
          end,
          'snippet_forward',
          'fallback',
        },
      },
    },
    lazy = false
  },
  {
    'nvim-lualine/lualine.nvim',
    lazy = false,
    config = function() require 'config.lualine' end
  },
  {
    'ray-x/go.nvim',
    ft = { 'go', 'gomod' },
    config = function() require('go').setup() end,
    event = { 'CmdlineEnter' },
    dependencies = {
      'ray-x/guihua.lua',
    },
    -- build = ';lua require('go.install').update_all_sync()'
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^7', -- Recommended
    lazy = false,   -- This plugin is already lazy
    ft = 'rust'
  },
  {
    'rest-nvim/rest.nvim',
    ft = 'http',
    dependencies = { 'luarocks.nvim' },
    config = function()
      require('rest-nvim').setup()
    end,
    lazy = false,
  },
  {
    'nvim-telescope/telescope.nvim',
    config = function() require 'config.telescope' end,
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
    'olimorris/codecompanion.nvim',
    config = function() require 'config.codecompanion' end,
    lazy = false,
  },
  {
    'tpope/vim-sexp-mappings-for-regular-people',
    dependencies = 'guns/vim-sexp'
  },
  {
    'akinsho/flutter-tools.nvim',
    ft = 'flutter',
    opts = {}
  },
  {
    'hkupty/iron.nvim',
    config = function() require 'config.iron' end,
    cmd = 'IronRepl',
  },
  {
    'tpope/vim-fugitive',
    cmd = 'Git',
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' },
    opts = {},
    lazy = false
  },
  {
    'zbirenbaum/copilot.lua',
    dependencies = { 'copilotlsp-nvim/copilot-lsp' },
    cmd = 'Copilot',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup(
        {
          suggestion = { enabled = false },
          panel = { enabled = false },
        }
      )
    end,
  },
  {
    'copilotlsp-nvim/copilot-lsp',
    init = function()
      vim.g.copilot_nes_debounce = 500
      vim.lsp.enable('copilot_ls')
      vim.keymap.set('n', '<tab>', function()
        local bufnr = vim.api.nvim_get_current_buf()
        local state = vim.b[bufnr].nes_state
        if state then
          local _ = require('copilot-lsp.nes').walk_cursor_start_edit()
              or (
                require('copilot-lsp.nes').apply_pending_nes()
                and require('copilot-lsp.nes').walk_cursor_end_edit()
              )
          return nil
        else
          return '<C-i>'
        end
      end, { desc = 'Accept Copilot NES suggestion', expr = true })
    end,
  },
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
    lazy = false
  },
  -- {
  --   'zbirenbaum/copilot-cmp',
  --   config = function()
  --     require('copilot_cmp').setup()
  --   end
  -- },
  {
    'mason-org/mason.nvim',
    opts = {},
    cmd = { 'Mason', 'MasonInstall', 'MasonUninstall', 'MasonUninstallAll', 'MasonUpdate', 'MasonLogs' }
  },
  {
    'kristijanhusak/vim-dadbod-ui',
    dependencies = {
      { 'tpope/vim-dadbod',                     lazy = true },
      { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true }, -- Optional
    },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Your DBUI configuration
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show({ global = false })
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
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
