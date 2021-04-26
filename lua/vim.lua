local set_vim_g = function()
  vim.g.mapleader = " "
end

local set_vim_o = function()
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
