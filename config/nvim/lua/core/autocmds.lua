local vim = vim

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- automatic number toggle
local number_toggle = augroup('numbertoggle', { clear = true })

autocmd({'InsertLeave'}, {
  pattern = '*',
  group = number_toggle,
  command = 'setlocal relativenumber'
})

autocmd({'InsertEnter'}, {
  pattern = '*',
  group = number_toggle,
  command = 'setlocal norelativenumber'
})

-- automatic terraform formats
autocmd({'BufRead', 'BufNewFile'}, {
  pattern = { '*.tf', '*.tfvars' },
  command = 'set filetype=terraform'
})

autocmd({'BufRead', 'BufNewFile'}, {
  pattern = { '*.hcl', '*.terraformrc' },
  command = 'set filetype=hcl'
})

autocmd({'BufRead', 'BufNewFile'}, {
  pattern = { '*.tf', '*.tfvars', '*.hcl', '*.terraformrc' , "*.lua" },
  command = 'setlocal shiftwidth=2 tabstop=2'
})
