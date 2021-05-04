local load_telescope = function()
  require("telescope").setup{
	  defaults = {
		  file_ignore_patterns = {
			  "node_modules/.*",
	         }
	  },
		extensions = {
			dap = {

			}
		}
  }

  local map = vim.api.nvim_set_keymap
  local options = { noremap = true }
  map('n', '<leader>fe', '<CMD>lua require("telescope.builtin").file_browser{ cwd = vim.fn.expand("%:p:h") }<CR>', options)
  map('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files{ hidden = true }<CR>', options)
  map('n', '<leader>fs', '<CMD>lua require("telescope.builtin").live_grep()<CR>', options)
  map('n', '<leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>', options)
  map('n', '<leader>fh', '<CMD>lua require("telescope.builtin").help_tags()<CR>', options)
end

local function init()
    load_telescope()
end

return {
  init = init
}
