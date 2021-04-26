local function packer_verify()
  local cmd = vim.api.nvim_command
  local fn = vim.fn
  
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    cmd 'packadd packer.nvim'
  end
end

local load_telescope = function()
  require("telescope").setup{
	  defaults = {
		  file_ignore_patterns = {
			  "node_modules/.*",
			  "secret.d/.*",
			  "%.pem"
	         }
	  }
  }
  
  local map = vim.api.nvim_set_keymap
  local options = { noremap = true }
  map('n', '<leader>fe', '<CMD>lua require("telescope.builtin").file_browser{ cwd = vim.fn.expand("%:p:h") }<CR>', options)
  map('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files{ hidden = true }<CR>', options)
end

local load_lualine = function()
  require("lualine").setup{
    options = {
      theme = 'tokyonight'
    },
    sections = {
      lualine_b = { 
        {
	  'diff',
	  symbols = { added = ' ', removed = ' ', modified = ' '},
          color_added = '#66a358',
	  color_modified = '#1e1fc0',
	  color_info = '#FFFFFF',
	  color_removed = '#dd2f23'
        }
      }
    }
  }
end

function PackerInit()
  packer_verify()

  require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
  
    --Theme
    use 'folke/tokyonight.nvim'

    use {
      'neoclide/coc.nvim',
      branch = "release"
    }

    use {
      'nvim-treesitter/nvim-treesitter',
      run = ":TSUpdate"
    }
    
    --Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' }
    }

    --Lualine
    use {
      'hoob3rt/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', 'ryanoasis/vim-devicons', opt = true }
    }

    use {
	'akinsho/nvim-bufferline.lua', 
        requires = { 'kyazdani42/nvim-web-devicons', 'ryanoasis/vim-devicons' }
    }
    
    use 'junegunn/fzf.vim'

  end)

  load_telescope()
  load_lualine()
end

