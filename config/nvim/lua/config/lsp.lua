-- lsp configuration --
-- local lsp_status = require('lsp-status')
local nvim_lsp = require 'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Python
nvim_lsp.pyright.setup {
  capabilities = capabilities,
}
-- nvim_lsp.jedi_language_server.setup{}

-- eslint
nvim_lsp.eslint.setup {
  capabilities = capabilities,
}

--- Typescript
nvim_lsp.tsserver.setup {
  capabilities = capabilities,
}

-- Rust
nvim_lsp.rust_analyzer.setup {
  capabilities = capabilities,
}

-- Clojure
nvim_lsp.clojure_lsp.setup {
  capabilities = capabilities,
}

-- Bash
nvim_lsp.bashls.setup {
  capabilities = capabilities,
}

-- Haskell
nvim_lsp.hls.setup {
  capabilities = capabilities,
}

-- Julia
nvim_lsp.julials.setup{
  capabilities = capabilities,
}

-- Golang
nvim_lsp.gopls.setup {
  capabilities = capabilities,
}

-- Lua
nvim_lsp.lua_ls.setup {
  capabilities = capabilities,
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

