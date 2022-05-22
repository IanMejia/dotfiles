-- lsp configuration --
-- local lsp_status = require('lsp-status')
local nvim_lsp = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Python
nvim_lsp.pyright.setup {}
-- nvim_lsp.jedi_language_server.setup{}

-- eslint
nvim_lsp.eslint.setup {}

--- Typescript
nvim_lsp.tsserver.setup {}

-- Rust
nvim_lsp.rust_analyzer.setup {}

-- Clojure
nvim_lsp.clojure_lsp.setup {}

-- Bash
nvim_lsp.bashls.setup {}

-- Haskell
nvim_lsp.hls.setup {}

-- Julia
nvim_lsp.julials.setup{}

-- Golang
nvim_lsp.gopls.setup {}

-- Lua
nvim_lsp.sumneko_lua.setup {
  capabilities = capabilities;
  settings = { Lua = {
    runtime = {
      version = 'LuaJIT',
      -- Setup your lua path
      path = vim.split(package.path, ';'),
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = { 'vim' },
    },
    workspace = {
      -- Make the server aware of Neovim runtime files
      library = vim.api.nvim_get_runtime_file("", true),
    },
    -- Do not send telemetry data containing a randomized but unique identifier
    telemetry = {
      enable = false,
    },
  },
  },
}

