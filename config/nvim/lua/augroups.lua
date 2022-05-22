local vim = vim

-- automatic number toggle
local number_toggle = vim.api.nvim_create_augroup('numbertoggle', { clear = true })

vim.api.nvim_create_autocmd({'InsertLeave'}, {
  pattern = '*',
  group = number_toggle,
  command = 'setlocal relativenumber'
})
vim.api.nvim_create_autocmd({'InsertEnter'}, {
  pattern = '*',
  group = number_toggle,
  command = 'setlocal norelativenumber'
})
