-- treesitter basic configurations for most used languages
local treesitter = require'nvim-treesitter.configs'

treesitter.setup{
    ensure_installed = {
        'julia',
        'go',
        'bash',
        'lua',
        'dart',
        'python',
        'ocaml'
    },
    highlight = {
        enable = true
    }
}
