local packer = require"plugins.packer"
local telescope = require "plugins.telescope"
local gitsigns = require "plugins.gitsigns"
local git_worktree = require "plugins.git_worktree"
local bufferline = require "plugins.nvim_bufferline"
local treesitter = require "plugins.treesitter"
local lualine = require "plugins.lualine"
local floaterm = require "plugins.floaterm"
local compe = require "plugins.compe"
local compe_tabnine = require "plugins.compe_tabnine"
local lspconfig = require "plugins.lspconfig"

local function init()
  packer.init()
  
  lspconfig.init()
  treesitter.init()
  compe.init()
  --compe_tabnine.init()

	gitsigns.init()
  git_worktree.init()

  bufferline.init()
  lualine.init()
  telescope.init()
  floaterm.init()
end

return {
  init = init
}

