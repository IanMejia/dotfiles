-- treesitter basic configurations for most used languages
local treesitter = require'nvim-treesitter.configs'

treesitter.setup{
    ensure_installed = {
        'bash',
        'clojure',
        'commonlisp',
        'dart',
        'go',
        'haskell',
        'html',
        'julia',
        'lua',
        'ocaml',
        'python',
        'r',
        'rust'
    },
    highlight = {
        enable = true
    }
}
