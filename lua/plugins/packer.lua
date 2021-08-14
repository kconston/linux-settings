 local function PackerVerify()
  local cmd = vim.api.nvim_command
  local fn = vim.fn

  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    cmd'packadd packer.nvim'
  end
end

function PackerInit()
  require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'mfussenegger/nvim-jdtls'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use {
      'lspcontainers/lspcontainers.nvim',
      requires = {'neovim/nvim-lspconfig'}
    }

    use {
      'hrsh7th/nvim-compe',
      requires = { 'neovim/nvim-lspconfig' }
    }
    use {
      'erkrnt/compe-tabnine',
      requires = 'hrsh7th/nvim-compe',
      run='~/.local/share/nvim/site/pack/packer/start/compe-tabnine/install.sh'
    }

    use'norcalli/snippets.nvim'
    use {
      'nvim-treesitter/nvim-treesitter',
      requires = { "neovim/nvim-lspconfig" },
      run = ":TSUpdate"
    }

    --Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' }
    }

    --Theme
    use 'folke/tokyonight.nvim'

    --Git
    use {
      'ThePrimeagen/git-worktree.nvim',
      requires = { 'nvim-telescope/telescope.nvim' }
    }
    use 'lewis6991/gitsigns.nvim'

    use 'voldikss/vim-floaterm'

    -- Sessions
    use {
      'rmagatti/auto-session'
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

    use { 'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
    use 'junegunn/fzf.vim'

		use 'phaazon/hop.nvim'

		use {
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("todo-comments").setup{}
			end
		}

		use {
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()require("trouble").setup{}	end
		}

		--Debugger
    use {
      'mfussenegger/nvim-dap-python',
      requires = { 'mfussenegger/nvim-dap' }
    }
		use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}
		use { "theHamsta/nvim-dap-virtual-text", requires = {"mfussenegger/nvim-dap"}}
		use { "nvim-telescope/telescope-dap.nvim" }
		use { "tweekmonster/braceless.vim" }
  end)
end

local function init()
  PackerVerify()
  PackerInit()
end

return {
  init = init
}
