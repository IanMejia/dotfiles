require("flutter-tools").setup{} -- use defaults

-- alternatively you can override the default configs
require("flutter-tools").setup {
  experimental = { -- map of feature flags
    lsp_derive_paths = false, -- experimental: Attempt to find the user's flutter SDK
  },
  debugger = { -- experimental: integrate with nvim dap
    enabled = false,
  },
  flutter_path = "/usr/bin/flutter", -- <-- this takes priority over the lookup
  flutter_lookup_cmd = nil, -- example "dirname $(which flutter)" or "asdf where flutter"
  widget_guides = {
    enabled = false,
  },
  closing_tags = {
    highlight = "ErrorMsg", -- highlight for the closing tag
    prefix = ">" -- character to use for close tag e.g. > Widget
  },
  dev_log = {
    open_cmd = "tabedit", -- command to use to open the log buffer
  },
  outline = {
    open_cmd = "30vnew", -- command to use to open the outline buffer
  },
  lsp = {
    settings = {
      showTodos = true,
      --completeFunctionCalls = true -- NOTE: this is WIP and doesn't work currently
    }
  }
}
