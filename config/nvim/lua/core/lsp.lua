-- Python
vim.lsp.config(
  'pyright', {
    capabilities = capabilities,
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          diagnosticMode = 'openFilesOnly',
        },
      },
    }
  }
)

vim.lsp.enable('pyright')


local noconf_lsps = {
  'ruff',
  'eslint',
  'ts_ls',
  'rust_analyzer',
  'clojure_lsp',
  'roc_ls',
  'bashls',
  'hls',
  'elmls',
  'gopls',
  'sqls',
  'r_language_server',
  'terraform_lsp',
  'tflint',
  'lua_ls',
}

for _, lsp in ipairs(noconf_lsps) do
  -- vim.lsp.config(lsp, {})
  vim.lsp.enable(lsp)
end
