-- lsp configuration --

-- local lsp_status = require('lsp-status')
local nvim_lsp   = require'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities.textDocument.completion.completionItem.snippetSupport = true

local installed_lsp = {
    'texlab',
    'bashls'
}

nvim_lsp.sumneko_lua.setup{}

for _,lsp in ipairs(installed_lsp) do
    nvim_lsp[lsp].setup{
        capabilities = capabilities;
        on_attach = on_attach,
    }
end

