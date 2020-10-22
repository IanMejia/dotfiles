-- treesitter basic configurations for most used languages

require'nvim-treesitter.configs'.setup{
    ensure_installed = {
        'julia',
        'go',
        'bash',
        'lua',
        'dart'
    },
    highlight = {
        enable = true
    }
}