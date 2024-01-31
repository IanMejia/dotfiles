local dap = require('dap')
local vim = vim

--local py_dap = require('dap-python')
--py_dap.setup('~/.virtualenvs/debugpy/bin/python')
local function py_path()
  local venv_path = vim.fn.getenv 'VIRTUAL_ENVIRONMENT'
  if venv_path ~= vim.NIL and venv_path ~= '' then
    return venv_path .. '/bin/python'
  else
    return '/usr/bin/python'
  end
end

dap.adapters.python = {
  type = 'executable',
  command = os.getenv('HOME') .. '/.virtualenvs/debugpy/bin/python',
  args = { '-m', 'debugpy.adapter' },
}

dap.configurations.python = {
  {
    name = 'Pytest',
    type = 'python',
    request = 'launch',
    cwd = vim.fn.getcwd(),
    program = 'pytest',
    pythonPath = py_path(),
  },
  {
    name = 'Plain Debug',
    type = 'python',
    request = 'launch',
    cwd = vim.fn.getcwd(),
    program = "${file}",
    pythonPath = py_path(),
  },
}
