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
