local dap = require('dap')
local vim = vim

--local py_dap = require('dap-python')
--py_dap.setup('~/.virtualenvs/debugpy/bin/python')

local function festivus_debug(type, integration, needs_proxy, creds)
    local base_args = {creds}
    if type == 'auth' then
        table.insert(base_args, 1, integration .. '::auth')
    elseif type == 'claims' then
        table.insert(base_args, 1, integration .. '::fetch_claims')
        local with_mama_nayya = vim.fn.input('Need Mama Nayya?(y/n): ')
        if with_mama_nayya == 'y' then
            table.insert(base_args, 1, '--integration_options_path=mama_nayyacreds.json')
        end
    else
        table.insert(base_args, 1, integration .. '::fetch_plan_summary')
    end

    if needs_proxy == 'y' then
        table.insert(base_args, 1, '--proxy=http://localhost:8888')
    end
    return base_args
end

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
            return festivus_debug('auth', integration, with_proxy, creds)
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
            return festivus_debug('claims', integration, with_proxy, creds)
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
            return festivus_debug('summary', integration, with_proxy, creds)
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
