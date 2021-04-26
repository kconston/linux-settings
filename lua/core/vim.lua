local set_vim_g = function()
  vim.g.mapleader = " "
end

local set_vim_o = function()
  local settings = {
    backup = false,
    errorbells = false,
    expandtab = true,
    hidden = true,
    scrolloff = 3,
    softtabstop = 2,
    showmode = false,
    termguicolors = true
  }

  for k, v in pairs(settings) do
    vim.o[k] = v
  end

  vim.cmd('set encoding=utf8')

end

local set_vim_wo = function()
  vim.wo.number = true
  vim.wo.relativenumber = true
  vim.wo.wrap = false
end

function VimInit()
  set_vim_g()
  set_vim_o()
  set_vim_wo()
end
