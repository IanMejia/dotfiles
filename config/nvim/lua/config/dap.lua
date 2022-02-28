local dap = require('dap')
local vim = vim

--local py_dap = require('dap-python')
--py_dap.setup('~/.virtualenvs/debugpy/bin/python')

dap.adapters.python = {
    type = 'executable',
    command = os.getenv('HOME') .. '/.virtualenvs/debugpy/bin/python',
    args = {'-m', 'debugpy.adapter'},
}

dap.configurations.python = {
    {
        name = 'Debug Auth',
        type = 'python',
        request = 'launch',
        cwd = vim.fn.getcwd(),
        program = vim.fn.getcwd() .. '/dev/debug.py',
        args = function()
            local integration = vim.fn.input('Integration Name: ')
            local creds = integration .. 'creds.json'
            local with_proxy = vim.fn.input('Need proxy?(y/n): ')
            if with_proxy == 'y' then
                return {'--proxy=http://localhost:8888',
                        integration .. '::auth',
                        creds}
            else
                return {integration .. '::auth',
                        creds}
            end
        end,
        pythonPath = vim.fn.getcwd() .. '/.venv/festivus-claims-integrations/bin/python3',
    },
    {
        name = 'Debug Claims',
        type = 'python',
        request = 'launch',
        cwd = vim.fn.getcwd(),
        program = vim.fn.getcwd() .. '/dev/debug.py',
        args = function()
            local integration = vim.fn.input('Integration Name: ')
            local creds = integration .. 'creds.json'
            local with_proxy = vim.fn.input('Need proxy?(y/n): ')
            if with_proxy == 'y' then
                return {'--proxy=http://localhost:8888',
                        integration .. '::fetch_claims',
                        creds}
            else
                return {integration .. '::fetch_claims',
                        creds}
            end
        end,

        pythonPath = vim.fn.getcwd() .. '/.venv/festivus-claims-integrations/bin/python3',
    },
    {
        name = 'Debug Summary',
        type = 'python',
        request = 'launch',
        cwd = vim.fn.getcwd(),
        program = vim.fn.getcwd() .. '/dev/debug.py',
        args = function()
            local integration = vim.fn.input('Integration Name: ')
            local creds = integration .. 'creds.json'
            local with_proxy = vim.fn.input('Need proxy?(y/n): ')
            if with_proxy == 'y' then
                return {'--proxy=http://localhost:8888',
                        integration .. '::fetch_plan_summary',
                        creds}
            else
                return {integration .. '::fetch_plan_summary',
                        creds}
            end
        end,
        pythonPath = vim.fn.getcwd() .. '/.venv/festivus-claims-integrations/bin/python3',
    },
    {
        name = 'Pytest',
        type = 'python',
        request = 'launch',
        cwd = vim.fn.getcwd(),
        program = 'pytest',
        pythonPath = vim.fn.getcwd() .. '/.venv/festivus-claims-integrations/bin/python3',
    },
    {
        name = 'Plain Debug',
        type = 'python',
        request = 'launch',
        cwd = vim.fn.getcwd(),
        program = vim.fn.getcwd() .. '/scraper.py',
        pythonPath = vim.fn.getcwd() .. '/.venv/bin/python3',
    },
    {
        name = 'Lever Debug',
        type = 'python',
        request = 'launch',
        cwd = vim.fn.getcwd(),
        program = vim.fn.getcwd() .. '/dev/debug.py',
        args = function()
            local scraper = vim.fn.input('Scraper Name: ')
            return { scraper }
        end,
        pythonPath = vim.fn.getcwd() .. '/.venv/lever-spiders/bin/python3'
    }
}
