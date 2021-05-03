local function packer_verify()
  local cmd = vim.api.nvim_command
  local fn = vim.fn

  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
    cmd 'packadd packer.nvim'
  end
end

function PackerInit()
  packer_verify()

  require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'neovim/nvim-lspconfig'
    use {
      'hrsh7th/nvim-compe',
      requires = { 'neovim/nvim-lspconfig' }
    }
    use {
      'tzachar/compe-tabnine',
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

  end)
end

local function init()
  PackerInit()
end

return {
  init = init
}
