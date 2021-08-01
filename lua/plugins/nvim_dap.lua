local function keymap()
	local map = vim.api.nvim_set_keymap
  local options = { noremap = true }
  map('n', '<leader>db', '<CMD>lua require"dap".toggle_breakpoint()<CR>', options)
	map('n', '<leader>dc', '<CMD>lua require"dap".continue()<CR>', options)
	map('n', '<leader>do', '<CMD>lua require"dap".step_over()<CR>', options)
  map('n', '<leader>di', '<CMD>lua require"dap".step_into()<CR>', options)
  map('n', '<leader>du', '<CMD>lua require"dap".step_out()<CR>', options)
	--map('n', '<silent> <leader>B', ':lua require(dap).set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
end

local function init()
  --FIXME: update the paths here
	require'dap-python'.setup('~/.local/share/virtualenv/debugpy/bin/python', { console = 'integratedTerminal' })
  --~/.local/share/virtualenv/debugpy/bin/python
	require'telescope'.load_extension('dap')
	require'dap'.defaults.python.terminal_win_cmd = '70vsplit new';
  require'dap'.set_log_level('TRACE')
	vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

	keymap()
end

local function init2()
	require'dap'.adapters.python = {
	  type = 'executable';
    --FIXME: Update the paths here
	  command = '/home/kenneec/.virtualenvs/debugpy/bin/python3.8';
	  args = { '-m', 'debugpy.adapter' };
	}
	require'dap'.configurations.python = {
	  {
	    type = 'python';
			request = 'launch';
	    name = "Launch file";
			console = "integratedTerminal";
			--windowSplit = '80vsplit new';

      --FIXME: Update the paths here
			program = "${file}";
			pythonPath = function()
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

	require'dap'.defaults.python.terminal_win_cmd = '80vsplit new';

	vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
	keymap()
end

return {
	init = init
}
