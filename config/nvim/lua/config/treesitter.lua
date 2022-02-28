-- treesitter basic configurations for most used languages
local treesitter = require'nvim-treesitter.configs'

treesitter.setup{
    ensure_installed = {
        'bash',
        'clojure',
        'commonlisp',
        'dart',
        'fennel',
        'go',
        'graphql',
        'html',
        'julia',
        'javascript',
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
