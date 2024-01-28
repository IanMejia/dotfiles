require('nvim-treesitter.configs').setup {
    auto_install = true,
    highlight = {
        enable = true,
        max_file_lines = 5000,
    },
    textsubjects = {
        enable = true,
        lookahead = true,
        max_file_lines = 5000,
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
        },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<cr>',
            node_incremental = '<tab>',
            scope_incremental = '<cr>',
            scope_decremental = '<s-cr>',
            node_decremental = '<s-tab>',
        },
    },
    refactor = {
        smart_rename = { enable = true, keymaps = { smart_rename = 'grr' } },
        highlight_definitions = { enable = true, max_file_lines = 1000 },
    },
    endwise = { enable = true },
    matchup = {
        enable = true,
        include_match_words = true,
        enable_quotes = true,
    },
    ensure_installed = {
        'bash',
        'c_sharp',
        'clojure',
        'comment',
        'commonlisp',
        'dart',
        'fennel',
        'go',
        'graphql',
        'haskell',
        'hcl',
        'html',
        'javascript',
        'julia',
        'lua',
        'markdown',
        'markdown_inline',
        'ocaml',
        'python',
        'vim',
        'vimdoc',
        'r',
        'ruby',
        'rust',
        'terraform',
        'typescript'
    },
}
