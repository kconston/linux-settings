local function keymaps()
	local map = vim.api.nvim_set_keymap
	local options = { noremap = true }

	map('n', '<leader>xx', '<CMD>TroubleToggle<CR>', options)
	map('n', '<leader>xw', '<CMD>TroubleToggle lsp_workspace_diagnostics<CR>', options)
	map('n', '<leader>xd', '<CMD>TroubleToggle lsp_document_diangostics<CR>', options)
end

local function init()
	keymaps()
end

return {
	init = init
}
