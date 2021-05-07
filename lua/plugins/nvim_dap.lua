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

local function init()
	require'dap-python'.setup('/home/kenneec/.virtualenvs/debugpy/bin/python3.8', { console = 'integratedTerminal', windowSplit = '80vsplit new' })
	require'telescope'.load_extension('dap')

	vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})

	keymap()
end

local function init2()
	require'dap'.adapters.python = {
	  type = 'executable';
	  command = '/home/kenneec/.virtualenvs/debugpy/bin/python3.8';
	  args = { '-m', 'debugpy.adapter' };
	}
	require'dap'.configurations.python = {
	  {
	    type = 'python';
			request = 'launch';
	    name = "Launch file";
			console = "integratedTerminal";
			windowSplit = '80vsplit new';

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
  
	vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
	keymap()
end

return {
	init = init2
}
