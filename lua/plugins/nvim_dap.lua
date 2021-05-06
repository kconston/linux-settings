local function keymap()
	local map = vim.api.nvim_set_keymap
  local options = { noremap = true }
  map('n', '<leader>b', '<CMD>lua require"dap".toggle_breakpoint()<CR>', options)
	map('n', '<leader>dc', '<CMD>lua require"dap".continue()<CR>', options)
	map('n', '<leader>do', '<CMD>lua require"dap".step_over()<CR>', options)
  map('n', '<leader>di', '<CMD>lua require"dap".step_into()<CR>', options)
  map('n', '<leader>du', '<CMD>lua require"dap".step_out()<CR>', options)
	--map('n', '<silent> <leader>B', ':lua require(dap).set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
end

local function init_manual()
	local dap = require('dap')

  dap.adapters.python = {
  	type = 'executable';
  	command = '/home/kenneec/.virtualenvs/debugpy/bin/python3.8';
		args = { '-m', 'debugpy.adapter' };
	}

	dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

		console = "integratedTerminal";
    program = "${file}"; -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python3.8') then
        return cwd .. '/venv/bin/python3.8'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}
end

local function init()
	require'dap-python'.setup('/home/kenneec/.virtualenvs/debugpy/bin/python3.8', { console = 'integratedTerminal' })
	require'telescope'.load_extension('dap')

	vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

	keymap()
  --require'dapui'.setup()
end

return {
	init = init
}
