local dap = require('dap')
local vim = vim

--local py_dap = require('dap-python')
--py_dap.setup('~/.virtualenvs/debugpy/bin/python')
local function py_path()
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/opt/homebrew/bin/python3'
      end
    end;

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
