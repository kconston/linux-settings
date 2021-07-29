local function init()
  require "plugins.packer".init()
  require "plugins.lualine".init()

  require "plugins.lspconfig".init()
  require "plugins.treesitter".init()
  require "plugins.compe".init()
  require "plugins.compe_tabnine".init()

  require "plugins.gitsigns".init()
  require "plugins.git_worktree".init()

  require "plugins.nvim_bufferline".init()
  require "plugins.telescope".init()
  require "plugins.floaterm".init()

  require "plugins.hop".init()
  require "plugins.todo_comments".init()
  require "plugins.trouble".init()

  --debugger
  require "plugins.nvim_dap".init()
  require "plugins.dap_ui".init()
  require "plugins.dap_vt".init()
end

return {
  init = init
}

