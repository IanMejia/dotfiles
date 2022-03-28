-- lsp configuration --
-- local lsp_status = require('lsp-status')
local nvim_lsp   = require'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities() capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Python
nvim_lsp.pyright.setup{}

-- eslint
nvim_lsp.eslint.setup{}

--- Typescript
nvim_lsp.tsserver.setup{}

-- Rust
nvim_lsp.rust_analyzer.setup{}

-- Clojure
nvim_lsp.clojure_lsp.setup{}

-- Bash
nvim_lsp.bashls.setup{}

-- Haskell
nvim_lsp.hls.setup{}

-- Golang
nvim_lsp.gopls.setup{
  cmd = {"gopls", "serve"},
  settings = {
      gopls = {
          analyses = {
              unusedparams = true,
          },
          staticcheck = true,
      },
  },
}
-- Lua
local sumneko_root_path = '/opt/homebrew/Cellar/lua-language-server/2.6.7/libexec'
local sumneko_binary = sumneko_root_path .. '/bin/lua-language-server'
nvim_lsp.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  capabilities = capabilities;
  settings = { Lua = {
      runtime = {
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

-- Julia
nvim_lsp.julials.setup{
    on_new_config = function(new_config, _)
        server_path = '/home/crash/.julia/packages/LanguageServer/y1ebo/src'
        cmd = {
            "julia",
            "--project="..server_path,
            "--startup-file=no",
            "--history-file=no",
            "-e", [[
              using Pkg;
              Pkg.instantiate()
              using LanguageServer; using SymbolServer;
              depot_path = get(ENV, "JULIA_DEPOT_PATH", "")
              project_path = dirname(something(Base.current_project(pwd()), Base.load_path_expand(LOAD_PATH[2])))
              # Make sure that we only load packages from this environment specifically.
              @info "Running language server" env=Base.load_path()[1] pwd() project_path depot_path
              server = LanguageServer.LanguageServerInstance(stdin, stdout, project_path, depot_path);
              server.runlinter = true;
              run(server);
          ]]
    };
      new_config.cmd = cmd
    end
}
