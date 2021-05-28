local compe = require'compe'

compe.setup{
    enabled = true;
    autocomplete = true;
    debug = false;
    min_length = 1;
    preselect = 'enable';
    throttle_time = 80;
    source_timeout = 200;
    incomplete_delay = 400;
    allow_prefix_unmatch = false;
    max_abbr_width = 1000;
    max_kind_width = 1000;
    max_menu_width = 1000000;
    documentation = true;

    source = {
        path = true;
        buffer = true;
        snippets_nvim = true;
        nvim_lsp = true;
        nvim_lua = true;
        treesitter = true;
        spell = true;
        calc = true;
        tags = true;
    };
}
