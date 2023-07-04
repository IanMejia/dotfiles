-- treesitter basic configurations for most used languages
local treesitter = require'nvim-treesitter.configs'

treesitter.setup{
  textobjects = {
    swap = {
      enable = true,
      swap_next = {
	["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
	["<leader>A"] = "@parameter.inner",
      },
    },
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
  ensure_installed = {
    'bash',
    'c_sharp',
    'clojure',
    'commonlisp',
    'dart',
    'fennel',
    'go',
    'graphql',
    'haskell',
    'html',
    'javascript',
    'julia',
    'lua',
    'ocaml',
    'python',
    'r',
    'ruby',
    'rust',
    'typescript'
  },
  highlight = {
    enable = true
  }
}
