local function keymaps()
	local map = vim.api.nvim_set_keymap
	local options = { noremap = true }

	map('n', '<leader>tq', '<CMD>TodoQuickFix<CR>', options)
	map('n', '<leader>tt', '<CMD>TodoTelescope<CR>', options)
	map('n', '<leader>tr', '<CMD>TodoTrouble<CR>', options)
end

local function init()
	keymaps()
end

return {
	init = init
}
