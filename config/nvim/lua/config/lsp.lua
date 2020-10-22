-- lsp configuration --

-- local lsp_status = require('lsp-status')
local nvim_lsp   = require'nvim_lsp'
local attach_hook = require'completion'.on_attach

local installed_lsp = {
    'julials',
    'sumneko_lua',
    'texlab'
}

nvim_lsp.sumneko_lua.setup{}

for _,lsp in ipairs(installed_lsp) do
    nvim_lsp[lsp].setup{
        on_attach    = attach_hook,
    }
end
