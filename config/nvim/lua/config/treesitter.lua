-- treesitter basic configurations for most used languages

require'nvim-treesitter.configs'.setup{
    ensure_installed = {
        'julia',
        'go',
        'bash',
        'lua',
        'dart',
        'ocaml'
    },
    highlight = {
        enable = true
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = false
    }
}
