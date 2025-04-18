-- lsp configuration --
-- local lsp_status = require('lsp-status')
local nvim_lsp = require 'lspconfig'
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Python
nvim_lsp.pyright.setup {
  capabilities = capabilities,
  -- This might not be necessary but just in case we happen to need it, we can uncomment it
  settings = {
    python = {
      analysis = {
        autoImportCompletions = true,
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        typeCheckingMode = "off",
        useLibraryCodeForTypes = true,
      },
    },
  },
}
nvim_lsp.ruff.setup {
  capabilities = capabilities,
}

-- eslint
nvim_lsp.eslint.setup {
  capabilities = capabilities,
}

--- Typescript
nvim_lsp.ts_ls.setup {
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

-- roc
nvim_lsp.roc_ls.setup{}

-- Bash
nvim_lsp.bashls.setup {
  capabilities = capabilities,
}

-- Haskell
nvim_lsp.hls.setup {
  capabilities = capabilities,
}

-- elm
nvim_lsp.elmls.setup {
  capabilities = capabilities,
}

-- Golang
nvim_lsp.gopls.setup {
  capabilities = capabilities,
}

-- Sql
nvim_lsp.sqls.setup {
  capabilities = capabilities,
}

-- R
nvim_lsp.r_language_server.setup {}

-- Terraform
nvim_lsp.terraform_lsp.setup {}
nvim_lsp.tflint.setup {}

-- Lua
nvim_lsp.lua_ls.setup {}
-- nvim_lsp.lua_ls.setup {
--   capabilities = capabilities,
--   settings = { Lua = {
--     runtime = {
--       version = 'LuaJIT',
--       -- Setup your lua path
--       path = vim.split(package.path, ';'),
--     },
--     diagnostics = {
--       -- Get the language server to recognize the `vim` global
--       globals = { 'vim' },
--     },
--     workspace = {
--       -- Make the server aware of Neovim runtime files
--       library = vim.api.nvim_get_runtime_file("", true),
--     },
--     -- Do not send telemetry data containing a randomized but unique identifier
--     telemetry = {
--       enable = false,
--     },
--   },
--   },
-- }
