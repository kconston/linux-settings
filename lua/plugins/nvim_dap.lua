local function init1()
		--require('dap-python').setup('/home/kenneec/.local/lib/python4.8/site-packages')
	local dap = require('dap')
	dap.configurations.python = {
		{
    	-- The first three options are required by nvim-dap
    	--type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    	--request = 'launch';
    	--name = "Launch file";

    	-- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    	program = "${file}"; -- This configuration will launch the current file if used.
    --[[	pythonPath = function()
    	  -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
    	  -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
    	  -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
    	  local cwd = vim.fn.getcwd()
    	  if vim.fn.executable(cwd .. '/venv/bin/python') then
    	    return cwd .. '/venv/bin/python'
    	  elseif vim.fn.executable(cwd .. '/.venv/bin/python') then
    	    return cwd .. '/.venv/bin/python'
    	  else
    	    return '/usr/bin/python'
    	  end
    	end; --]]
		} 	
	}
end

local function init()
	require'dap-python'.setup('/home/kenneec/.virtualenvs/debugpy/bin/python3')
  --require'dap-python'.setup('/home/kenneec/.local/lib/python3.9/site-packages')
	require'telescope'.load_extension('dap')

	vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

	require'dapui'.setup()
end

return {
	init = init
}
