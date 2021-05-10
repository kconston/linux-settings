local load_lualine = function()
  require("lualine").setup {
    options = {
      extensions = { 'fzf' },
      theme = 'tokyonight'
    },
    sections = {
			lualine_a = {'mode'},
      lualine_b = {
				{
	  			'branch'
				},
      	{
      	    'diff',
      	    symbols = { added = ' ', removed = ' ', modified = ' '},
      	    color_added = '#66a358',
      	    color_modified = '#1eafff',
      	    color_info = '#FFFFFF',
      	    color_removed = '#dd2f23'
      	}
      },
			lualine_c = {'filename'},
			lualine_x = {'encoding', 'fileformat', 'filetype'},
			lualine_y = {'progress'},
			lualine_z = {'location'}
    }
  }
end

local function init()
  load_lualine()
end

return {
  init = init
}

