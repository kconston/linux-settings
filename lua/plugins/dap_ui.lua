local function init()
	require("dapui").setup({
  	icons = {
  	  expanded = "⯆",
  	  collapsed = "⯈",
  	  circular = "↺"
  	},
  	mappings = {
  	  expand = "<CR>",
  	  open = "o",
  	  remove = "d"
  	},
  	sidebar = {
  	  elements = {
  	    -- You can change the order of elements in the sidebar
  	    "scopes",
  	    "stacks",
  	    --"watches"
  	  },
  	  width = 40,
  	  position = "left" -- Can be "left" or "right"
  	},
		tray = {
			elements = {},
  	  height = 10,
  	  position = "bottom",-- Can be "bottom" or "top"
  	},
  	floating = {
   	  max_height = .9, -- These can be integers or a float between 0 and 1.
  	  max_width = .8,  -- Floats will be treated as percentage of your screen.
  	},
  })

	local map = vim.api.nvim_set_keymap
	local options = { noremap = true }

	map('n', '<leader>dr', '<CMD>lua require("dapui").float_element(repl)<CR>', options)
end

return {
	init = init
}
