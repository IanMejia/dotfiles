-- treesitter basic configurations for most used languages
local treesitter = require'nvim-treesitter.configs'

treesitter.setup{
    ensure_installed = {
        'bash',
        'clojure',
        'dart',
        'go',
        'html',
        'julia',
        'latex',
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
